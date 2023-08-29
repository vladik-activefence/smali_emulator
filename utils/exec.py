#!/usr/bin/env python
from __future__ import unicode_literals
import argparse
import smali.emulator
import smali.classloader
import ast


def main(filename, methodName, parameters):
    parameters = ast.literal_eval(parameters) if parameters else {}
    cl = smali.classloader.ClassLoader()
    emu = smali.emulator.Emulator(class_loader=cl)
    result = emu.run_file(filename, parameters)
    print(result)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='exec.py', description='fill')
    parser.add_argument("-i", help="Input SMALI file")
    parser.add_argument("-m", help="Method name", required=True)
    parser.add_argument("-p", help="Parameters of the method", required=False)
    args = parser.parse_args()
    inputFile, methodName, parameters = args.i, args.m, args.p
    main(inputFile, methodName, parameters)
