.class public final Lutil/a/z/l/i;
.super Ljava/lang/Object;

# interfaces
.implements Lutil/a/z/k/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lutil/a/z/l/i$1;
    }
.end annotation


# static fields
.field private static final f:[B

.field private static g:I


# instance fields
.field private a:Lutil/a/z/k/a;

.field private b:Lutil/a/z/k/c;

.field private c:Lutil/a/z/f/a;

.field private d:Lutil/a/z/A/a;

.field private e:[B


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0x70

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lutil/a/z/l/i;->f:[B

    const/16 v0, 0x1a

    sput v0, Lutil/a/z/l/i;->g:I

    return-void

    :array_0
    .array-data 1
        0x46t
        0x6bt
        -0x38t
        -0x78t
        0x19t
        -0x9t
        0x13t
        -0x8t
        -0xbt
        -0x2t
        0x11t
        -0xft
        -0x1t
        -0x44t
        0x54t
        -0x13t
        0x1t
        0xat
        -0x7t
        -0x45t
        0x43t
        0xct
        -0x3t
        0x9t
        -0x8t
        0x1t
        -0x4et
        0x4bt
        -0x6t
        0x14t
        0x1bt
        -0x4t
        -0x6t
        0x9t
        -0x46t
        0x3at
        0x7t
        0xbt
        -0x4bt
        -0x9t
        0x4ft
        0x6t
        -0x1t
        -0x4t
        0x5t
        -0x1t
        -0x54t
        0x43t
        -0x2t
        0xdt
        0x0t
        0x1t
        0x5t
        -0x54t
        0x42t
        0x3t
        -0x45t
        0x4et
        0x7t
        -0x9t
        0x0t
        0x4t
        0xet
        0x1bt
        -0x4t
        -0x6t
        0x9t
        -0x46t
        0x3at
        0x7t
        0xbt
        -0x4bt
        -0x9t
        0x49t
        0x5t
        0x2t
        0x5t
        -0x1t
        -0x54t
        0x43t
        -0x2t
        0xdt
        0x0t
        0x1t
        0x5t
        -0x54t
        0x42t
        0x3t
        -0x45t
        0x4et
        0x7t
        -0x9t
        0x0t
        -0x15t
        0xbt
        0x9t
        -0x10t
        -0x45t
        0x43t
        -0x2t
        0xdt
        0x0t
        0x1t
        0x5t
        -0x54t
        0x42t
        0x3t
        -0x45t
        0x4et
        0x7t
        -0x9t
        0x0t
    .end array-data
.end method

.method private static a(III)Ljava/lang/String;
    .locals 5

    add-int/lit8 p2, p2, 0x41

    sget-object v4, Lutil/a/z/l/i;->f:[B

    add-int/lit8 p0, p0, 0x3

    rsub-int/lit8 p1, p1, 0x5c

    new-instance v0, Ljava/lang/String;

    const/4 v3, 0x0

    new-array v1, p0, [B

    add-int/lit8 p0, p0, -0x1

    goto :goto_1

    :goto_0
    add-int/2addr p2, v2

    :goto_1
    int-to-byte v2, p2

    aput-byte v2, v1, v3

    if-ne v3, p0, :cond_0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BI)V

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    add-int/lit8 p1, p1, 0x1

    add-int/lit8 v3, v3, 0x1

    aget-byte v2, v4, p1

    goto :goto_0
.end method
