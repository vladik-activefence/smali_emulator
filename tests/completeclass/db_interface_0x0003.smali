.class public final Lutil/a/z/H/a;
.super Lutil/a/z/H/c;


.field private static final i:[B

# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0x27

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lutil/a/z/H/a;->i:[B

    return-void

    nop

    :array_0
    .array-data 1
        0x55t
        0x4ft
        -0x65t
        -0x44t
        0x5t
        0xft
        0x23t
        -0x2t
        0x6t
        -0xet
        -0x1t
        0x12t
        -0xat
        0x7t
        0x0t
        -0x4dt
        0x51t
        -0xet
        0x12t
        -0x10t
        0xdt
        -0x7t
        0x10t
        -0xet
        0xet
        -0x51t
        0x4at
        0xbt
        -0x52t
        0x4at
        0x6t
        0x9t
        -0x14t
        0xct
        -0x2t
        -0x4t
        -0x35t
        0x1t
        0x1t
    .end array-data
.end method

.method private static a(III)Ljava/lang/String;
    .locals 6

    add-int/lit8 p2, p2, 0x4

    new-instance v0, Ljava/lang/String;

    mul-int/lit8 p1, p1, 0x1f

    rsub-int/lit8 p1, p1, 0x22

    const/4 v5, -0x1

    mul-int/lit8 p0, p0, 0xf

    rsub-int/lit8 p0, p0, 0x50

    sget-object v4, Lutil/a/z/H/a;->i:[B

    new-array v1, p1, [B

    add-int/lit8 p1, p1, -0x1

    goto :goto_1

    :goto_0
    add-int/2addr v2, p0

    add-int/lit8 p0, v2, -0x1

    :goto_1
    add-int/lit8 v5, v5, 0x1

    int-to-byte v2, p0

    aput-byte v2, v1, v5

    if-ne v5, p1, :cond_0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BI)V

    return-object v0

    :cond_0
    add-int/lit8 p2, p2, 0x1

    aget-byte v2, v4, p2

    goto :goto_0
.end method
