import types


class BaseClass(object):
    """base class for java classes"""

    def __init__(self, source=None):
        self.internal = source

    @staticmethod
    def name():
        raise NotImplementedError()

    @staticmethod
    def methods():
        raise NotImplementedError()

    @classmethod
    def get_method(cls, method_name):
        return [
            method for method in cls.methods()
            if method.compact_representation() == method_name
        ][0]

    @staticmethod
    def new_instance():
        raise NotImplementedError()

    def invoke(self, method_name, arguments):
        assert method_name in self.methods(), ("Trying to invoke {} but "
                                               "absent from object definition".format(method_name))
        javaclassmethod = self.methods().get(method_name)
        return javaclassmethod(self, *arguments)
