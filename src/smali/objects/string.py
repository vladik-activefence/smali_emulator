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



import struct

from .baseclass import BaseClass


class String(BaseClass):
    """Reproduce the behaviour of the java/lang/String class"""

    @staticmethod
    def name():
        name = 'java.lang.String'
        return name

    @staticmethod
    def methods():
        """A dict containing the list of available methods for the class."""
        return {
            'new-instance': String.new_instance,
            '<init>([C)V': String.init_from_char_array,
            '<init>([BI)V': String.init_from_byte_array_and_code,
            'charAt(I)C': String.charat,
            'toCharArray()[C': String.tochararray,
            'intern()Ljava/lang/String;': String.repr_intern,
            'valueOf([CII)Ljava/lang/String;': String.valueof,
            'length()I': String.length,
            'subString(II)Ljava/lang/String;': String.ssubs,
        }

    def __eq__(self, other):
        if isinstance(other, str):
            return (not(other) and not self.internal) or other == self.internal
        elif isinstance(other, String):
            return other.internal == self.internal

    def repr_intern(self):
        return str(self.internal)

    @classmethod
    def new_instance(cls):
        return cls("")

    def init_from_char_array(self, char_array):
        self.internal = "".join(char_array)

    def init_from_byte_array_and_code(self, char_array, encoding_code):
        self.internal = b"".join(
            struct.pack('>b', ord(x) if isinstance(x, str) else x) for x in char_array
        ).decode('ascii')

    def charat(self, idx):
        obj = self.internal
        return chr(obj[idx]) if isinstance(obj[idx], int) else obj[idx]

    def tochararray(self):
        return [chr(x) if isinstance(x, int) else x for x in self.internal]

    def length(self):
        return len(self.internal)

    def valueof(self, *args):
        return self.internal[int(args[0]):int(args[1])]

    def ssubs(self, *args):
        return self.internal[int(args[0]):int(args[1])]

