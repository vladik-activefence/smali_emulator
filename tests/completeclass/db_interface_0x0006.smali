.class public final Lutil/a/z/l/c;
.super Ljava/lang/Object;

# interfaces
.implements Lutil/a/z/k/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lutil/a/z/l/c$1;
    }
.end annotation


# static fields
.field private static final e:[B


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0x77

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lutil/a/z/l/c;->e:[B

    return-void

    :array_0
    .array-data 1
        0x28t
        0x43t
        -0x3ft
        -0x24t
        0x20t
        0x1t
        -0x1t
        0xet
        -0x41t
        0x3ft
        0xct
        0x10t
        -0x46t
        -0x4t
        0x54t
        0xbt
        0x4t
        0x1t
        0xat
        0x4t
        -0x4ft
        0x48t
        0x3t
        0x12t
        0x5t
        0x6t
        0xat
        -0x4ft
        0x47t
        0x8t
        -0x40t
        0x53t
        0xct
        -0x4t
        0x5t
        0x9t
        0x13t
        0x20t
        0x1t
        -0x1t
        0xet
        -0x41t
        0x3ft
        0xct
        0x10t
        -0x46t
        -0x4t
        0x4et
        0xat
        0x7t
        0xat
        0x4t
        -0x4ft
        0x48t
        0x3t
        0x12t
        0x5t
        0x6t
        0xat
        -0x4ft
        0x47t
        0x8t
        -0x40t
        0x53t
        0xct
        -0x4t
        0x5t
        -0x10t
        0x10t
        0xet
        -0xbt
        -0x40t
        0x48t
        0x3t
        0x12t
        0x5t
        0x6t
        0xat
        -0x4ft
        0x47t
        0x8t
        -0x40t
        0x53t
        0xct
        -0x4t
        0x5t
        0xbt
        -0x2at
        0x4at
        0x18t
        -0x10t
        0x7t
        0x10t
        0x9t
        -0x6t
        0xbt
        0x4t
        -0x49t
        0x49t
        0x16t
        0x2t
        -0x4t
        0xat
        -0x2t
        -0x42t
        0x50t
        -0x1t
        0x19t
        -0x54t
        0x4ct
        0x3t
        0xet
        -0x4t
        0x12t
        -0xct
        0x18t
        -0x6t
        0xbt
        0x4t
    .end array-data
.end method


.method private static a(III)Ljava/lang/String;
    .locals 6

    sget-object v5, Lutil/a/z/l/c;->e:[B

    new-instance v0, Ljava/lang/String;

    add-int/lit8 p0, p0, 0x41

    add-int/lit8 p1, p1, 0x3

    rsub-int/lit8 p2, p2, 0x55

    const/4 v4, 0x0

    new-array v1, p1, [B

    add-int/lit8 p1, p1, -0x1

    goto :goto_1

    :goto_0
    add-int/2addr v2, p0

    add-int/lit8 p0, v2, -0x5

    :goto_1
    add-int/lit8 p2, p2, 0x1

    int-to-byte v2, p0

    aput-byte v2, v1, v4

    if-ne v4, p1, :cond_0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BI)V

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    add-int/lit8 v4, v4, 0x1

    aget-byte v2, v5, p2

    goto :goto_0
.end method

