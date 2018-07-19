.class public final Lutil/a/z/w/f;
.super Lutil/a/z/w/c;


# static fields
.field private static a:[I

.field private static final b:[B


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0x76

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lutil/a/z/w/f;->b:[B

    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lutil/a/z/w/f;->a:[I

    return-void

    :array_0
    .array-data 1
        0x1dt
        -0x9t
        -0x8t
        0x28t
        -0x30t
        0xct
        -0xdt
        0x9t
        0x9t
        -0x8t
        -0x5t
        0x55t
        -0x42t
        0x3t
        -0xct
        0x1t
        0x0t
        -0x4t
        0x55t
        -0x41t
        -0x2t
        0x46t
        -0x4dt
        -0x6t
        0xat
        0x1t
        -0x18t
        -0x4t
        -0x1t
        0x6t
        0x1t
        0x2t
        -0x2t
        -0x1t
        0x10t
        0x2t
        0x45t
        -0x4ft
        -0x1t
        0x4t
        -0x6t
        0xet
        -0x9t
        0xbt
        -0x5t
        0x2t
        0x6t
        -0x4t
        0x8t
        0x48t
        -0x4ft
        -0x1t
        0x4t
        -0x4t
        0x6t
        0xdt
        -0xbt
        0x4t
        0x4dt
        -0x55t
        0x12t
        -0xct
        0x0t
        0xbt
        -0x5t
        0x2t
        -0x3t
        -0xdt
        -0x24t
        -0x7t
        0x16t
        -0xat
        0x4t
        0x6t
        0x45t
        -0x2ft
        0x1t
        -0x5t
        0x37t
        -0x51t
        0xet
        -0xdt
        0x4t
        0x2t
        0x2t
        -0x4t
        0xft
        0x46t
        -0x4bt
        0x8t
        -0x8t
        0x8t
        -0xct
        0xdt
        -0x2ct
        0x1t
        0x4t
        -0x2t
        0x53t
        -0x43t
        -0x10t
        0x4t
        0xat
        -0x4t
        0x8t
        0x48t
        -0x4ft
        -0x1t
        0x4t
        -0x6t
        0xet
        -0x9t
        0xbt
        -0x5t
        0x2t
        0x6t
        -0x4t
        0x8t
    .end array-data

    nop

    :array_1
    .array-data 4
        0x50
        0x60
        0x60
        0x80
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lutil/a/z/w/c;-><init>()V

    return-void
.end method

.method public static a()B
    .locals 1

    const/16 v0, 0x10

    return v0
.end method

.method private static a(III)Ljava/lang/String;
    .locals 6

    new-instance v0, Ljava/lang/String;

    const/4 v4, 0x0

    mul-int/lit8 p2, p2, 0x2

    rsub-int/lit8 p2, p2, 0x29

    mul-int/lit8 p1, p1, 0x4

    rsub-int/lit8 p1, p1, 0x55

    sget-object v5, Lutil/a/z/w/f;->b:[B

    add-int/lit8 p0, p0, 0x4

    new-array v1, p2, [B

    add-int/lit8 p2, p2, -0x1

    goto :goto_1

    :goto_0
    sub-int v2, p1, v2

    add-int/lit8 p1, v2, 0x1

    :goto_1
    int-to-byte v2, p1

    aput-byte v2, v1, v4

    add-int/lit8 p0, p0, 0x1

    if-ne v4, p2, :cond_0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BI)V

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    add-int/lit8 v4, v4, 0x1

    aget-byte v2, v5, p0

    goto :goto_0
.end method
