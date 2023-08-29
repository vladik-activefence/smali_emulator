# -*- coding: utf-8 -*-
# This file is part of the Smali Emulator.
#
# Copyright(c) 2016 Simone 'evilsocket' Margaritelli
# evilsocket@gmail.com
# http://www.evilsocket.net
#
# This file may be licensed under the terms of of the
# GNU General Public License Version 3 (the ``GPL'').
#
# Software distributed under the License is distributed
# on an ``AS IS'' basis, WITHOUT WARRANTY OF ANY KIND, either
# express or implied. See the GPL for the specific language
# governing rights and limitations.
#
# You should have received a copy of the GPL along with this
# program. If not, go to http://www.gnu.org/licenses/gpl.html
# or write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

from .baseclass import BaseClass
from .string import String

class StringBuilder(BaseClass):
    """Fake the string builder class of Java."""
    def __init__(self, content=""):
        self.internal = content

    @staticmethod
    def name():
        return 'java.lang.StringBuilder'

    @staticmethod
    def methods():
        return {
            'new-instance': StringBuilder.new_instance,
            '<init>()V': StringBuilder.init,
            'append(Ljava/lang/String;)Ljava/lang/StringBuilder;': StringBuilder.append,
            'append(C)Ljava/lang/StringBuilder;': StringBuilder.append,
            'toString()Ljava/lang/String;': StringBuilder.tostring
        }

    @staticmethod
    def new_instance():
        return StringBuilder("")

    @staticmethod
    def init(args):
        pass

    def __eq__(self, other):
        if isinstance(other, str):
            return (not(other) and not self.internal) or other == self.internal
        elif isinstance(other, StringBuilder):
            return other.internal == self.internal

    def append(self, *args):
        if isinstance(args[0], String):
            self.internal += args[0].repr_intern()
        else:
            self.internal += args[0]
        return self

    def tostring(self):
        return self.internal
