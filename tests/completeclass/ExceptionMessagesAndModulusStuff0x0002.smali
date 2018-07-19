.class public final Lutil/a/z/b/d;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lutil/a/z/b/d$1;
    }
.end annotation


# static fields
.field private static final a:[B


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0x5a

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lutil/a/z/b/d;->a:[B

    return-void

    :array_0
    .array-data 1
        0x25t
        0x79t
        -0x2t
        -0x2t
        -0x19t
        0x3t
        -0x3t
        -0x1t
        -0x8t
        0x9t
        0x4et
        -0x54t
        0xbt
        -0x4t
        0x8t
        -0xet
        -0x1t
        0xft
        -0xbt
        -0x3t
        0x53t
        -0x54t
        -0x5t
        0x9t
        0xbt
        -0x25t
        -0x8t
        0x15t
        -0xbt
        0x3t
        0x5t
        0x44t
        -0x53t
        -0x1t
        0x13t
        -0x11t
        -0x2t
        0x54t
        -0x54t
        0xbt
        -0x4t
        0x8t
        -0x25t
        -0x8t
        0x15t
        -0xbt
        0x3t
        0x5t
        0x44t
        -0x54t
        0x2t
        -0x3t
        0x7t
        0xbt
        0x2t
        -0x13t
        0xbt
        -0x6t
        0x1t
        0x4et
        -0x4ct
        0x7t
        -0x9t
        0x7t
        -0xdt
        0xct
        -0x19t
        0x9t
        -0x13t
        0x8t
        0xbt
        0x2t
        -0x11t
        0xft
        0x1t
        0x44t
        -0x54t
        0xbt
        -0x4t
        0x8t
        -0xet
        -0x1t
        0xft
        -0xbt
        -0x3t
        0x53t
        -0x53t
        0xat
        -0x11t
        0x15t
    .end array-data
.end method

.method private static a(Lcom/gemalto/ezio/mobile/sdk/oath/soft/SoftOathSettings$OathTimestepType;)I
    .locals 5

    const/4 v4, 0x1

    sget-object v0, Lutil/a/z/b/d$1;->a:[I

    invoke-virtual {p0}, Lcom/gemalto/ezio/mobile/sdk/oath/soft/SoftOathSettings$OathTimestepType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/16 v4, 0x3c

    :pswitch_1
    mul-int/lit8 v4, v4, 0x3c

    :pswitch_2
    goto :goto_1

    :goto_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Lutil/a/z/b/d;->a:[B

    const/16 v2, 0xd

    aget-byte v1, v1, v2

    neg-int v1, v1

    sget-object v2, Lutil/a/z/b/d;->a:[B

    const/4 v3, 0x7

    aget-byte v2, v2, v3

    add-int/lit8 v3, v2, 0x1

    invoke-static {v1, v2, v3}, Lutil/a/z/b/d;->a(III)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :goto_1
    return v4

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private static a(III)Ljava/lang/String;
    .locals 5

    sget-object v3, Lutil/a/z/b/d;->a:[B

    add-int/lit8 p0, p0, 0x12

    mul-int/lit8 p2, p2, 0xc

    rsub-int/lit8 p2, p2, 0x55

    new-instance v0, Ljava/lang/String;

    const/4 v4, 0x0

    add-int/lit8 p1, p1, 0x4

    new-array v1, p0, [B

    add-int/lit8 p0, p0, -0x1

    goto :goto_1

    :goto_0
    sub-int/2addr p2, v2

    :goto_1
    add-int/lit8 p1, p1, 0x1

    int-to-byte v2, p2

    aput-byte v2, v1, v4

    if-ne v4, p0, :cond_0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BI)V

    return-object v0

    :cond_0
    add-int/lit8 v4, v4, 0x1

    aget-byte v2, v3, p1

    goto :goto_0
.end method

.method public static a(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Ljava/util/Map<*[B>;)V"
        }
    .end annotation

    if-eqz p0, :cond_1

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, [B

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    invoke-static {v1, v0}, Ljava/util/Arrays;->fill([BB)V

    :cond_0
    goto :goto_0

    :cond_1
    return-void
.end method

.method public static a([B)V
    .locals 1

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    invoke-static {p0, v0}, Ljava/util/Arrays;->fill([BB)V

    :cond_0
    return-void
.end method

.method public static a([C)V
    .locals 1

    if-eqz p0, :cond_0

    const/16 v0, 0x30

    invoke-static {p0, v0}, Ljava/util/Arrays;->fill([CC)V

    :cond_0
    return-void
.end method

.method public static varargs a([[B)V
    .locals 4

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p0, v2

    if-eqz v3, :cond_0

    const/4 v0, 0x0

    invoke-static {v3, v0}, Ljava/util/Arrays;->fill([BB)V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static a(J)[B
    .locals 2

    const/16 v0, 0x8

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    return-object v0
.end method

.method public static a(JI)[B
    .locals 9

    new-array v5, p2, [B

    const/16 v0, 0xd

    new-array v6, v0, [J

    fill-array-data v6, :array_0

    add-int/lit8 v0, p2, 0x1

    const/16 v1, 0xd

    if-le v0, v1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Lutil/a/z/b/d;->a:[B

    const/16 v2, 0x34

    aget-byte v1, v1, v2

    sget-object v2, Lutil/a/z/b/d;->a:[B

    const/4 v3, 0x0

    aget-byte v2, v2, v3

    sget-object v3, Lutil/a/z/b/d;->a:[B

    const/16 v4, 0x3a

    aget-byte v3, v3, v4

    invoke-static {v1, v2, v3}, Lutil/a/z/b/d;->a(III)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    aget-wide v0, v6, p2

    rem-long/2addr p0, v0

    add-int/lit8 v7, p2, -0x1

    :goto_0
    if-ltz v7, :cond_1

    aget-wide v0, v6, v7

    div-long v0, p0, v0

    long-to-int v8, v0

    add-int/lit8 v0, p2, -0x1

    sub-int/2addr v0, v7

    add-int/lit8 v1, v8, 0x30

    int-to-byte v1, v1

    aput-byte v1, v5, v0

    int-to-long v0, v8

    aget-wide v2, v6, v7

    mul-long/2addr v0, v2

    sub-long/2addr p0, v0

    add-int/lit8 v7, v7, -0x1

    goto :goto_0

    :cond_1
    return-object v5

    nop

    :array_0
    .array-data 8
        0x1
        0xa
        0x64
        0x3e8
        0x2710
        0x186a0
        0xf4240
        0x989680
        0x5f5e100
        0x3b9aca00
        0x2540be400L
        0x174876e800L
        0xe8d4a51000L
    .end array-data
.end method

.method public static a(JLcom/gemalto/ezio/mobile/sdk/oath/soft/SoftOathSettings$OathTimestepType;IJ)[B
    .locals 7

    sget-object v0, Lcom/gemalto/ezio/mobile/sdk/oath/soft/SoftOathSettings$OathTimestepType;->NONE:Lcom/gemalto/ezio/mobile/sdk/oath/soft/SoftOathSettings$OathTimestepType;

    if-ne p2, v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    invoke-static {p2}, Lutil/a/z/b/d;->a(Lcom/gemalto/ezio/mobile/sdk/oath/soft/SoftOathSettings$OathTimestepType;)I

    move-result p2

    if-nez p3, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Lutil/a/z/b/d;->a:[B

    const/16 v2, 0x34

    aget-byte v1, v1, v2

    sget-object v2, Lutil/a/z/b/d;->a:[B

    const/16 v3, 0x3a

    aget-byte v2, v2, v3

    add-int/lit8 v2, v2, -0x1

    const/16 v3, 0x3d

    invoke-static {v1, v3, v2}, Lutil/a/z/b/d;->a(III)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    const-wide/16 v0, 0x0

    cmp-long v0, p4, v0

    if-gez v0, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Lutil/a/z/b/d;->a:[B

    const/16 v2, 0x34

    aget-byte v1, v1, v2

    sget-object v2, Lutil/a/z/b/d;->a:[B

    const/16 v3, 0x3a

    aget-byte v2, v2, v3

    add-int/lit8 v2, v2, -0x1

    const/16 v3, 0x3d

    invoke-static {v1, v3, v2}, Lutil/a/z/b/d;->a(III)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    cmp-long v0, p4, p0

    if-lez v0, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Lutil/a/z/b/d;->a:[B

    const/16 v2, 0x3a

    aget-byte v1, v1, v2

    add-int/lit8 v1, v1, -0x1

    or-int/lit8 v2, v1, 0x14

    sget-object v3, Lutil/a/z/b/d;->a:[B

    const/16 v4, 0x3a

    aget-byte v3, v3, v4

    invoke-static {v1, v2, v3}, Lutil/a/z/b/d;->a(III)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    sub-long v5, p0, p4

    new-instance p0, Ljava/math/BigInteger;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "0"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    new-instance p1, Ljava/math/BigInteger;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "0"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    mul-int v1, p3, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    const/4 p1, 0x0

    :try_start_0
    invoke-virtual {p0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    move-object p1, v0

    const/16 v0, 0x8

    new-array p0, v0, [B

    array-length v0, p1

    rsub-int/lit8 v0, v0, 0x8

    array-length v1, p1

    const/4 v2, 0x0

    invoke-static {p1, v2, p0, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {p1}, Lutil/a/z/p/a;->a([B)V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {p1}, Lutil/a/z/p/a;->a([B)V

    throw p0
.end method

.method public static a(Ljava/lang/String;)[B
    .locals 2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "0"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lutil/a/z/p/c;->a(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0

    :cond_0
    invoke-static {p0}, Lutil/a/z/p/c;->a(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public static a(S)[B
    .locals 2

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    return-object v0
.end method

.method public static a([BII)[B
    .locals 2

    if-eqz p0, :cond_0

    if-ltz p1, :cond_0

    if-ltz p2, :cond_0

    array-length v0, p0

    if-le p2, v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :cond_1
    sub-int v0, p2, p1

    move p2, v0

    if-gez v0, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :cond_2
    new-array v1, p2, [B

    const/4 v0, 0x0

    invoke-static {p0, p1, v1, v0, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v1
.end method

.method public static a([CII)[C
    .locals 2

    if-eqz p0, :cond_0

    if-ltz p2, :cond_0

    array-length v0, p0

    if-le p2, v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :cond_1
    move p1, p2

    if-gez p2, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :cond_2
    new-array p2, p1, [C

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v0, p2, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p2
.end method

.method public static b(JLcom/gemalto/ezio/mobile/sdk/oath/soft/SoftOathSettings$OathTimestepType;IJ)J
    .locals 6

    sget-object v0, Lcom/gemalto/ezio/mobile/sdk/oath/soft/SoftOathSettings$OathTimestepType;->NONE:Lcom/gemalto/ezio/mobile/sdk/oath/soft/SoftOathSettings$OathTimestepType;

    if-ne p2, v0, :cond_0

    const-wide v0, 0x7fffffffffffffffL

    return-wide v0

    :cond_0
    int-to-long v0, p3

    invoke-static {p2}, Lutil/a/z/b/d;->a(Lcom/gemalto/ezio/mobile/sdk/oath/soft/SoftOathSettings$OathTimestepType;)I

    move-result v2

    int-to-long v2, v2

    mul-long v4, v0, v2

    sub-long v0, p0, p4

    div-long/2addr v0, v4

    mul-long/2addr v0, v4

    add-long v2, p4, v4

    add-long/2addr v0, v2

    return-wide v0
.end method
