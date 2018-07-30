# coding: utf-8

import smali.source
import smali.parser
import smali.emulator
import smali.javafield
import smali.javamethod
import smali.javaprimitivetypes
import smali.objects.baseclass


def resolve_method(method_name, argument_list, methods):
    candidate_methods = [
        method for method in methods
        if (
                method.method_name == method_name
                and (
                    not (method.input_types or argument_list)
                    or len(method.input_types) == len(argument_list)
                ) and all(check_argument_type(argument_list, method))
        )
    ]
    if len(candidate_methods) > 1:
        raise smali.objects.baseclass.MethodResolutionFailure("Too much methods")
    elif not candidate_methods:
        raise smali.objects.baseclass.MethodResolutionFailure("Unable to find method")
    else:
        method = candidate_methods.pop()

    return method


def check_argument_type(argument_dict, method):
    if not argument_dict and not method.input_types:
        return []

    arguments = [argument_dict[key] for key in sorted(argument_dict.keys())]
    input_type = [
        smali.javaprimitivetypes.TYPE_MAPPING[smali_type]
        for smali_type in method.input_types
    ]
    return [isinstance(arg, kind) for arg, kind in zip(arguments, input_type)]


def set_baseclass_of_method(class_object, method_object):
    """Set the base class of a method (for class resolution, emulator access, etc)."""
    method_object.base_class = class_object
    return method_object


def attributes_and_methods(filepath):
    return {
        'name': classmethod(lambda cls: cls.parsed_class.class_name),
        'new_instance': lambda self: self,
        'parsed_class': JavaClassParser(filepath),
        'methods': classmethod(lambda cls: [set_baseclass_of_method(cls, method)
                                            for method in cls.parsed_class.methods]),
        'fields': classmethod(lambda cls: cls.parsed_class.fields),
    }


class MetaJavaClass(type):
    """Static information about the class (method list, field list, etc)."""
    def __new__(metacls, filepath):
        class_attributes = attributes_and_methods(filepath)
        return type.__new__(
            metacls,
            class_attributes['parsed_class'].class_name or 'empty',  # java class name
            (smali.objects.baseclass.BaseClass, ),                   # base classes
            class_attributes,                                        # class attributes
        )

    def __init__(self, filepath):
        class_attributes = attributes_and_methods(filepath)
        super(MetaJavaClass, self).__init__(
            class_attributes['parsed_class'].class_name or 'empty',  # java class name
            (smali.objects.baseclass.BaseClass,),  # base classes                                # java tuple
            class_attributes,  # class attributes
        )

class JavaClassParser(object):
    def __init__(self, filepath):
        self.filepath = filepath
        self.source = smali.source.get_source_from_file(filepath)
        self.emulator = None
        self._methods = None
        self._fields = None
        self._class_name = None

    @property
    def methods(self):
        if not self._methods:
            self._methods = []
            for (
                (qualifier, method_name, input_types, output_type),
                source_code,
            ) in smali.parser.extract_methods(self.source).items():
                self._methods.append(smali.javamethod.JavaMethod(
                    self.class_name, method_name, input_types, output_type, source_code, qualifier,
                    is_private='private' in qualifier, is_static='static' in qualifier,
                ))
        return self._methods

    @property
    def fields(self):
        if not self._fields:
            self._fields = [
                smali.javafield.JavaField(
                    self.class_name,
                    name,
                    kind,
                    'static' in qualifier,
                    'private' in qualifier,
                )
                for (qualifier, name, kind) in smali.parser.extract_attribute_names(self.source)
            ]
        return self._fields

    @property
    def class_name(self):
        if not self._class_name:
            self._class_name = smali.parser.get_classname_from_source(self.source)
        return self._class_name

    def get_class(self):
        """Should return a class object."""
        raise NotImplementedError()

    def init_object(self):
        """Usually call <clinit> on this class."""
        raise NotImplementedError()

    def get_method(self, method_name, argument_list):
        return resolve_method(
            method_name,
            argument_list,
            self.methods
        )

    def invoke(self, method_name, argument_list, emulator=None, trace=None):
        """Exec the method with given name list of arguments."""
        method = self.get_method(method_name, argument_list)
        self.emulator = (
            smali.emulator.Emulator(current=self)
            if not emulator and not self.emulator
            else self.emulator
        )
        emulator = emulator or self.emulator
        result = emulator.run(method.source_code,
                              args=argument_list,
                              trace=trace,
                              vm=emulator.vm)
        return result
