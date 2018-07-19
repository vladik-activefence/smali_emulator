# {'va': 'Hello', 'ret': None, 'statMember': 'Hello'}

.field private static final statMember:Ljava/lang/String;

const-string va, "Hello"

sput-object va, statMember

return

# {'a': ['a', 'b', 'c'], 'i': 1, 's': 'abc', 'ret': ['a', 'b', 'c'], 'v': 'b'}
const-string s, "abc"
const/16 a, 0
const/16 i, 1
const/16 v, 0

invoke-virtual {s}, Ljava/lang/String;->toCharArray()[C
move-result a
aget v, a, i