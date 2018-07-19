# -*- coding: utf-8 -*-
# This file is part of the Smali Emulator.
#
# Copyright(c) 2016-2018 Simone 'evilsocket' Margaritelli
# evilsocket@gmail.com
# http://www.evilsocket.net
#
# Copyright(c) 2018- David Kremer, courrier@david-kremer.fr
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

import collections
import sys
import pytest

import smali.emulator
import smali.classloader

from .conftest import (
    opcode_calls,
)

def special_cmp(a, b):
    if a == b:
        return True
    elif isinstance(a, Exception):
        return (
            isinstance(a, b.__class__)
            and str(a) == str(b)
        )
    else:
        return False


@pytest.mark.parametrize(
    'filename, expected_result, input_source',
    opcode_calls()
)
def test_all_files(filename, expected_result, input_source):
    assert filename.endswith('.smali')
    cl = smali.classloader.ClassLoader()
    emulator = smali.emulator.Emulator(class_loader=cl)
    result = emulator.run_source(input_source)
    if expected_result.startswith('{') and expected_result.endswith('}'):
        """Probably a dict, we convert the result"""
        expected_result = eval(expected_result)
        assert result == expected_result['ret']
        assert all(special_cmp(emulator.vm[param], expected_result[param]) for param in emulator.vm.variables)


