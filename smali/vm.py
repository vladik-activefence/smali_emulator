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

import re
import copy
import smali.parser


class MissingClassMethod(Exception):
    pass


class MethodUnavailable(Exception):
    """In case the method is not found by the classloader."""
    pass


class VM(object):
    """The virtual machine used by the emulator.

    A new virtual machine must be use for each frame!.
    """
    LOCAL_VAR_NAME_PATTERN = re.compile('(p|v)\d+')

    def __init__(self, emulator):

        # we need the emulator instance in order to call its 'fatal' method.
        # also, we are going to store the set of loaded classes into this object
        self.emu = emulator
        self.labels = {}  # map of jump labels to opcodes offsets
        self.variables = {}  # variables container
        self.catch_blocks = []  # try/catch blocks container with opcodes offsets
        self.packed_switches = {}  # packed switches containers
        self.array_data = {}  # array data blocks
        self.exceptions = []  # list of thrown exceptions
        self.result = None  # holds the result of the last method invocation
        self.return_v = None  # holds the return value of the method ( used by return-* opcodes )
        self.stop = False  # set to true when a return-* opcode is executed
        self.pc = 0  # current opcode index

    def __getitem__(self, name):
        return self.variables[name]

    def __setitem__(self, name, value):
        self.variables[name] = value

    def fatal(self, message):
        self.emu.fatal(message)

    def goto(self, label):
        self.pc = self.labels[label]

    def exception(self, e):
        self.exceptions.append(e)

        # check if this operation is surrounded by a try/catch block
        for block in self.catch_blocks:
            start, end, label = block
            if start <= self.pc <= end:
                self.goto(label)
                return

        # nope, report unhandled exception
        self.emu.fatal("Unhandled exception '%s'." % str(e) )

    def new_instance(self, klass):
        class_name = klass if klass else 'empty'
        java_class_name = smali.parser.extract_class_name(klass) if klass else 'empty'

        """Fix This; the new-instance opcode should be resolved according to the base class
        being given on the line. Then the class resolver contained in the emulator member
        must be used to resolve the base class, then invoke the corresponding new_instance
        method."""

        if java_class_name in self.emu.class_loader.loaded_classes:
            java_class = self.emu.class_loader.loaded_classes[java_class_name]

        elif class_name in self.emu.class_loader.loaded_classes:
            java_class = self.emu.class_loader.loaded_classes[class_name]

        else:
            raise MethodUnavailable("Could not find method {}".format(class_name))

        return java_class()

    def invoke(self, this, class_name, method_name, args):
        """Method used for internal class methods or static methods"""
        method_name, signature, output_type = smali.parser.get_method_name_and_signature('.method ' + method_name)
        method = (
            this.methods.get(method_name)
            or self.emu.classloader.methods.get(method_name)
            or self.emu.javaclass.classloader.loadedclasses.get(class_name).methods.get(method_name)
        )
        assert method, "Unable to find method {}".format(method)
        assert isinstance(this, smali.javaobject.JavaObject) or method.is_static, "Calling statically a non-static class."

    @classmethod
    def is_local_variable(cls, var):
        return cls.LOCAL_VAR_NAME_PATTERN.match(var)

    def get_new_frame(self):
        new_vm = VM(self.emu)
        new_vm.variables = self.backup_local_variables()
        return new_vm

    def clean_vm(self):
        self.clean_local_variables()
        self.stop = False
        self.pc = 0  # start line number for running source code

    def clean_local_variables(self):
        backup = self.backup_local_variables()
        [self.variables.pop(key) for key in backup]
        return backup

    def backup_local_variables(self):
        return {key: value for key, value in self.variables.items() if self.is_local_variable(key)}




