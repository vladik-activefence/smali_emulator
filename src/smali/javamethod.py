
import re
from functools import total_ordering


def shift_key(key):
    return 'p' + str(int(re.match('p(\d+)', key).group(1)) + 1)


def shift_args(kwargs):
    """
    >>> shift_args({'p0': 3, 'p1': 4}) == {'p1': 3, 'p2': 4}
    True
    """
    return {shift_key(key): value for key, value in kwargs.items()}


def shift_args_and_insert_self(this_object, kwargs):
    """
    >>> shift_args_and_insert_self(None, {'p1': 0, 'p2': 1}) == {'p0': None, 'p1': 0, 'p2': 1}
    True
    >>> shift_args_and_insert_self(None, {'p0': 0, 'p1': 1}) == {'p0': None, 'p1': 0, 'p2': 1}
    True
    """
    output_result = shift_args(kwargs) if 'p0' in kwargs else {k: w for k, w in kwargs.items()}
    output_result['p0'] = this_object
    return output_result


@total_ordering
class JavaMethod(object):
    """Base class representing a JavaMethod."""
    def __init__(self,
                 class_name,
                 method_name,
                 input_types,
                 output_type,
                 source_code,
                 qualifier,
                 is_private=None,
                 is_static=None):
        self.base_class = None
        self.class_name = class_name
        self.method_name = method_name
        self.input_types = input_types
        self.output_type = output_type
        self.source_code = source_code
        self.qualifier = qualifier
        self.is_private = is_private
        self.is_static = is_static

    @property
    def is_static_constructor(self):
        return 'static constructor' in self.qualifier

    @property
    def is_static_private(self):
        return self.is_private and self.is_static

    @property
    def is_static_public(self):
        return 'public' in self.qualifier and self.is_static

    @staticmethod
    def from_source(cls, source_code):
        raise NotImplementedError()

    def __call__(self, base_class_or_object, *args, **kwargs):
        new_kwargs = {}
        for position, argument_type in enumerate(self.input_types):
            if argument_type == 'J':
                new_args = {'p{}'.format(k+1): kwargs['p{}'.format(k)] for k in range(position, len(kwargs))}
                kwargs.update(new_args)

        return base_class_or_object.emulator.run(
            self.source_code, args=new_kwargs if new_kwargs else kwargs,
            vm=base_class_or_object.emulator.vm
        )

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
