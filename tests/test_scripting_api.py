from __future__ import unicode_literals

import os.path

import pytest

import smali
import smali.source
import smali.emulator
import smali.classloader

def get_file_path(datadir, filename):
    return os.path.join(
        os.path.dirname(smali.__file__),
        os.pardir, os.pardir, 'tests',
        datadir, filename
    )

def test_script_number_one():
    """Test that scripting mode behaves correctly.
    
    This test is deprecated, we should not call emulator objects directly.
    """
    # create a new emulator

    cl = smali.classloader.ClassLoader()
    cl.load_class(get_file_path('staticmethod', 'value_cannot_be_null.smali'))
    emulator = smali.emulator.Emulator(class_loader=cl)
    res = emulator.exec_method(class_name=None, method_name='a', args={'p0': 1, 'p1': 1, 'p2': -1})
    assert res.internal == "value cannot be null"


@pytest.mark.parametrize(
    'p0,p1,p2,expected', [
        (1, 0, 0, 'MK'),
        (0, 1, 1, "Key is null or does not exist")
    ]
)
def test_full_static_class_with_init(p0, p1, p2, expected):
    """
    Test two successive calls: 

      - first on '<clinit>' for initializing static fields
      - second on 'a' for deciphering some string

    This test is deprecated. We should try not to invoke emulator directly.
    """
    javapath = get_file_path('completeclass', 'full_static_class.smali')
    cl = smali.classloader.ClassLoader()
    cl.load_class(javapath)
    parsed_class = smali.javaclass.JavaClassParser(javapath)
    class_name = parsed_class.class_name
    emulator = smali.emulator.Emulator(class_loader=cl)
    emulator.exec_method(class_name, '<clinit>', args=None, )
    res = emulator.exec_method(class_name, 'a', args={'p0': p0, 'p1': p1, 'p2': p2}, )
    assert res.internal == expected


@pytest.mark.parametrize(
    'p0,p1,p2,expected', [
        (0x15, 0, 0, 'Unsupported provisioning protocol version'),
        (63, 3, 7, "Invalid PPV response length"),
        (61, 5, 0x13, "AES"),
    ]
)
def test_exception_messages_0x0001(p0, p1, p2, expected):
    """
    Test two successive calls:

      - first on '<clinit>' for initializing static fields
      - second on 'a' for deciphering some string

    This test is deprecated. We should try not to invoke emulator directly.
    """
    javapath = get_file_path('completeclass', 'ExceptionMessages0x0001.smali')
    cl = smali.classloader.ClassLoader()
    loaded_class = cl.load_class(javapath)
    emulator = smali.emulator.Emulator(class_loader=cl)
    emulator.exec_method(loaded_class.__name__, '<clinit>', args=None, )
    res = emulator.exec_method(loaded_class.__name__, 'a', args={'p0': p0, 'p1': p1, 'p2': p2}, )
    assert res == expected

@pytest.mark.parametrize(
    'input_args,expected', [
        ({'p0': 2**43 - 1, 'p1': 7}, list(str((2**43 - 1) % (10**7)))),
    ]
)
def test_exception_messages_0x0002_a(input_args, expected):
    """
    Test two successive calls:

      - first on '<clinit>' for initializing static fields
      - second on 'a' for deciphering some string

    This test is deprecated. We should try not to invoke emulator directly.
    """
    javapath = get_file_path('completeclass',
                             'ExceptionMessagesAndModulusStuff0x0002.smali')
    cl = smali.classloader.ClassLoader()
    loaded_class = cl.load_class(javapath)
    new_object = loaded_class(emulator=smali.emulator.Emulator(class_loader=cl))
    new_object.invoke('<clinit>()V', {})
    res = new_object.invoke('a(JI)[B', input_args)
    assert res == expected


@pytest.mark.parametrize(
    'input_args,expected', [
        ({'p0': 0x7, 'p1': 0x25, 'p2': 0x1}, 'Invalid truncation length'),
    ]
)
def test_exception_messages_0x0002_b(input_args, expected):
    java_path = get_file_path('completeclass',
                             'ExceptionMessagesAndModulusStuff0x0002.smali')
    cl = smali.classloader.ClassLoader()
    loaded_class = cl.load_class(java_path)
    new_object = loaded_class(emulator=smali.emulator.Emulator(class_loader=cl))
    new_object.invoke('<clinit>()V', {})
    res = new_object.invoke('a(III)Ljava/lang/String;', input_args)
    assert res == expected


@pytest.mark.parametrize(
    'p0, expected', [(u"\uf38e\u9d56\u5f62\u72f1\u14ff\u6aa0", None)]
)
def test_class_with_init(p0, expected):
    pytest.xfail("not ready yet")
    orange_file = get_file_path('completeclass', 'protected_app.smali')
    cl = smali.classloader.ClassLoader()
    orange_class = cl.load_class(orange_file)
    orange_obj = orange_class()
    emulator = smali.emulator.Emulator(class_loader=cl)
    parsed_class = smali.javaclass.JavaClassParser(orange_file)
    emulator.exec_method(parsed_class.class_name, '<clinit>', args=None)
    emulator.exec_method(parsed_class.class_name, 'i10725', args=None)
    res = emulator.exec_method(parsed_class.class_name, 'a', args={'p0': p0})
    assert res == expected.decode('ascii')

