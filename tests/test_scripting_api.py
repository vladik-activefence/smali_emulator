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
        os.pardir, 'tests',
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
    """    Test two successive calls:

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
    'filename,input_args,expected', [
        ('db_interface.smali', {'p0': 0x8, 'p1': 0x32, 'p2': 0x49}, 'DB cannot be opened for read'),
        ('db_interface.smali', {'p0': 0x7, 'p1': 33, 'p2': 28}, 'Unexpected table column key'),
        ('db_interface.smali', {'p0': 0x9, 'p1': 0x32, 'p2': 0x0}, 'DB cannot be opened for write'),
        ('db_interface.smali', {'p0': 0, 'p1': 0, 'p2': 54}, 'value cannot be null'),
        ('db_interface_0x0002.smali', {'p0': 34, 'p1': 58, 'p2': 28}, 'Token(bit) input cannot be null'),
        ('db_interface_0x0002.smali', {'p0': 34, 'p1': 25, 'p2': 0x1d}, 'Token(bit) output cannot be null'),
        ('db_interface_0x0002.smali', {'p0': 53, 'p1': 56, 'p2': 0x0}, 'AES'),
        ('db_interface_0x0002.smali', {'p0': 33, 'p1': -1, 'p2': -1 & 24}, 'Unexpected table column key'),
        ('db_interface_0x0002.smali', {'p0': 0, 'p1': 88, 'p2': 17}, 'value cannot be null'),
        ('db_interface_0x0002.smali', {'p0': 32, 'p1': 107, 'p2': 15}, 'Verify hmac failed'),
        ('db_interface_0x0004.smali', {'p0': 28, 'p1': 299, 'p2': 0x36}, 'Odd length'),
        ('db_interface_0x0004.smali', {'p0': 0x16, 'p1': 0x11, 'p2': 0x2e}, 'Invalid key length'),
        ('db_interface_0x0005.smali', {'p0': 1, 'p1': 0, 'p2': 0}, 'IPB size mismatch'),
        ('db_interface_0x0005.smali', {'p0': 0, 'p1': 1, 'p2': 0}, 'Invalid currency length'),
        ('db_interface_0x0006.smali', {'p0': 0, 'p1': 0, 'p2': 51}, 'AES'),
        ('db_interface_0x0007.smali', {'p0': 1, 'p1': 1, 'p2': 1 | 28}, 'Invalid input'),
        ('db_interface_0x0007.smali', {'p0': 0, 'p1': 0, 'p2': -1}, 'The length of IV is not correct'),
        ('db_interface_0x0008.smali', {'p0': 28, 'p1': 30, 'p2': 19}, "Token(bit) input cannot be null"),
        ('db_interface_0x0008.smali', {'p0': 29, 'p1': 29 | 34, 'p2': 19}, 'Token(bit) output cannot be null'),
        ('db_interface_0x0008.smali', {'p0': 0, 'p1': 32, 'p2': 0}, 'AES'),
        ('db_interface_0x0008.smali', {'p0': 24, 'p1': 24 | 65, 'p2': 0x14}, 'Unexpected table column key'),
        ('db_interface_0x0008.smali', {'p0': 17, 'p1': 0, 'p2': 53}, 'value cannot be null'),
        ('db_interface_0x0009.smali', {'p0': 0xe, 'p1': 384, 'p2': 164 >> 2}, 'Argument cannot be null'),
        ('db_interface_0x0009.smali', {'p0': 0x1, 'p1': 164, 'p2': 164 & 127}, u'41555448454E5449434154494F4E'),
        ('db_interface_0x0009.smali', {'p0': 0, 'p1': 290, 'p2': 0},
         u'32BFD3720393D4724E2884D9E1D9A7FB06FEA20CF343439F249E16826E311CED'),
        ('db_interface_0x000a.smali', {'p0': 0, 'p1': 103, 'p2': 0},
         u'304FDFA20623D4724E288495D78DCE5C1AE6479205E885FCAF97BEEE504814ED'),
        ('db_interface_0x000a.smali', {'p0': 5, 'p1': 0, 'p2': 0},
         u'841FAC4028EB7349C3BFC26F6E698D934E96B2F6E41E11F15BBD1AB52B99C2B5'),
        ('db_interface_0x000a.smali', {'p0': 1, 'p1': 137, 'p2': 50},
         u'454E4352595054',),
        ('db_interface_0x000a.smali', {'p0': 36, 'p1': 40, 'p2': 40}, "Wrong fingerprint digest",),
        ('db_interface_0x000a.smali', {'p0': 0x10, 'p1': 227, 'p2': 0},
         u"CAB1815521B33D854BC2797BC5E387AEC257ED368930F53E332C70FBCF8B7C3E",),
        ('db_interface_0x000a.smali', {'p0': 0x4, 'p1': 362, 'p2': 0},
         u"7C5C0EF672A277BC964A193201C7EB977CF0991A3B02A5F8ED9D1029833E2F30",),

    ]
)
def test_static_decoding(filename, input_args, expected):
    java_path = get_file_path('completeclass', filename)
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
    pytest.xfail("Too hard to decipher")
    orange_file = get_file_path('completeclass', 'protected_app.smali')
    cl = smali.classloader.ClassLoader()
    emulator = smali.emulator.Emulator(class_loader=cl)
    _class = cl.load_class(orange_file)
    _obj = _class(emulator=emulator)
    _obj.invoke('<clinit>()V', {})
    _obj.invoke('i10725()V', {})
    res = _obj.invoke('a(Ljava/lang/String;)Ljava/lang/String;', {'p0': p0})
    assert res == expected.decode('ascii')



@pytest.mark.parametrize(
    'filename,input_args,expected', [
    ]
)
def test_cur_class(filename, input_args, expected):
    java_path = get_file_path('completeclass', filename)
    cl = smali.classloader.ClassLoader()
    loaded_class = cl.load_class(java_path)
    new_object = loaded_class(emulator=smali.emulator.Emulator(class_loader=cl))
    new_object.invoke('<clinit>()V', {})
    res = new_object.invoke('a(III)Ljava/lang/String;', input_args)
    assert res == expected
