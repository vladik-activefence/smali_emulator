.class public Lutil/a/z/n/b;
.super Ljava/lang/Object;


# static fields
.field private static final c:[B


# instance fields
.field protected a:Lutil/a/z/n/a$b;

.field private b:Lutil/a/z/n/a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0x2a

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lutil/a/z/n/b;->c:[B

    return-void

    :array_0
    .array-data 1
        0x3t
        0x62t
        0x51t
        0x67t
        0x28t
        0xbt
        -0x12t
        0xet
        0x0t
        -0x2t
        -0x41t
        0x46t
        0x15t
        0x0t
        0x3t
        -0xat
        0xct
        -0x8t
        0x19t
        -0x56t
        0x4ft
        -0x4t
        0xct
        -0x4t
        0x10t
        -0x9t
        0xat
        -0xbt
        -0x1ft
        0x56t
        -0x7t
        0x14t
        -0x12t
        -0x42t
        0x50t
        -0x1t
        0xdt
        -0x3t
        -0x9t
        0x16t
        -0xet
        0x8t
    .end array-data
.end method

.method public constructor <init>(Lutil/a/z/n/a;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lutil/a/z/n/b;->b:Lutil/a/z/n/a;

    return-void
.end method

.method private static a(III)Ljava/lang/String;
    .locals 6

    mul-int/lit8 p1, p1, 0x16

    rsub-int/lit8 p1, p1, 0x19

    mul-int/lit8 p0, p0, 0x6

    rsub-int/lit8 p0, p0, 0x17

    mul-int/lit8 p2, p2, 0x4

    add-int/lit8 p2, p2, 0x49

    sget-object v4, Lutil/a/z/n/b;->c:[B

    const/4 v5, 0x0

    new-instance v0, Ljava/lang/String;

    new-array v1, p0, [B

    add-int/lit8 p0, p0, -0x1

    goto :goto_1

    :goto_0
    add-int/2addr v2, p2

    add-int/lit8 p2, v2, -0x3

    :goto_1
    int-to-byte v2, p2

    aput-byte v2, v1, v5

    add-int/lit8 p1, p1, 0x1

    move v2, v5

    add-int/lit8 v5, v5, 0x1

    if-ne v2, p0, :cond_0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BI)V

    return-object v0

    :cond_0
    aget-byte v2, v4, p1

    goto :goto_0
.end method
