import types


class MethodResolutionFailure(Exception):
    pass


class BaseClass(object):
    """base class for java classes"""

    def __init__(self, source=None, emulator=None):
        self.internal = source
        self.emulator = emulator

    @staticmethod
    def name():
        raise NotImplementedError()

    @staticmethod
    def methods():
        raise NotImplementedError()

    @classmethod
    def get_method(cls, method_name):
        method_list_or_dict = cls.methods()
        return (
            [method for method in method_list_or_dict
             if method.compact_representation() == method_name][0]
             if isinstance(method_list_or_dict, list) else method_list_or_dict.get(method_name)
        )

    @staticmethod
    def new_instance():
        raise NotImplementedError()

    def invoke(self, method_name, arguments):
        arguments = arguments or {}
        try:
            java_class_method = self.get_method(method_name)
        except IndexError:
            raise MethodResolutionFailure("Failed to resolve method for name {}".format(method_name))
        return (
            java_class_method.__call__(self, **arguments) if isinstance(arguments, dict)
            else java_class_method.__call__(self, *arguments)
        )

