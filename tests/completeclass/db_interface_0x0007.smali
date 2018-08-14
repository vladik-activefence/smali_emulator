.class final Lutil/a/z/l/e;
.super Ljava/lang/Object;

# interfaces
.implements Lutil/a/z/l/f;


# static fields
.field private static final e:[B



# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0x2e

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lutil/a/z/l/e;->e:[B

    return-void

    :array_0
    .array-data 1
        0x27t
        0x44t
        -0x1bt
        -0x34t
        -0x16t
        0x1t
        0x43t
        -0x4et
        0x5t
        -0xbt
        0x5t
        -0xft
        0xat
        0x46t
        -0x51t
        0x7t
        0x44t
        -0x2bt
        -0xft
        0x34t
        -0x4bt
        -0xct
        0x51t
        -0x50t
        -0x3t
        -0x7t
        0x52t
        -0x45t
        -0xet
        -0x5t
        -0x2t
        0xbt
        0x0t
        -0x13t
        -0x27t
        -0xat
        0x13t
        -0xdt
        0x1t
        0x3t
        0x42t
        -0x4bt
        -0x7t
        -0x4t
        -0x7t
        -0x1t
    .end array-data
.end method

.method private static a(III)Ljava/lang/String;
    .locals 6

    sget-object v5, Lutil/a/z/l/e;->e:[B

    const/4 v4, 0x0

    new-instance v0, Ljava/lang/String;

    mul-int/lit8 p1, p1, 0x12

    rsub-int/lit8 p1, p1, 0x1f

    mul-int/lit8 p0, p0, 0xb

    rsub-int/lit8 p0, p0, 0x54

    add-int/lit8 p2, p2, 0x4

    new-array v1, p1, [B

    add-int/lit8 p1, p1, -0x1

    goto :goto_1

    :goto_0
    sub-int v2, p0, v2

    add-int/lit8 p0, v2, -0x2

    :goto_1
    int-to-byte v2, p0

    aput-byte v2, v1, v4

    add-int/lit8 p2, p2, 0x1

    if-ne v4, p1, :cond_0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BI)V

    return-object v0

    :cond_0
    aget-byte v2, v5, p2

    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method
