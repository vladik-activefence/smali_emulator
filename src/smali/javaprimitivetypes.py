TYPE_MAPPING = {
    'J': int,     # 64 bits integer (long)
    'I': int,     # 32 bits integer (integer)
    'B': int,     #  8 bits integer (byte)
    'C': int,     # 16 bits integer (char)
    'S': int,     # 16 bits integer (short)
    '[I': list,   # array of integers
    '[B': list,   # array of integers
    '[C': list,   # array of integers
}

REVERSED_TYPE_MAPPING = {v: k for k, v in TYPE_MAPPING.items()}
