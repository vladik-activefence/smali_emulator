# Smali Emulator

This software will emulate a [**smali**](https://github.com/JesusFreke/smali) source file 
generated by apktool, it is intended to be used as a quick and dirty way to defeat various 
types of encryption and obfuscation while reversing an APK.

This project is very much a work in progress, feel free to submit a patch.

As an example, you can run:

```shell
cd utils;
./exec.py -i decryptor.smali -m field5 \
-p '{"p0":[-62,-99,-106,-125,-123,-105,-98,-37,-105,-97,-103,-41,-118,-97,-113,-103,-109,-104,-115,111,98,103,35,52],"p1": 19}'
```

# Testing

The project has recently be migrated to pytest for infrastructure of tests.
To run tests, do:

```shell
pytest -v
```

The project is not Python 3 compatible yet, but should be in a near future.

# Note

[Explanation of the "why" and "how" can be found here.](https://www.evilsocket.net/2016/04/18/how-i-defeated-an-obfuscated-and-anti-tamper-apk-with-some-python-and-a-home-made-smali-emulator/)

This is highly experimental, a very small subset of the Dalvik opcodes is currently supported, see the `smali/opcodes.py` file for more details.

OpCodes List (Feel free to request access)

https://docs.google.com/spreadsheets/d/1RfB_LsBoYnJxOh-lDCSMR0mfLBl1UlwdW9eKw2p03DY/edit?usp=sharing

# License

Copyright (c) 2016 Simone Margaritelli | [Twitter](https://twitter.com/evilsocket) | [Blog](http://www.evilsocket.net)  
Released under the GPL 3 license.
