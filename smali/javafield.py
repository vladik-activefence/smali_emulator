from functools import total_ordering


@total_ordering
class JavaField(object):
    """Base class representing a JavaMethod."""
    def __init__(self,
                 class_name,
                 field_name,
                 field_type,
                 is_static,
                 is_private):
        self.class_name = class_name
        self.field_name = field_name
        self.field_type = field_type
        self.is_static = is_static
        self.is_private = is_private

    def __repr__(self):
        return('Field(Class=<{}>, Name=<{}>, Type=<{}>, '
               'Static=<{}>, Private=<{}>)'.format(
            *self.to_tuple()
        ))

    def to_tuple(self):
        return (
            self.class_name,
            self.field_name,
            self.field_type,
            self.is_static,
            self.is_private
        )

    def __ne__(self, other):
        return self.to_tuple().__ne__(other.to_tuple())

    def __ge__(self, other):
        return self.to_tuple().__ge__(other.to_tuple())

    def __eq__(self, other):
        return self.to_tuple().__eq__(other.to_tuple())

    def __hash__(self):
        return self.to_tuple().__hash__()
