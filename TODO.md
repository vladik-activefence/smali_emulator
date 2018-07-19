# Ultimate goal

The ultimate goal is to be able to load any .smali class file in python
and to instanciate objects of that class as python objects.

Example:

```python
import smali.bridge

>>> ClassToLoad = smali.bridge.loadClass('ClassToLoad.smali')  # get the class
>>> myObject = ClassToLoad()  # instanciate it
>>> myObjects.methods()  # get the list of available methods
['init', 'methodA', 'methodB']
>>> myObjects.fields()  # get the list of fields
['fieldA', 'fieldB']
```

However the current architecture is not really oriented toward this goal, because
`smali_emulator` was at the beginning a simple script-like (quite complex for a script)
application, but advanced use cases were not anticipated.

Although there is a lack of long-term anticipation, the architecture is nevertheless quite
useable and it is veryy possible to make it evolve without too much rewriting.

The building block are already existing.

    - ObjectMapping class is a dictionary with {className: methodList} functions.
    - VM is storing the current execution status of the virtual machine.
    - Emulator is running the source code

We should add a support in ObjectMapping for Class objects that are analogous to the 
corresponding smali files.

See `smali/objects/metaclass.py`.

One of the problem is that methods in java are all encapsulated into classes, there
is no global variables shared through the code (in principle).

So we need a global state that will map all classes in a package with a specific
context for smali source code.





