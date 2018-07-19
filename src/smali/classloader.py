import smali.javaclass

from smali.objects import (
    String,
    StringBuilder,
    Integer,
)

class ClassLoader(object):
    """Load a class and keep the class name in a dictionary."""
    def __init__(self, *args, **kwargs):
        self.loaded_classes = kwargs.get('loaded_classes') or {}
        self.load_std_lib_classes()

    def load_std_lib_classes(self):
        self.loaded_classes.update({
            String.name(): String,
            StringBuilder.name(): StringBuilder,
            Integer.name(): Integer,
        })

    def load_class(self, filename):
        new_class = smali.javaclass.MetaJavaClass(filename)
        new_class.classloader = self
        self.loaded_classes[new_class.__name__] = new_class
        return new_class