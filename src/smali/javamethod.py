from functools import total_ordering


@total_ordering
class JavaMethod(object):
    """Base class representing a JavaMethod."""
    def __init__(self,
                 class_name,
                 method_name,
                 input_types,
                 output_type,
                 source_code,
                 is_private=None,
                 is_static=None):
        self.class_name = class_name
        self.method_name = method_name
        self.input_types = input_types
        self.output_type = output_type
        self.source_code = source_code
        self.is_private = is_private
        self.is_static = is_static

    @staticmethod
    def fromSource(cls, source_code):
        # methods = smali.parser.extract_methods(source_code)
        pass


    def compact_representation(self):
        return '{}({}){}'.format(
            self.method_name, ''.join(self.input_types), self.output_type
        )


    def __repr__(self):
        return('Method(Class=<{}>, Name=<{}>, Args=<{}>, Output=<{}>'
               ', Static=<{}>, Private=<{}>)'.format(*self.to_tuple()))

    def to_tuple(self):
        return(self.class_name, self.method_name, self.input_types,
               self.output_type, self.is_static, self.is_private)

    def __ne__(self, other):
        return self.to_tuple().__ne__(other.to_tuple())

    def __ge__(self, other):
        return self.to_tuple().__ge__(other.to_tuple())

    def __eq__(self, other):
        return self.to_tuple().__eq__(other.to_tuple())

    def __hash__(self):
        return self.to_tuple().__hash__()
