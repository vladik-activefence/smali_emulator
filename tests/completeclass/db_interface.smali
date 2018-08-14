.class public final Lutil/a/z/l/j;
.super Ljava/lang/Object;

# interfaces
.implements Lutil/a/z/k/a;
.implements Lutil/a/z/k/c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lutil/a/z/l/j$1;
    }
.end annotation


# static fields
.field private static final c:[B


# instance fields
.field private a:Ljava/lang/String;

.field private b:Lutil/a/z/C/c;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0x68

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lutil/a/z/l/j;->c:[B

    return-void

    :array_0
    .array-data 1
        0x4at
        -0x49t
        -0x42t
        0x33t
        0x3t
        0x23t
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
        -0x4et
        0x0t
        0xct
        -0x8t
        0xat
        0x2t
        0x45t
        -0x45t
        -0x8t
        -0x2t
        0x53t
        -0x56t
        0x6t
        0xat
        -0xat
        0x10t
        -0x18t
        0xat
        -0x12t
        0x9t
        0xct
        0x3t
        -0x10t
        0x10t
        0x2t
        0x45t
        -0x53t
        0x14t
        0x0t
        -0x9t
        0x8t
        0x46t
        -0x42t
        -0xbt
        0x4t
        -0x8t
        0x9t
        0x0t
        0x4ft
        -0x4at
        0x7t
        -0x13t
        0x16t
        -0xat
        -0x8t
        0x11t
        0x46t
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
        0x3t
        0x23t
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
        -0x4et
        0x0t
        0xct
        -0x8t
        0xat
        0x2t
        0x45t
        -0x45t
        -0x8t
        -0x2t
        0x53t
        -0x51t
        0xet
        0x5t
        -0x2t
    .end array-data
.end method

.method private static a(III)Ljava/lang/String;
    .locals 6

    sget-object v5, Lutil/a/z/l/j;->c:[B

    rsub-int/lit8 p1, p1, 0x76

    add-int/lit8 p0, p0, 0x14

    add-int/lit8 p2, p2, 0x4

    const/4 v4, 0x0

    new-instance v0, Ljava/lang/String;

    new-array v1, p0, [B

    add-int/lit8 p0, p0, -0x1

    goto :goto_1

    :goto_0
    sub-int v2, p1, v2

    add-int/lit8 p1, v2, 0x1

    add-int/lit8 p2, p2, 0x1

    :goto_1
    int-to-byte v2, p1

    aput-byte v2, v1, v4

    if-ne v4, p0, :cond_0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BI)V

    return-object v0

    :cond_0
    add-int/lit8 v4, v4, 0x1

    aget-byte v2, v5, p2

    goto :goto_0
.end method

