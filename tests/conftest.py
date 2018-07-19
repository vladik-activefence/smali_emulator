import fnmatch
import os

import pytest

from smali.emulator import Emulator

def parse_file(root_path, filename):
    """Parse file with the given path.

    Expected format for the source file is:

    line 0  : # {'a': XXX, 'b': YYY, 'ret': 'output_of_the_method'}
    line 1+ : smali source code
    """
    input_data = open(os.path.join(root_path, filename), 'r').readlines()
    expected_result = input_data[0].lstrip('#').strip()
    smali_source = input_data[1:]
    return filename, expected_result, smali_source


def data_files(foldername):
    """Parse all smali file in the given folder."""
    files = []
    datapath = os.path.join(os.path.dirname(__file__), foldername)
    for root, dirnames, filenames in os.walk(datapath):
        files.extend((parse_file(root, filename)
                      for filename in fnmatch.filter(filenames, '*.smali')))
    return files


def static_method_calls():
    # 'staticmethod' folder must be in the current directory
    return [
        (os.path.join(os.path.dirname(__file__),
                      'staticmethod', filename),
         expected_result,
         input_source)
        for filename, expected_result, input_source in data_files('staticmethod')
    ]


def opcode_calls():
    # 'data' folder must be in the current directory
    return data_files('data')
