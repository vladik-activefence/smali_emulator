.class public final Lutil/a/z/l/a;
.super Ljava/lang/Object;

# interfaces
.implements Lutil/a/z/k/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lutil/a/z/l/a$1;
    }
.end annotation


# static fields
.field private static final d:[B

.field private static e:I


# instance fields
.field private a:Lutil/a/z/k/a;

.field private b:Lutil/a/z/k/c;

.field private c:Lutil/a/z/A/a;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0x81

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lutil/a/z/l/a;->d:[B

    const/16 v0, 0x40

    sput v0, Lutil/a/z/l/a;->e:I

    return-void

    :array_0
    .array-data 1
        0x5t
        0x30t
        -0x5t
        0x5t
        -0x1bt
        0x7t
        -0x15t
        0x6t
        0x9t
        0x0t
        -0x13t
        0xdt
        -0x1t
        0x42t
        -0x56t
        0x11t
        -0x3t
        -0xct
        0x5t
        0x43t
        -0x45t
        -0xet
        0x1t
        -0xbt
        0x6t
        -0x3t
        0x4ct
        -0x4dt
        0x4t
        -0x16t
        -0x1dt
        0x2t
        0x4t
        -0xbt
        0x44t
        -0x3ct
        -0x9t
        -0xdt
        0x49t
        0x7t
        -0x51t
        -0x8t
        -0x1t
        0x2t
        -0x7t
        -0x1t
        0x52t
        -0x45t
        0x0t
        -0xft
        -0x2t
        -0x3t
        -0x7t
        0x52t
        -0x44t
        -0x5t
        0x43t
        -0x50t
        -0x9t
        0x7t
        -0x2t
        -0x6t
        -0x10t
        -0x1dt
        0x2t
        0x4t
        -0xbt
        0x44t
        -0x3ct
        -0x9t
        -0xdt
        0x49t
        0x7t
        -0x4bt
        -0x7t
        -0x4t
        -0x7t
        -0x1t
        0x52t
        -0x45t
        0x0t
        -0xft
        -0x2t
        -0x3t
        -0x7t
        0x52t
        -0x44t
        -0x5t
        0x43t
        -0x50t
        -0x9t
        0x7t
        -0x2t
        0x13t
        -0xdt
        -0xbt
        0xet
        0x43t
        -0x45t
        0x0t
        -0xft
        -0x2t
        -0x3t
        -0x7t
        0x52t
        -0x44t
        -0x5t
        0x43t
        -0x50t
        -0x9t
        0x7t
        -0x2t
        -0x11t
        -0xft
        0x7t
        0x1t
        -0x15t
        0x57t
        -0x4at
        -0x7t
        0xat
        -0x4t
        0x41t
        -0x48t
        0x3t
        -0xat
        -0x5t
        0x5t
        -0x1t
    .end array-data
.end method

.method private static a(III)Ljava/lang/String;
    .locals 6

    add-int/lit8 p2, p2, 0x3

    new-instance v0, Ljava/lang/String;

    add-int/lit8 p1, p1, 0x4

    rsub-int/lit8 p0, p0, 0x76

    const/4 v5, 0x0

    sget-object v4, Lutil/a/z/l/a;->d:[B

    new-array v1, p2, [B

    add-int/lit8 p2, p2, -0x1

    goto :goto_1

    :goto_0
    sub-int v2, p0, v2

    add-int/lit8 p0, v2, -0x2

    :goto_1
    int-to-byte v2, p0

    aput-byte v2, v1, v5

    if-ne v5, p2, :cond_0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BI)V

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    add-int/lit8 v5, v5, 0x1

    add-int/lit8 p1, p1, 0x1

    aget-byte v2, v4, p1

    goto :goto_0
.end method
