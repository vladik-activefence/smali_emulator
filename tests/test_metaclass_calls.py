
import os
import pytest
import smali.javaclass



@pytest.mark.parametrize(
    'filepath', [
        os.path.join(os.path.dirname(__file__), 'completeclass', 'data_for_metaclass_loader.smali'),
    ]
)
def test_javaclass_parser(filepath):
    parsed_class = smali.javaclass.JavaClassParser(filepath)
    print("Class method list:\n" + 
          "\n".join(map(str, parsed_class.methods)))
    print("Class field list:\n"+"\n".join(map(str, parsed_class.fields)))
    print("Classname is : " + parsed_class.class_name)


@pytest.mark.parametrize(
    'filepath', [
        os.path.join(os.path.dirname(__file__), 'completeclass', 'data_for_metaclass_loader.smali'),
    ]
)
def test_meta_javaclass(filepath):
    java_class = smali.javaclass.MetaJavaClass(filepath)
    java_obj = java_class()
    print("Name of the class={}".format(java_obj.name()))
    print(
        "Associated method of the class: \n{}".format(
            "\n".join(map(str, java_obj.methods()))
        )
    )
    print(
        "Fields of the class:\n{}".format(
            "\n".join(map(str, java_obj.fields()))
        )
    )

