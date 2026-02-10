{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE NoImplicitPrelude #-}

module Generated.Janet where

import C.Expr.HostPlatform qualified as C
import Data.Array.Byte qualified
import Data.Bits (FiniteBits)
import Data.Bits qualified as Bits
import Data.Ix qualified as Ix
import Data.List.NonEmpty qualified
import Data.Primitive.Types qualified
import Data.Proxy qualified
import Data.Void (Void)
import Foreign qualified as F
import Foreign.C qualified as FC
import GHC.Generics qualified
import GHC.Ptr qualified as Ptr
import GHC.Records qualified
import HsBindgen.Runtime.CEnum qualified
import HsBindgen.Runtime.HasCField qualified
import HsBindgen.Runtime.Internal.Bitfield qualified
import HsBindgen.Runtime.Internal.ByteArray qualified
import HsBindgen.Runtime.Internal.HasFFIType qualified
import HsBindgen.Runtime.Internal.SizedByteArray qualified
import HsBindgen.Runtime.Internal.TypeEquality (TyEq)
import HsBindgen.Runtime.LibC qualified
import HsBindgen.Runtime.Marshal qualified
import HsBindgen.Runtime.PtrConst qualified
import Text.Read qualified
import Prelude (
    Bounded,
    Enum,
    Eq,
    IO,
    Int,
    Integral,
    Num,
    Ord,
    Read,
    Real,
    Show,
    pure,
    showsPrec,
    (<*>),
    (>>),
 )

{- | __C declaration:__ @JANET_VERSION_MAJOR@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 28:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_VERSION_MAJOR :: FC.CInt
jANET_VERSION_MAJOR = (1 :: FC.CInt)

{- | __C declaration:__ @JANET_VERSION_MINOR@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 29:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_VERSION_MINOR :: FC.CInt
jANET_VERSION_MINOR = (38 :: FC.CInt)

{- | __C declaration:__ @JANET_VERSION_PATCH@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 30:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_VERSION_PATCH :: FC.CInt
jANET_VERSION_PATCH = (0 :: FC.CInt)

{- | __C declaration:__ @JANET_VERSION_EXTRA@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 31:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_VERSION_EXTRA :: ((,) (Ptr.Ptr FC.CChar)) Int
jANET_VERSION_EXTRA =
    ((Ptr.Ptr ""#, 0) :: FC.CStringLen)

{- | __C declaration:__ @JANET_VERSION@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 32:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_VERSION :: ((,) (Ptr.Ptr FC.CChar)) Int
jANET_VERSION =
    ((Ptr.Ptr "1.38.0"#, 6) :: FC.CStringLen)

{- | __C declaration:__ @JANET_BUILD@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 116:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_BUILD :: ((,) (Ptr.Ptr FC.CChar)) Int
jANET_BUILD =
    ((Ptr.Ptr "local"#, 5) :: FC.CStringLen)

{- | __C declaration:__ @JANET_APPLE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 133:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_APPLE :: FC.CInt
jANET_APPLE = (1 :: FC.CInt)

{- | __C declaration:__ @JANET_POSIX@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 164:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_POSIX :: FC.CInt
jANET_POSIX = (1 :: FC.CInt)

{- | __C declaration:__ @JANET_64@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 193:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_64 :: FC.CInt
jANET_64 = (1 :: FC.CInt)

{- | __C declaration:__ @JANET_LITTLE_ENDIAN@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 205:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_LITTLE_ENDIAN :: FC.CInt
jANET_LITTLE_ENDIAN = (1 :: FC.CInt)

{- | __C declaration:__ @JANET_INTMAX_DOUBLE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 224:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_INTMAX_DOUBLE :: FC.CDouble
jANET_INTMAX_DOUBLE =
    (9.007199254740992e15 :: FC.CDouble)

{- | __C declaration:__ @JANET_INTMIN_DOUBLE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 225:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_INTMIN_DOUBLE :: FC.CDouble
jANET_INTMIN_DOUBLE =
    C.negate (9.007199254740992e15 :: FC.CDouble)

{- | __C declaration:__ @JANET_INTMAX_INT64@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 226:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_INTMAX_INT64 :: FC.CInt
jANET_INTMAX_INT64 = (9007199254740992 :: FC.CInt)

{- | __C declaration:__ @JANET_INTMIN_INT64@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 227:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_INTMIN_INT64 :: FC.CInt
jANET_INTMIN_INT64 =
    C.negate (9007199254740992 :: FC.CInt)

{- | __C declaration:__ @JANET_RECURSION_GUARD@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 355:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_RECURSION_GUARD :: FC.CInt
jANET_RECURSION_GUARD = (1024 :: FC.CInt)

{- | __C declaration:__ @JANET_MAX_PROTO_DEPTH@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 358:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_MAX_PROTO_DEPTH :: FC.CInt
jANET_MAX_PROTO_DEPTH = (200 :: FC.CInt)

{- | __C declaration:__ @JANET_MAX_MACRO_EXPAND@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 361:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_MAX_MACRO_EXPAND :: FC.CInt
jANET_MAX_MACRO_EXPAND = (200 :: FC.CInt)

{- | __C declaration:__ @JANET_STACK_MAX@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 366:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_STACK_MAX :: FC.CInt
jANET_STACK_MAX = (2147483647 :: FC.CInt)

{- | __C declaration:__ @JANET_NANBOX_BIT@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 392:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_NANBOX_BIT :: FC.CInt
jANET_NANBOX_BIT = (0 :: FC.CInt)

{- | __C declaration:__ @JANET_SINGLE_THREADED_BIT@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 400:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SINGLE_THREADED_BIT :: FC.CInt
jANET_SINGLE_THREADED_BIT = (0 :: FC.CInt)

{- | __C declaration:__ @JANET_CURRENT_CONFIG_BITS@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 403:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_CURRENT_CONFIG_BITS :: FC.CInt
jANET_CURRENT_CONFIG_BITS =
    (C..|.) jANET_SINGLE_THREADED_BIT jANET_NANBOX_BIT

{- | __C declaration:__ @JANET_HANDLE_NONE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 477:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_HANDLE_NONE :: FC.CInt
jANET_HANDLE_NONE = C.negate (1 :: FC.CInt)

{- | __C declaration:__ @JanetAtomicInt@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 736:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
newtype JanetAtomicInt = JanetAtomicInt
    { unwrapJanetAtomicInt :: HsBindgen.Runtime.LibC.Int32
    }
    deriving stock (GHC.Generics.Generic)
    deriving stock (Eq, Ord, Read, Show)
    deriving newtype
        ( Bits.Bits
        , Bounded
        , Data.Primitive.Types.Prim
        , Enum
        , F.Storable
        , FiniteBits
        , HsBindgen.Runtime.Internal.Bitfield.Bitfield
        , HsBindgen.Runtime.Internal.HasFFIType.HasFFIType
        , HsBindgen.Runtime.Marshal.ReadRaw
        , HsBindgen.Runtime.Marshal.StaticSize
        , HsBindgen.Runtime.Marshal.WriteRaw
        , Integral
        , Ix.Ix
        , Num
        , Real
        )

instance
    ( TyEq
        ty
        ((HsBindgen.Runtime.HasCField.CFieldType JanetAtomicInt) "unwrapJanetAtomicInt")
    ) =>
    GHC.Records.HasField
        "unwrapJanetAtomicInt"
        (Ptr.Ptr JanetAtomicInt)
        (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"unwrapJanetAtomicInt")

instance HsBindgen.Runtime.HasCField.HasCField JanetAtomicInt "unwrapJanetAtomicInt" where
    type
        CFieldType JanetAtomicInt "unwrapJanetAtomicInt" =
            HsBindgen.Runtime.LibC.Int32

    offset# = \_ -> \_ -> 0

{- | __C declaration:__ @union \@JanetGCObject_data@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1008:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
newtype JanetGCObject_data = JanetGCObject_data
    { unwrapJanetGCObject_data :: Data.Array.Byte.ByteArray
    }
    deriving stock (GHC.Generics.Generic)

deriving via
    (HsBindgen.Runtime.Internal.SizedByteArray.SizedByteArray 8) 8
    instance
        HsBindgen.Runtime.Marshal.StaticSize JanetGCObject_data

deriving via
    (HsBindgen.Runtime.Internal.SizedByteArray.SizedByteArray 8) 8
    instance
        HsBindgen.Runtime.Marshal.ReadRaw JanetGCObject_data

deriving via
    (HsBindgen.Runtime.Internal.SizedByteArray.SizedByteArray 8) 8
    instance
        HsBindgen.Runtime.Marshal.WriteRaw JanetGCObject_data

deriving via
    HsBindgen.Runtime.Marshal.EquivStorable JanetGCObject_data
    instance
        F.Storable JanetGCObject_data

{- |

  __See:__ 'set_janetGCObject_data_next'

__C declaration:__ @next@

__defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1009:24@

__exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
get_janetGCObject_data_next ::
    JanetGCObject_data ->
    Ptr.Ptr JanetGCObject
get_janetGCObject_data_next =
    HsBindgen.Runtime.Internal.ByteArray.getUnionPayload

{- |

  __See:__ 'get_janetGCObject_data_next'
-}
set_janetGCObject_data_next ::
    Ptr.Ptr JanetGCObject ->
    JanetGCObject_data
set_janetGCObject_data_next =
    HsBindgen.Runtime.Internal.ByteArray.setUnionPayload

{- |

  __See:__ 'set_janetGCObject_data_refcount'

__C declaration:__ @refcount@

__defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1010:33@

__exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
get_janetGCObject_data_refcount ::
    JanetGCObject_data ->
    JanetAtomicInt
get_janetGCObject_data_refcount =
    HsBindgen.Runtime.Internal.ByteArray.getUnionPayload

{- |

  __See:__ 'get_janetGCObject_data_refcount'
-}
set_janetGCObject_data_refcount ::
    JanetAtomicInt ->
    JanetGCObject_data
set_janetGCObject_data_refcount =
    HsBindgen.Runtime.Internal.ByteArray.setUnionPayload

instance
    HsBindgen.Runtime.HasCField.HasCField
        JanetGCObject_data
        "janetGCObject_data_next"
    where
    type
        CFieldType JanetGCObject_data "janetGCObject_data_next" =
            Ptr.Ptr JanetGCObject

    offset# = \_ -> \_ -> 0

instance
    ( TyEq
        ty
        ( (HsBindgen.Runtime.HasCField.CFieldType JanetGCObject_data)
            "janetGCObject_data_next"
        )
    ) =>
    GHC.Records.HasField
        "janetGCObject_data_next"
        (Ptr.Ptr JanetGCObject_data)
        (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr
            (Data.Proxy.Proxy @"janetGCObject_data_next")

instance
    HsBindgen.Runtime.HasCField.HasCField
        JanetGCObject_data
        "janetGCObject_data_refcount"
    where
    type
        CFieldType JanetGCObject_data "janetGCObject_data_refcount" =
            JanetAtomicInt

    offset# = \_ -> \_ -> 0

instance
    ( TyEq
        ty
        ( (HsBindgen.Runtime.HasCField.CFieldType JanetGCObject_data)
            "janetGCObject_data_refcount"
        )
    ) =>
    GHC.Records.HasField
        "janetGCObject_data_refcount"
        (Ptr.Ptr JanetGCObject_data)
        (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr
            (Data.Proxy.Proxy @"janetGCObject_data_refcount")

{- | __C declaration:__ @struct JanetGCObject@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1006:8@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
data JanetGCObject = JanetGCObject
    { janetGCObject_flags :: HsBindgen.Runtime.LibC.Int32
    {- ^ __C declaration:__ @flags@

         __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1007:13@

         __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
    -}
    , janetGCObject_data :: JanetGCObject_data
    {- ^ __C declaration:__ @data@

         __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1011:7@

         __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
    -}
    }
    deriving stock (GHC.Generics.Generic)

instance HsBindgen.Runtime.Marshal.StaticSize JanetGCObject where
    staticSizeOf = \_ -> (16 :: Int)

    staticAlignment = \_ -> (8 :: Int)

instance HsBindgen.Runtime.Marshal.ReadRaw JanetGCObject where
    readRaw =
        \ptr0 ->
            pure JanetGCObject
                <*> HsBindgen.Runtime.HasCField.readRaw
                    (Data.Proxy.Proxy @"janetGCObject_flags")
                    ptr0
                <*> HsBindgen.Runtime.HasCField.readRaw
                    (Data.Proxy.Proxy @"janetGCObject_data")
                    ptr0

instance HsBindgen.Runtime.Marshal.WriteRaw JanetGCObject where
    writeRaw =
        \ptr0 ->
            \s1 ->
                case s1 of
                    JanetGCObject janetGCObject_flags2 janetGCObject_data3 ->
                        HsBindgen.Runtime.HasCField.writeRaw
                            (Data.Proxy.Proxy @"janetGCObject_flags")
                            ptr0
                            janetGCObject_flags2
                            >> HsBindgen.Runtime.HasCField.writeRaw
                                (Data.Proxy.Proxy @"janetGCObject_data")
                                ptr0
                                janetGCObject_data3

deriving via
    HsBindgen.Runtime.Marshal.EquivStorable JanetGCObject
    instance
        F.Storable JanetGCObject

instance HsBindgen.Runtime.HasCField.HasCField JanetGCObject "janetGCObject_flags" where
    type
        CFieldType JanetGCObject "janetGCObject_flags" =
            HsBindgen.Runtime.LibC.Int32

    offset# = \_ -> \_ -> 0

instance
    ( TyEq
        ty
        ((HsBindgen.Runtime.HasCField.CFieldType JanetGCObject) "janetGCObject_flags")
    ) =>
    GHC.Records.HasField "janetGCObject_flags" (Ptr.Ptr JanetGCObject) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janetGCObject_flags")

instance HsBindgen.Runtime.HasCField.HasCField JanetGCObject "janetGCObject_data" where
    type
        CFieldType JanetGCObject "janetGCObject_data" =
            JanetGCObject_data

    offset# = \_ -> \_ -> 8

instance
    ( TyEq
        ty
        ((HsBindgen.Runtime.HasCField.CFieldType JanetGCObject) "janetGCObject_data")
    ) =>
    GHC.Records.HasField "janetGCObject_data" (Ptr.Ptr JanetGCObject) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janetGCObject_data")

{- | __C declaration:__ @struct JanetArray@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1061:8@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
data JanetArray = JanetArray
    { janetArray_gc :: JanetGCObject
    {- ^ __C declaration:__ @gc@

         __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1062:19@

         __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
    -}
    , janetArray_count :: HsBindgen.Runtime.LibC.Int32
    {- ^ __C declaration:__ @count@

         __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1063:13@

         __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
    -}
    , janetArray_capacity :: HsBindgen.Runtime.LibC.Int32
    {- ^ __C declaration:__ @capacity@

         __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1064:13@

         __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
    -}
    , janetArray_data :: Ptr.Ptr Janet
    {- ^ __C declaration:__ @data@

         __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1065:12@

         __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
    -}
    }
    deriving stock (GHC.Generics.Generic)

instance HsBindgen.Runtime.Marshal.StaticSize JanetArray where
    staticSizeOf = \_ -> (32 :: Int)

    staticAlignment = \_ -> (8 :: Int)

instance HsBindgen.Runtime.Marshal.ReadRaw JanetArray where
    readRaw =
        \ptr0 ->
            pure JanetArray
                <*> HsBindgen.Runtime.HasCField.readRaw (Data.Proxy.Proxy @"janetArray_gc") ptr0
                <*> HsBindgen.Runtime.HasCField.readRaw (Data.Proxy.Proxy @"janetArray_count") ptr0
                <*> HsBindgen.Runtime.HasCField.readRaw
                    (Data.Proxy.Proxy @"janetArray_capacity")
                    ptr0
                <*> HsBindgen.Runtime.HasCField.readRaw (Data.Proxy.Proxy @"janetArray_data") ptr0

instance HsBindgen.Runtime.Marshal.WriteRaw JanetArray where
    writeRaw =
        \ptr0 ->
            \s1 ->
                case s1 of
                    JanetArray
                        janetArray_gc2
                        janetArray_count3
                        janetArray_capacity4
                        janetArray_data5 ->
                            HsBindgen.Runtime.HasCField.writeRaw
                                (Data.Proxy.Proxy @"janetArray_gc")
                                ptr0
                                janetArray_gc2
                                >> HsBindgen.Runtime.HasCField.writeRaw
                                    (Data.Proxy.Proxy @"janetArray_count")
                                    ptr0
                                    janetArray_count3
                                >> HsBindgen.Runtime.HasCField.writeRaw
                                    (Data.Proxy.Proxy @"janetArray_capacity")
                                    ptr0
                                    janetArray_capacity4
                                >> HsBindgen.Runtime.HasCField.writeRaw
                                    (Data.Proxy.Proxy @"janetArray_data")
                                    ptr0
                                    janetArray_data5

deriving via
    HsBindgen.Runtime.Marshal.EquivStorable JanetArray
    instance
        F.Storable JanetArray

instance HsBindgen.Runtime.HasCField.HasCField JanetArray "janetArray_gc" where
    type
        CFieldType JanetArray "janetArray_gc" =
            JanetGCObject

    offset# = \_ -> \_ -> 0

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType JanetArray) "janetArray_gc")) =>
    GHC.Records.HasField "janetArray_gc" (Ptr.Ptr JanetArray) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janetArray_gc")

instance HsBindgen.Runtime.HasCField.HasCField JanetArray "janetArray_count" where
    type
        CFieldType JanetArray "janetArray_count" =
            HsBindgen.Runtime.LibC.Int32

    offset# = \_ -> \_ -> 16

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType JanetArray) "janetArray_count")) =>
    GHC.Records.HasField "janetArray_count" (Ptr.Ptr JanetArray) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janetArray_count")

instance HsBindgen.Runtime.HasCField.HasCField JanetArray "janetArray_capacity" where
    type
        CFieldType JanetArray "janetArray_capacity" =
            HsBindgen.Runtime.LibC.Int32

    offset# = \_ -> \_ -> 20

instance
    ( TyEq
        ty
        ((HsBindgen.Runtime.HasCField.CFieldType JanetArray) "janetArray_capacity")
    ) =>
    GHC.Records.HasField "janetArray_capacity" (Ptr.Ptr JanetArray) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janetArray_capacity")

instance HsBindgen.Runtime.HasCField.HasCField JanetArray "janetArray_data" where
    type
        CFieldType JanetArray "janetArray_data" =
            Ptr.Ptr Janet

    offset# = \_ -> \_ -> 24

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType JanetArray) "janetArray_data")) =>
    GHC.Records.HasField "janetArray_data" (Ptr.Ptr JanetArray) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janetArray_data")

{- | __C declaration:__ @struct JanetTable@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1077:8@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
data JanetTable = JanetTable
    { janetTable_gc :: JanetGCObject
    {- ^ __C declaration:__ @gc@

         __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1078:19@

         __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
    -}
    , janetTable_count :: HsBindgen.Runtime.LibC.Int32
    {- ^ __C declaration:__ @count@

         __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1079:13@

         __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
    -}
    , janetTable_capacity :: HsBindgen.Runtime.LibC.Int32
    {- ^ __C declaration:__ @capacity@

         __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1080:13@

         __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
    -}
    , janetTable_deleted :: HsBindgen.Runtime.LibC.Int32
    {- ^ __C declaration:__ @deleted@

         __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1081:13@

         __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
    -}
    , janetTable_data :: Ptr.Ptr JanetKV
    {- ^ __C declaration:__ @data@

         __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1082:14@

         __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
    -}
    , janetTable_proto :: Ptr.Ptr JanetTable
    {- ^ __C declaration:__ @proto@

         __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1083:17@

         __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
    -}
    }
    deriving stock (GHC.Generics.Generic)

instance HsBindgen.Runtime.Marshal.StaticSize JanetTable where
    staticSizeOf = \_ -> (48 :: Int)

    staticAlignment = \_ -> (8 :: Int)

instance HsBindgen.Runtime.Marshal.ReadRaw JanetTable where
    readRaw =
        \ptr0 ->
            pure JanetTable
                <*> HsBindgen.Runtime.HasCField.readRaw (Data.Proxy.Proxy @"janetTable_gc") ptr0
                <*> HsBindgen.Runtime.HasCField.readRaw (Data.Proxy.Proxy @"janetTable_count") ptr0
                <*> HsBindgen.Runtime.HasCField.readRaw
                    (Data.Proxy.Proxy @"janetTable_capacity")
                    ptr0
                <*> HsBindgen.Runtime.HasCField.readRaw
                    (Data.Proxy.Proxy @"janetTable_deleted")
                    ptr0
                <*> HsBindgen.Runtime.HasCField.readRaw (Data.Proxy.Proxy @"janetTable_data") ptr0
                <*> HsBindgen.Runtime.HasCField.readRaw (Data.Proxy.Proxy @"janetTable_proto") ptr0

instance HsBindgen.Runtime.Marshal.WriteRaw JanetTable where
    writeRaw =
        \ptr0 ->
            \s1 ->
                case s1 of
                    JanetTable
                        janetTable_gc2
                        janetTable_count3
                        janetTable_capacity4
                        janetTable_deleted5
                        janetTable_data6
                        janetTable_proto7 ->
                            HsBindgen.Runtime.HasCField.writeRaw
                                (Data.Proxy.Proxy @"janetTable_gc")
                                ptr0
                                janetTable_gc2
                                >> HsBindgen.Runtime.HasCField.writeRaw
                                    (Data.Proxy.Proxy @"janetTable_count")
                                    ptr0
                                    janetTable_count3
                                >> HsBindgen.Runtime.HasCField.writeRaw
                                    (Data.Proxy.Proxy @"janetTable_capacity")
                                    ptr0
                                    janetTable_capacity4
                                >> HsBindgen.Runtime.HasCField.writeRaw
                                    (Data.Proxy.Proxy @"janetTable_deleted")
                                    ptr0
                                    janetTable_deleted5
                                >> HsBindgen.Runtime.HasCField.writeRaw
                                    (Data.Proxy.Proxy @"janetTable_data")
                                    ptr0
                                    janetTable_data6
                                >> HsBindgen.Runtime.HasCField.writeRaw
                                    (Data.Proxy.Proxy @"janetTable_proto")
                                    ptr0
                                    janetTable_proto7

deriving via
    HsBindgen.Runtime.Marshal.EquivStorable JanetTable
    instance
        F.Storable JanetTable

instance HsBindgen.Runtime.HasCField.HasCField JanetTable "janetTable_gc" where
    type
        CFieldType JanetTable "janetTable_gc" =
            JanetGCObject

    offset# = \_ -> \_ -> 0

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType JanetTable) "janetTable_gc")) =>
    GHC.Records.HasField "janetTable_gc" (Ptr.Ptr JanetTable) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janetTable_gc")

instance HsBindgen.Runtime.HasCField.HasCField JanetTable "janetTable_count" where
    type
        CFieldType JanetTable "janetTable_count" =
            HsBindgen.Runtime.LibC.Int32

    offset# = \_ -> \_ -> 16

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType JanetTable) "janetTable_count")) =>
    GHC.Records.HasField "janetTable_count" (Ptr.Ptr JanetTable) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janetTable_count")

instance HsBindgen.Runtime.HasCField.HasCField JanetTable "janetTable_capacity" where
    type
        CFieldType JanetTable "janetTable_capacity" =
            HsBindgen.Runtime.LibC.Int32

    offset# = \_ -> \_ -> 20

instance
    ( TyEq
        ty
        ((HsBindgen.Runtime.HasCField.CFieldType JanetTable) "janetTable_capacity")
    ) =>
    GHC.Records.HasField "janetTable_capacity" (Ptr.Ptr JanetTable) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janetTable_capacity")

instance HsBindgen.Runtime.HasCField.HasCField JanetTable "janetTable_deleted" where
    type
        CFieldType JanetTable "janetTable_deleted" =
            HsBindgen.Runtime.LibC.Int32

    offset# = \_ -> \_ -> 24

instance
    ( TyEq
        ty
        ((HsBindgen.Runtime.HasCField.CFieldType JanetTable) "janetTable_deleted")
    ) =>
    GHC.Records.HasField "janetTable_deleted" (Ptr.Ptr JanetTable) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janetTable_deleted")

instance HsBindgen.Runtime.HasCField.HasCField JanetTable "janetTable_data" where
    type
        CFieldType JanetTable "janetTable_data" =
            Ptr.Ptr JanetKV

    offset# = \_ -> \_ -> 32

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType JanetTable) "janetTable_data")) =>
    GHC.Records.HasField "janetTable_data" (Ptr.Ptr JanetTable) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janetTable_data")

instance HsBindgen.Runtime.HasCField.HasCField JanetTable "janetTable_proto" where
    type
        CFieldType JanetTable "janetTable_proto" =
            Ptr.Ptr JanetTable

    offset# = \_ -> \_ -> 40

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType JanetTable) "janetTable_proto")) =>
    GHC.Records.HasField "janetTable_proto" (Ptr.Ptr JanetTable) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janetTable_proto")

{- | __C declaration:__ @enum JanetType@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 557:14@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
newtype JanetType = JanetType
    { unwrapJanetType :: FC.CUInt
    }
    deriving stock (GHC.Generics.Generic)
    deriving stock (Eq, Ord)
    deriving newtype (HsBindgen.Runtime.Internal.HasFFIType.HasFFIType)

instance HsBindgen.Runtime.Marshal.StaticSize JanetType where
    staticSizeOf = \_ -> (4 :: Int)

    staticAlignment = \_ -> (4 :: Int)

instance HsBindgen.Runtime.Marshal.ReadRaw JanetType where
    readRaw =
        \ptr0 ->
            pure JanetType
                <*> HsBindgen.Runtime.Marshal.readRawByteOff ptr0 (0 :: Int)

instance HsBindgen.Runtime.Marshal.WriteRaw JanetType where
    writeRaw =
        \ptr0 ->
            \s1 ->
                case s1 of
                    JanetType unwrapJanetType2 ->
                        HsBindgen.Runtime.Marshal.writeRawByteOff ptr0 (0 :: Int) unwrapJanetType2

deriving via
    HsBindgen.Runtime.Marshal.EquivStorable JanetType
    instance
        F.Storable JanetType

deriving via FC.CUInt instance Data.Primitive.Types.Prim JanetType

instance HsBindgen.Runtime.CEnum.CEnum JanetType where
    type CEnumZ JanetType = FC.CUInt

    toCEnum = JanetType

    fromCEnum = unwrapJanetType

    declaredValues =
        \_ ->
            HsBindgen.Runtime.CEnum.declaredValuesFromList
                [ (0, Data.List.NonEmpty.singleton "JANET_NUMBER")
                , (1, Data.List.NonEmpty.singleton "JANET_NIL")
                , (2, Data.List.NonEmpty.singleton "JANET_BOOLEAN")
                , (3, Data.List.NonEmpty.singleton "JANET_FIBER")
                , (4, Data.List.NonEmpty.singleton "JANET_STRING")
                , (5, Data.List.NonEmpty.singleton "JANET_SYMBOL")
                , (6, Data.List.NonEmpty.singleton "JANET_KEYWORD")
                , (7, Data.List.NonEmpty.singleton "JANET_ARRAY")
                , (8, Data.List.NonEmpty.singleton "JANET_TUPLE")
                , (9, Data.List.NonEmpty.singleton "JANET_TABLE")
                , (10, Data.List.NonEmpty.singleton "JANET_STRUCT")
                , (11, Data.List.NonEmpty.singleton "JANET_BUFFER")
                , (12, Data.List.NonEmpty.singleton "JANET_FUNCTION")
                , (13, Data.List.NonEmpty.singleton "JANET_CFUNCTION")
                , (14, Data.List.NonEmpty.singleton "JANET_ABSTRACT")
                , (15, Data.List.NonEmpty.singleton "JANET_POINTER")
                ]

    showsUndeclared =
        HsBindgen.Runtime.CEnum.showsWrappedUndeclared "JanetType"

    readPrecUndeclared =
        HsBindgen.Runtime.CEnum.readPrecWrappedUndeclared "JanetType"

    isDeclared = HsBindgen.Runtime.CEnum.seqIsDeclared

    mkDeclared = HsBindgen.Runtime.CEnum.seqMkDeclared

instance HsBindgen.Runtime.CEnum.SequentialCEnum JanetType where
    minDeclaredValue = JANET_NUMBER

    maxDeclaredValue = JANET_POINTER

instance Show JanetType where
    showsPrec = HsBindgen.Runtime.CEnum.shows

instance Read JanetType where
    readPrec = HsBindgen.Runtime.CEnum.readPrec

    readList = Text.Read.readListDefault

    readListPrec = Text.Read.readListPrecDefault

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType JanetType) "unwrapJanetType")) =>
    GHC.Records.HasField "unwrapJanetType" (Ptr.Ptr JanetType) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"unwrapJanetType")

instance HsBindgen.Runtime.HasCField.HasCField JanetType "unwrapJanetType" where
    type
        CFieldType JanetType "unwrapJanetType" =
            FC.CUInt

    offset# = \_ -> \_ -> 0

{- | __C declaration:__ @JANET_NUMBER@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 558:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
pattern JANET_NUMBER :: JanetType
pattern JANET_NUMBER = JanetType 0

{- | __C declaration:__ @JANET_NIL@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 559:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
pattern JANET_NIL :: JanetType
pattern JANET_NIL = JanetType 1

{- | __C declaration:__ @JANET_BOOLEAN@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 560:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
pattern JANET_BOOLEAN :: JanetType
pattern JANET_BOOLEAN = JanetType 2

{- | __C declaration:__ @JANET_FIBER@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 561:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
pattern JANET_FIBER :: JanetType
pattern JANET_FIBER = JanetType 3

{- | __C declaration:__ @JANET_STRING@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 562:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
pattern JANET_STRING :: JanetType
pattern JANET_STRING = JanetType 4

{- | __C declaration:__ @JANET_SYMBOL@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 563:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
pattern JANET_SYMBOL :: JanetType
pattern JANET_SYMBOL = JanetType 5

{- | __C declaration:__ @JANET_KEYWORD@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 564:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
pattern JANET_KEYWORD :: JanetType
pattern JANET_KEYWORD = JanetType 6

{- | __C declaration:__ @JANET_ARRAY@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 565:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
pattern JANET_ARRAY :: JanetType
pattern JANET_ARRAY = JanetType 7

{- | __C declaration:__ @JANET_TUPLE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 566:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
pattern JANET_TUPLE :: JanetType
pattern JANET_TUPLE = JanetType 8

{- | __C declaration:__ @JANET_TABLE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 567:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
pattern JANET_TABLE :: JanetType
pattern JANET_TABLE = JanetType 9

{- | __C declaration:__ @JANET_STRUCT@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 568:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
pattern JANET_STRUCT :: JanetType
pattern JANET_STRUCT = JanetType 10

{- | __C declaration:__ @JANET_BUFFER@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 569:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
pattern JANET_BUFFER :: JanetType
pattern JANET_BUFFER = JanetType 11

{- | __C declaration:__ @JANET_FUNCTION@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 570:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
pattern JANET_FUNCTION :: JanetType
pattern JANET_FUNCTION = JanetType 12

{- | __C declaration:__ @JANET_CFUNCTION@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 571:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
pattern JANET_CFUNCTION :: JanetType
pattern JANET_CFUNCTION = JanetType 13

{- | __C declaration:__ @JANET_ABSTRACT@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 572:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
pattern JANET_ABSTRACT :: JanetType
pattern JANET_ABSTRACT = JanetType 14

{- | __C declaration:__ @JANET_POINTER@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 573:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
pattern JANET_POINTER :: JanetType
pattern JANET_POINTER = JanetType 15

{- | __C declaration:__ @union \@Janet_as@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 609:5@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
newtype Janet_as = Janet_as
    { unwrapJanet_as :: Data.Array.Byte.ByteArray
    }
    deriving stock (GHC.Generics.Generic)

deriving via
    (HsBindgen.Runtime.Internal.SizedByteArray.SizedByteArray 8) 8
    instance
        HsBindgen.Runtime.Marshal.StaticSize Janet_as

deriving via
    (HsBindgen.Runtime.Internal.SizedByteArray.SizedByteArray 8) 8
    instance
        HsBindgen.Runtime.Marshal.ReadRaw Janet_as

deriving via
    (HsBindgen.Runtime.Internal.SizedByteArray.SizedByteArray 8) 8
    instance
        HsBindgen.Runtime.Marshal.WriteRaw Janet_as

deriving via
    HsBindgen.Runtime.Marshal.EquivStorable Janet_as
    instance
        F.Storable Janet_as

{- |

  __See:__ 'set_janet_as_u64'

__C declaration:__ @u64@

__defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 610:18@

__exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
get_janet_as_u64 ::
    Janet_as ->
    HsBindgen.Runtime.LibC.Word64
get_janet_as_u64 =
    HsBindgen.Runtime.Internal.ByteArray.getUnionPayload

{- |

  __See:__ 'get_janet_as_u64'
-}
set_janet_as_u64 ::
    HsBindgen.Runtime.LibC.Word64 ->
    Janet_as
set_janet_as_u64 =
    HsBindgen.Runtime.Internal.ByteArray.setUnionPayload

{- |

  __See:__ 'set_janet_as_number'

__C declaration:__ @number@

__defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 611:16@

__exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
get_janet_as_number ::
    Janet_as ->
    FC.CDouble
get_janet_as_number =
    HsBindgen.Runtime.Internal.ByteArray.getUnionPayload

{- |

  __See:__ 'get_janet_as_number'
-}
set_janet_as_number ::
    FC.CDouble ->
    Janet_as
set_janet_as_number =
    HsBindgen.Runtime.Internal.ByteArray.setUnionPayload

{- |

  __See:__ 'set_janet_as_integer'

__C declaration:__ @integer@

__defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 612:17@

__exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
get_janet_as_integer ::
    Janet_as ->
    HsBindgen.Runtime.LibC.Int32
get_janet_as_integer =
    HsBindgen.Runtime.Internal.ByteArray.getUnionPayload

{- |

  __See:__ 'get_janet_as_integer'
-}
set_janet_as_integer ::
    HsBindgen.Runtime.LibC.Int32 ->
    Janet_as
set_janet_as_integer =
    HsBindgen.Runtime.Internal.ByteArray.setUnionPayload

{- |

  __See:__ 'set_janet_as_pointer'

__C declaration:__ @pointer@

__defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 613:15@

__exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
get_janet_as_pointer ::
    Janet_as ->
    Ptr.Ptr Void
get_janet_as_pointer =
    HsBindgen.Runtime.Internal.ByteArray.getUnionPayload

{- |

  __See:__ 'get_janet_as_pointer'
-}
set_janet_as_pointer ::
    Ptr.Ptr Void ->
    Janet_as
set_janet_as_pointer =
    HsBindgen.Runtime.Internal.ByteArray.setUnionPayload

{- |

  __See:__ 'set_janet_as_cpointer'

__C declaration:__ @cpointer@

__defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 614:21@

__exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
get_janet_as_cpointer ::
    Janet_as ->
    HsBindgen.Runtime.PtrConst.PtrConst Void
get_janet_as_cpointer =
    HsBindgen.Runtime.Internal.ByteArray.getUnionPayload

{- |

  __See:__ 'get_janet_as_cpointer'
-}
set_janet_as_cpointer ::
    HsBindgen.Runtime.PtrConst.PtrConst Void ->
    Janet_as
set_janet_as_cpointer =
    HsBindgen.Runtime.Internal.ByteArray.setUnionPayload

instance HsBindgen.Runtime.HasCField.HasCField Janet_as "janet_as_u64" where
    type
        CFieldType Janet_as "janet_as_u64" =
            HsBindgen.Runtime.LibC.Word64

    offset# = \_ -> \_ -> 0

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType Janet_as) "janet_as_u64")) =>
    GHC.Records.HasField "janet_as_u64" (Ptr.Ptr Janet_as) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janet_as_u64")

instance HsBindgen.Runtime.HasCField.HasCField Janet_as "janet_as_number" where
    type
        CFieldType Janet_as "janet_as_number" =
            FC.CDouble

    offset# = \_ -> \_ -> 0

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType Janet_as) "janet_as_number")) =>
    GHC.Records.HasField "janet_as_number" (Ptr.Ptr Janet_as) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janet_as_number")

instance HsBindgen.Runtime.HasCField.HasCField Janet_as "janet_as_integer" where
    type
        CFieldType Janet_as "janet_as_integer" =
            HsBindgen.Runtime.LibC.Int32

    offset# = \_ -> \_ -> 0

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType Janet_as) "janet_as_integer")) =>
    GHC.Records.HasField "janet_as_integer" (Ptr.Ptr Janet_as) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janet_as_integer")

instance HsBindgen.Runtime.HasCField.HasCField Janet_as "janet_as_pointer" where
    type
        CFieldType Janet_as "janet_as_pointer" =
            Ptr.Ptr Void

    offset# = \_ -> \_ -> 0

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType Janet_as) "janet_as_pointer")) =>
    GHC.Records.HasField "janet_as_pointer" (Ptr.Ptr Janet_as) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janet_as_pointer")

instance HsBindgen.Runtime.HasCField.HasCField Janet_as "janet_as_cpointer" where
    type
        CFieldType Janet_as "janet_as_cpointer" =
            HsBindgen.Runtime.PtrConst.PtrConst Void

    offset# = \_ -> \_ -> 0

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType Janet_as) "janet_as_cpointer")) =>
    GHC.Records.HasField "janet_as_cpointer" (Ptr.Ptr Janet_as) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janet_as_cpointer")

{- | __C declaration:__ @struct Janet@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 608:8@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
data Janet = Janet
    { janet_as :: Janet_as
    {- ^ __C declaration:__ @as@

         __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 615:7@

         __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
    -}
    , janet_type :: JanetType
    {- ^ __C declaration:__ @type@

         __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 616:15@

         __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
    -}
    }
    deriving stock (GHC.Generics.Generic)

instance HsBindgen.Runtime.Marshal.StaticSize Janet where
    staticSizeOf = \_ -> (16 :: Int)

    staticAlignment = \_ -> (8 :: Int)

instance HsBindgen.Runtime.Marshal.ReadRaw Janet where
    readRaw =
        \ptr0 ->
            pure Janet
                <*> HsBindgen.Runtime.HasCField.readRaw (Data.Proxy.Proxy @"janet_as") ptr0
                <*> HsBindgen.Runtime.HasCField.readRaw (Data.Proxy.Proxy @"janet_type") ptr0

instance HsBindgen.Runtime.Marshal.WriteRaw Janet where
    writeRaw =
        \ptr0 ->
            \s1 ->
                case s1 of
                    Janet janet_as2 janet_type3 ->
                        HsBindgen.Runtime.HasCField.writeRaw
                            (Data.Proxy.Proxy @"janet_as")
                            ptr0
                            janet_as2
                            >> HsBindgen.Runtime.HasCField.writeRaw
                                (Data.Proxy.Proxy @"janet_type")
                                ptr0
                                janet_type3

deriving via
    HsBindgen.Runtime.Marshal.EquivStorable Janet
    instance
        F.Storable Janet

instance HsBindgen.Runtime.HasCField.HasCField Janet "janet_as" where
    type CFieldType Janet "janet_as" = Janet_as

    offset# = \_ -> \_ -> 0

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType Janet) "janet_as")) =>
    GHC.Records.HasField "janet_as" (Ptr.Ptr Janet) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janet_as")

instance HsBindgen.Runtime.HasCField.HasCField Janet "janet_type" where
    type CFieldType Janet "janet_type" = JanetType

    offset# = \_ -> \_ -> 8

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType Janet) "janet_type")) =>
    GHC.Records.HasField "janet_type" (Ptr.Ptr Janet) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janet_type")

{- | __C declaration:__ @struct JanetKV@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1087:8@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
data JanetKV = JanetKV
    { janetKV_key :: Janet
    {- ^ __C declaration:__ @key@

         __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1088:11@

         __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
    -}
    , janetKV_value :: Janet
    {- ^ __C declaration:__ @value@

         __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1089:11@

         __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
    -}
    }
    deriving stock (GHC.Generics.Generic)

instance HsBindgen.Runtime.Marshal.StaticSize JanetKV where
    staticSizeOf = \_ -> (32 :: Int)

    staticAlignment = \_ -> (8 :: Int)

instance HsBindgen.Runtime.Marshal.ReadRaw JanetKV where
    readRaw =
        \ptr0 ->
            pure JanetKV
                <*> HsBindgen.Runtime.HasCField.readRaw (Data.Proxy.Proxy @"janetKV_key") ptr0
                <*> HsBindgen.Runtime.HasCField.readRaw (Data.Proxy.Proxy @"janetKV_value") ptr0

instance HsBindgen.Runtime.Marshal.WriteRaw JanetKV where
    writeRaw =
        \ptr0 ->
            \s1 ->
                case s1 of
                    JanetKV janetKV_key2 janetKV_value3 ->
                        HsBindgen.Runtime.HasCField.writeRaw
                            (Data.Proxy.Proxy @"janetKV_key")
                            ptr0
                            janetKV_key2
                            >> HsBindgen.Runtime.HasCField.writeRaw
                                (Data.Proxy.Proxy @"janetKV_value")
                                ptr0
                                janetKV_value3

deriving via
    HsBindgen.Runtime.Marshal.EquivStorable JanetKV
    instance
        F.Storable JanetKV

instance HsBindgen.Runtime.HasCField.HasCField JanetKV "janetKV_key" where
    type CFieldType JanetKV "janetKV_key" = Janet

    offset# = \_ -> \_ -> 0

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType JanetKV) "janetKV_key")) =>
    GHC.Records.HasField "janetKV_key" (Ptr.Ptr JanetKV) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janetKV_key")

instance HsBindgen.Runtime.HasCField.HasCField JanetKV "janetKV_value" where
    type CFieldType JanetKV "janetKV_value" = Janet

    offset# = \_ -> \_ -> 16

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType JanetKV) "janetKV_value")) =>
    GHC.Records.HasField "janetKV_value" (Ptr.Ptr JanetKV) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"janetKV_value")

{- | __C declaration:__ @JanetString@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 624:24@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
newtype JanetString = JanetString
    { unwrapJanetString ::
        HsBindgen.Runtime.PtrConst.PtrConst HsBindgen.Runtime.LibC.Word8
    }
    deriving stock (GHC.Generics.Generic)
    deriving stock (Eq, Ord, Show)
    deriving newtype
        ( F.Storable
        , HsBindgen.Runtime.Internal.HasFFIType.HasFFIType
        , HsBindgen.Runtime.Marshal.ReadRaw
        , HsBindgen.Runtime.Marshal.StaticSize
        , HsBindgen.Runtime.Marshal.WriteRaw
        )

instance
    ( TyEq
        ty
        ((HsBindgen.Runtime.HasCField.CFieldType JanetString) "unwrapJanetString")
    ) =>
    GHC.Records.HasField "unwrapJanetString" (Ptr.Ptr JanetString) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"unwrapJanetString")

instance HsBindgen.Runtime.HasCField.HasCField JanetString "unwrapJanetString" where
    type
        CFieldType JanetString "unwrapJanetString" =
            HsBindgen.Runtime.PtrConst.PtrConst HsBindgen.Runtime.LibC.Word8

    offset# = \_ -> \_ -> 0

{- | Auxiliary type used by 'JanetCFunction'

__C declaration:__ @JanetCFunction@

__defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 621:16@

__exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
newtype JanetCFunction_Aux = JanetCFunction_Aux
    { unwrapJanetCFunction_Aux ::
        HsBindgen.Runtime.LibC.Int32 -> (Ptr.Ptr Janet) -> IO Janet
    }
    deriving stock (GHC.Generics.Generic)

instance
    ( TyEq
        ty
        ( (HsBindgen.Runtime.HasCField.CFieldType JanetCFunction_Aux)
            "unwrapJanetCFunction_Aux"
        )
    ) =>
    GHC.Records.HasField
        "unwrapJanetCFunction_Aux"
        (Ptr.Ptr JanetCFunction_Aux)
        (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr
            (Data.Proxy.Proxy @"unwrapJanetCFunction_Aux")

instance
    HsBindgen.Runtime.HasCField.HasCField
        JanetCFunction_Aux
        "unwrapJanetCFunction_Aux"
    where
    type
        CFieldType JanetCFunction_Aux "unwrapJanetCFunction_Aux" =
            HsBindgen.Runtime.LibC.Int32 -> (Ptr.Ptr Janet) -> IO Janet

    offset# = \_ -> \_ -> 0

{- | __C declaration:__ @JanetCFunction@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 621:16@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
newtype JanetCFunction = JanetCFunction
    { unwrapJanetCFunction :: Ptr.FunPtr JanetCFunction_Aux
    }
    deriving stock (GHC.Generics.Generic)
    deriving stock (Eq, Ord, Show)
    deriving newtype
        ( F.Storable
        , HsBindgen.Runtime.Internal.HasFFIType.HasFFIType
        , HsBindgen.Runtime.Marshal.ReadRaw
        , HsBindgen.Runtime.Marshal.StaticSize
        , HsBindgen.Runtime.Marshal.WriteRaw
        )

instance
    ( TyEq
        ty
        ((HsBindgen.Runtime.HasCField.CFieldType JanetCFunction) "unwrapJanetCFunction")
    ) =>
    GHC.Records.HasField
        "unwrapJanetCFunction"
        (Ptr.Ptr JanetCFunction)
        (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"unwrapJanetCFunction")

instance HsBindgen.Runtime.HasCField.HasCField JanetCFunction "unwrapJanetCFunction" where
    type
        CFieldType JanetCFunction "unwrapJanetCFunction" =
            Ptr.FunPtr JanetCFunction_Aux

    offset# = \_ -> \_ -> 0

{- | __C declaration:__ @JanetSymbol@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 625:24@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
newtype JanetSymbol = JanetSymbol
    { unwrapJanetSymbol ::
        HsBindgen.Runtime.PtrConst.PtrConst HsBindgen.Runtime.LibC.Word8
    }
    deriving stock (GHC.Generics.Generic)
    deriving stock (Eq, Ord, Show)
    deriving newtype
        ( F.Storable
        , HsBindgen.Runtime.Internal.HasFFIType.HasFFIType
        , HsBindgen.Runtime.Marshal.ReadRaw
        , HsBindgen.Runtime.Marshal.StaticSize
        , HsBindgen.Runtime.Marshal.WriteRaw
        )

instance
    ( TyEq
        ty
        ((HsBindgen.Runtime.HasCField.CFieldType JanetSymbol) "unwrapJanetSymbol")
    ) =>
    GHC.Records.HasField "unwrapJanetSymbol" (Ptr.Ptr JanetSymbol) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"unwrapJanetSymbol")

instance HsBindgen.Runtime.HasCField.HasCField JanetSymbol "unwrapJanetSymbol" where
    type
        CFieldType JanetSymbol "unwrapJanetSymbol" =
            HsBindgen.Runtime.PtrConst.PtrConst HsBindgen.Runtime.LibC.Word8

    offset# = \_ -> \_ -> 0

{- | __C declaration:__ @JanetKeyword@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 626:24@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
newtype JanetKeyword = JanetKeyword
    { unwrapJanetKeyword ::
        HsBindgen.Runtime.PtrConst.PtrConst HsBindgen.Runtime.LibC.Word8
    }
    deriving stock (GHC.Generics.Generic)
    deriving stock (Eq, Ord, Show)
    deriving newtype
        ( F.Storable
        , HsBindgen.Runtime.Internal.HasFFIType.HasFFIType
        , HsBindgen.Runtime.Marshal.ReadRaw
        , HsBindgen.Runtime.Marshal.StaticSize
        , HsBindgen.Runtime.Marshal.WriteRaw
        )

instance
    ( TyEq
        ty
        ((HsBindgen.Runtime.HasCField.CFieldType JanetKeyword) "unwrapJanetKeyword")
    ) =>
    GHC.Records.HasField "unwrapJanetKeyword" (Ptr.Ptr JanetKeyword) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"unwrapJanetKeyword")

instance HsBindgen.Runtime.HasCField.HasCField JanetKeyword "unwrapJanetKeyword" where
    type
        CFieldType JanetKeyword "unwrapJanetKeyword" =
            HsBindgen.Runtime.PtrConst.PtrConst HsBindgen.Runtime.LibC.Word8

    offset# = \_ -> \_ -> 0

{- | __C declaration:__ @JanetTuple@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 627:22@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
newtype JanetTuple = JanetTuple
    { unwrapJanetTuple :: HsBindgen.Runtime.PtrConst.PtrConst Janet
    }
    deriving stock (GHC.Generics.Generic)
    deriving stock (Eq, Ord, Show)
    deriving newtype
        ( F.Storable
        , HsBindgen.Runtime.Internal.HasFFIType.HasFFIType
        , HsBindgen.Runtime.Marshal.ReadRaw
        , HsBindgen.Runtime.Marshal.StaticSize
        , HsBindgen.Runtime.Marshal.WriteRaw
        )

instance
    (TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType JanetTuple) "unwrapJanetTuple")) =>
    GHC.Records.HasField "unwrapJanetTuple" (Ptr.Ptr JanetTuple) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"unwrapJanetTuple")

instance HsBindgen.Runtime.HasCField.HasCField JanetTuple "unwrapJanetTuple" where
    type
        CFieldType JanetTuple "unwrapJanetTuple" =
            HsBindgen.Runtime.PtrConst.PtrConst Janet

    offset# = \_ -> \_ -> 0

{- | __C declaration:__ @JanetStruct@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 628:24@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
newtype JanetStruct = JanetStruct
    { unwrapJanetStruct :: HsBindgen.Runtime.PtrConst.PtrConst JanetKV
    }
    deriving stock (GHC.Generics.Generic)
    deriving stock (Eq, Ord, Show)
    deriving newtype
        ( F.Storable
        , HsBindgen.Runtime.Internal.HasFFIType.HasFFIType
        , HsBindgen.Runtime.Marshal.ReadRaw
        , HsBindgen.Runtime.Marshal.StaticSize
        , HsBindgen.Runtime.Marshal.WriteRaw
        )

instance
    ( TyEq
        ty
        ((HsBindgen.Runtime.HasCField.CFieldType JanetStruct) "unwrapJanetStruct")
    ) =>
    GHC.Records.HasField "unwrapJanetStruct" (Ptr.Ptr JanetStruct) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"unwrapJanetStruct")

instance HsBindgen.Runtime.HasCField.HasCField JanetStruct "unwrapJanetStruct" where
    type
        CFieldType JanetStruct "unwrapJanetStruct" =
            HsBindgen.Runtime.PtrConst.PtrConst JanetKV

    offset# = \_ -> \_ -> 0

{- | __C declaration:__ @JanetAbstract@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 629:15@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
newtype JanetAbstract = JanetAbstract
    { unwrapJanetAbstract :: Ptr.Ptr Void
    }
    deriving stock (GHC.Generics.Generic)
    deriving stock (Eq, Ord, Show)
    deriving newtype
        ( F.Storable
        , HsBindgen.Runtime.Internal.HasFFIType.HasFFIType
        , HsBindgen.Runtime.Marshal.ReadRaw
        , HsBindgen.Runtime.Marshal.StaticSize
        , HsBindgen.Runtime.Marshal.WriteRaw
        )

instance
    ( TyEq
        ty
        ((HsBindgen.Runtime.HasCField.CFieldType JanetAbstract) "unwrapJanetAbstract")
    ) =>
    GHC.Records.HasField "unwrapJanetAbstract" (Ptr.Ptr JanetAbstract) (Ptr.Ptr ty)
    where
    getField =
        HsBindgen.Runtime.HasCField.fromPtr (Data.Proxy.Proxy @"unwrapJanetAbstract")

instance HsBindgen.Runtime.HasCField.HasCField JanetAbstract "unwrapJanetAbstract" where
    type
        CFieldType JanetAbstract "unwrapJanetAbstract" =
            Ptr.Ptr Void

    offset# = \_ -> \_ -> 0

{- | __C declaration:__ @JANET_STREAM_CLOSED@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 661:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_STREAM_CLOSED :: FC.CInt
jANET_STREAM_CLOSED = (1 :: FC.CInt)

{- | __C declaration:__ @JANET_STREAM_SOCKET@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 662:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_STREAM_SOCKET :: FC.CInt
jANET_STREAM_SOCKET = (2 :: FC.CInt)

{- | __C declaration:__ @JANET_STREAM_UNREGISTERED@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 663:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_STREAM_UNREGISTERED :: FC.CInt
jANET_STREAM_UNREGISTERED = (4 :: FC.CInt)

{- | __C declaration:__ @JANET_STREAM_READABLE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 664:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_STREAM_READABLE :: FC.CInt
jANET_STREAM_READABLE = (512 :: FC.CInt)

{- | __C declaration:__ @JANET_STREAM_WRITABLE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 665:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_STREAM_WRITABLE :: FC.CInt
jANET_STREAM_WRITABLE = (1024 :: FC.CInt)

{- | __C declaration:__ @JANET_STREAM_ACCEPTABLE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 666:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_STREAM_ACCEPTABLE :: FC.CInt
jANET_STREAM_ACCEPTABLE = (2048 :: FC.CInt)

{- | __C declaration:__ @JANET_STREAM_UDPSERVER@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 667:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_STREAM_UDPSERVER :: FC.CInt
jANET_STREAM_UDPSERVER = (4096 :: FC.CInt)

{- | __C declaration:__ @JANET_STREAM_NOT_CLOSEABLE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 668:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_STREAM_NOT_CLOSEABLE :: FC.CInt
jANET_STREAM_NOT_CLOSEABLE = (8192 :: FC.CInt)

{- | __C declaration:__ @JANET_STREAM_TOCLOSE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 669:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_STREAM_TOCLOSE :: FC.CInt
jANET_STREAM_TOCLOSE = (65536 :: FC.CInt)

{- | __C declaration:__ @JANET_STACKFRAME_TAILCALL@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1042:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_STACKFRAME_TAILCALL :: FC.CInt
jANET_STACKFRAME_TAILCALL = (1 :: FC.CInt)

{- | __C declaration:__ @JANET_STACKFRAME_ENTRANCE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1045:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_STACKFRAME_ENTRANCE :: FC.CInt
jANET_STACKFRAME_ENTRANCE = (2 :: FC.CInt)

{- | __C declaration:__ @JANET_FRAME_SIZE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1058:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FRAME_SIZE :: FC.CInt
jANET_FRAME_SIZE = (4 :: FC.CInt)

{- | __C declaration:__ @JANET_FUNCDEF_FLAG_VARARG@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1129:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FUNCDEF_FLAG_VARARG :: FC.CInt
jANET_FUNCDEF_FLAG_VARARG = (65536 :: FC.CInt)

{- | __C declaration:__ @JANET_FUNCDEF_FLAG_NEEDSENV@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1130:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FUNCDEF_FLAG_NEEDSENV :: FC.CInt
jANET_FUNCDEF_FLAG_NEEDSENV = (131072 :: FC.CInt)

{- | __C declaration:__ @JANET_FUNCDEF_FLAG_HASSYMBOLMAP@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1131:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FUNCDEF_FLAG_HASSYMBOLMAP :: FC.CInt
jANET_FUNCDEF_FLAG_HASSYMBOLMAP = (262144 :: FC.CInt)

{- | __C declaration:__ @JANET_FUNCDEF_FLAG_HASNAME@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1132:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FUNCDEF_FLAG_HASNAME :: FC.CInt
jANET_FUNCDEF_FLAG_HASNAME = (524288 :: FC.CInt)

{- | __C declaration:__ @JANET_FUNCDEF_FLAG_HASSOURCE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1133:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FUNCDEF_FLAG_HASSOURCE :: FC.CInt
jANET_FUNCDEF_FLAG_HASSOURCE = (1048576 :: FC.CInt)

{- | __C declaration:__ @JANET_FUNCDEF_FLAG_HASDEFS@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1134:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FUNCDEF_FLAG_HASDEFS :: FC.CInt
jANET_FUNCDEF_FLAG_HASDEFS = (2097152 :: FC.CInt)

{- | __C declaration:__ @JANET_FUNCDEF_FLAG_HASENVS@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1135:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FUNCDEF_FLAG_HASENVS :: FC.CInt
jANET_FUNCDEF_FLAG_HASENVS = (4194304 :: FC.CInt)

{- | __C declaration:__ @JANET_FUNCDEF_FLAG_HASSOURCEMAP@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1136:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FUNCDEF_FLAG_HASSOURCEMAP :: FC.CInt
jANET_FUNCDEF_FLAG_HASSOURCEMAP =
    (8388608 :: FC.CInt)

{- | __C declaration:__ @JANET_FUNCDEF_FLAG_STRUCTARG@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1137:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FUNCDEF_FLAG_STRUCTARG :: FC.CInt
jANET_FUNCDEF_FLAG_STRUCTARG = (16777216 :: FC.CInt)

{- | __C declaration:__ @JANET_FUNCDEF_FLAG_HASCLOBITSET@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1138:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FUNCDEF_FLAG_HASCLOBITSET :: FC.CInt
jANET_FUNCDEF_FLAG_HASCLOBITSET =
    (33554432 :: FC.CInt)

{- | __C declaration:__ @JANET_FUNCDEF_FLAG_TAG@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1139:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FUNCDEF_FLAG_TAG :: FC.CInt
jANET_FUNCDEF_FLAG_TAG = (65535 :: FC.CInt)

{- | __C declaration:__ @JANET_FUNCFLAG_TRACE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1194:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FUNCFLAG_TRACE :: FC.CInt
jANET_FUNCFLAG_TRACE =
    (C.<<) (1 :: FC.CInt) (16 :: FC.CInt)

{- | __C declaration:__ @JANET_EV_TCTAG_NIL@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1579:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_EV_TCTAG_NIL :: FC.CInt
jANET_EV_TCTAG_NIL = (0 :: FC.CInt)

{- | __C declaration:__ @JANET_EV_TCTAG_INTEGER@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1580:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_EV_TCTAG_INTEGER :: FC.CInt
jANET_EV_TCTAG_INTEGER = (1 :: FC.CInt)

{- | __C declaration:__ @JANET_EV_TCTAG_STRING@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1581:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_EV_TCTAG_STRING :: FC.CInt
jANET_EV_TCTAG_STRING = (2 :: FC.CInt)

{- | __C declaration:__ @JANET_EV_TCTAG_STRINGF@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1582:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_EV_TCTAG_STRINGF :: FC.CInt
jANET_EV_TCTAG_STRINGF = (3 :: FC.CInt)

{- | __C declaration:__ @JANET_EV_TCTAG_KEYWORD@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1583:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_EV_TCTAG_KEYWORD :: FC.CInt
jANET_EV_TCTAG_KEYWORD = (4 :: FC.CInt)

{- | __C declaration:__ @JANET_EV_TCTAG_ERR_STRING@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1584:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_EV_TCTAG_ERR_STRING :: FC.CInt
jANET_EV_TCTAG_ERR_STRING = (5 :: FC.CInt)

{- | __C declaration:__ @JANET_EV_TCTAG_ERR_STRINGF@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1585:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_EV_TCTAG_ERR_STRINGF :: FC.CInt
jANET_EV_TCTAG_ERR_STRINGF = (6 :: FC.CInt)

{- | __C declaration:__ @JANET_EV_TCTAG_ERR_KEYWORD@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1586:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_EV_TCTAG_ERR_KEYWORD :: FC.CInt
jANET_EV_TCTAG_ERR_KEYWORD = (7 :: FC.CInt)

{- | __C declaration:__ @JANET_EV_TCTAG_BOOLEAN@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1587:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_EV_TCTAG_BOOLEAN :: FC.CInt
jANET_EV_TCTAG_BOOLEAN = (8 :: FC.CInt)

{- | __C declaration:__ @JANET_BUFFER_FLAG_NO_REALLOC@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1726:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_BUFFER_FLAG_NO_REALLOC :: FC.CInt
jANET_BUFFER_FLAG_NO_REALLOC = (65536 :: FC.CInt)

{- | __C declaration:__ @JANET_TUPLE_FLAG_BRACKETCTOR@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1744:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_TUPLE_FLAG_BRACKETCTOR :: FC.CInt
jANET_TUPLE_FLAG_BRACKETCTOR = (65536 :: FC.CInt)

{- | __C declaration:__ @JANET_MARSHAL_UNSAFE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1857:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_MARSHAL_UNSAFE :: FC.CInt
jANET_MARSHAL_UNSAFE = (131072 :: FC.CInt)

{- | __C declaration:__ @JANET_MARSHAL_NO_CYCLES@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1858:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_MARSHAL_NO_CYCLES :: FC.CInt
jANET_MARSHAL_NO_CYCLES = (262144 :: FC.CInt)

{- | __C declaration:__ @JANET_PRETTY_COLOR@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1893:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_PRETTY_COLOR :: FC.CInt
jANET_PRETTY_COLOR = (1 :: FC.CInt)

{- | __C declaration:__ @JANET_PRETTY_ONELINE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1894:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_PRETTY_ONELINE :: FC.CInt
jANET_PRETTY_ONELINE = (2 :: FC.CInt)

{- | __C declaration:__ @JANET_PRETTY_NOTRUNC@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1895:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_PRETTY_NOTRUNC :: FC.CInt
jANET_PRETTY_NOTRUNC = (4 :: FC.CInt)

{- | __C declaration:__ @JANET_SANDBOX_SANDBOX@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1949:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SANDBOX_SANDBOX :: FC.CInt
jANET_SANDBOX_SANDBOX = (1 :: FC.CInt)

{- | __C declaration:__ @JANET_SANDBOX_SUBPROCESS@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1950:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SANDBOX_SUBPROCESS :: FC.CInt
jANET_SANDBOX_SUBPROCESS = (2 :: FC.CInt)

{- | __C declaration:__ @JANET_SANDBOX_NET_CONNECT@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1951:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SANDBOX_NET_CONNECT :: FC.CInt
jANET_SANDBOX_NET_CONNECT = (4 :: FC.CInt)

{- | __C declaration:__ @JANET_SANDBOX_NET_LISTEN@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1952:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SANDBOX_NET_LISTEN :: FC.CInt
jANET_SANDBOX_NET_LISTEN = (8 :: FC.CInt)

{- | __C declaration:__ @JANET_SANDBOX_FFI_DEFINE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1953:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SANDBOX_FFI_DEFINE :: FC.CInt
jANET_SANDBOX_FFI_DEFINE = (16 :: FC.CInt)

{- | __C declaration:__ @JANET_SANDBOX_FS_WRITE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1954:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SANDBOX_FS_WRITE :: FC.CInt
jANET_SANDBOX_FS_WRITE = (32 :: FC.CInt)

{- | __C declaration:__ @JANET_SANDBOX_FS_READ@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1955:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SANDBOX_FS_READ :: FC.CInt
jANET_SANDBOX_FS_READ = (64 :: FC.CInt)

{- | __C declaration:__ @JANET_SANDBOX_HRTIME@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1956:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SANDBOX_HRTIME :: FC.CInt
jANET_SANDBOX_HRTIME = (128 :: FC.CInt)

{- | __C declaration:__ @JANET_SANDBOX_ENV@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1957:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SANDBOX_ENV :: FC.CInt
jANET_SANDBOX_ENV = (256 :: FC.CInt)

{- | __C declaration:__ @JANET_SANDBOX_DYNAMIC_MODULES@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1958:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SANDBOX_DYNAMIC_MODULES :: FC.CInt
jANET_SANDBOX_DYNAMIC_MODULES = (512 :: FC.CInt)

{- | __C declaration:__ @JANET_SANDBOX_FS_TEMP@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1959:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SANDBOX_FS_TEMP :: FC.CInt
jANET_SANDBOX_FS_TEMP = (1024 :: FC.CInt)

{- | __C declaration:__ @JANET_SANDBOX_FFI_USE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1960:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SANDBOX_FFI_USE :: FC.CInt
jANET_SANDBOX_FFI_USE = (2048 :: FC.CInt)

{- | __C declaration:__ @JANET_SANDBOX_FFI_JIT@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1961:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SANDBOX_FFI_JIT :: FC.CInt
jANET_SANDBOX_FFI_JIT = (4096 :: FC.CInt)

{- | __C declaration:__ @JANET_SANDBOX_SIGNAL@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1962:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SANDBOX_SIGNAL :: FC.CInt
jANET_SANDBOX_SIGNAL = (8192 :: FC.CInt)

{- | __C declaration:__ @JANET_SANDBOX_FFI@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1963:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SANDBOX_FFI :: FC.CInt
jANET_SANDBOX_FFI =
    (C..|.)
        ((C..|.) jANET_SANDBOX_FFI_DEFINE jANET_SANDBOX_FFI_USE)
        jANET_SANDBOX_FFI_JIT

{- | __C declaration:__ @JANET_SANDBOX_FS@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1964:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SANDBOX_FS :: FC.CInt
jANET_SANDBOX_FS =
    (C..|.)
        ((C..|.) jANET_SANDBOX_FS_WRITE jANET_SANDBOX_FS_READ)
        jANET_SANDBOX_FS_TEMP

{- | __C declaration:__ @JANET_SANDBOX_NET@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1965:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_SANDBOX_NET :: FC.CInt
jANET_SANDBOX_NET =
    (C..|.) jANET_SANDBOX_NET_CONNECT jANET_SANDBOX_NET_LISTEN

{- | __C declaration:__ @JANET_FILE_WRITE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 2176:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FILE_WRITE :: FC.CInt
jANET_FILE_WRITE = (1 :: FC.CInt)

{- | __C declaration:__ @JANET_FILE_READ@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 2177:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FILE_READ :: FC.CInt
jANET_FILE_READ = (2 :: FC.CInt)

{- | __C declaration:__ @JANET_FILE_APPEND@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 2178:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FILE_APPEND :: FC.CInt
jANET_FILE_APPEND = (4 :: FC.CInt)

{- | __C declaration:__ @JANET_FILE_UPDATE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 2179:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FILE_UPDATE :: FC.CInt
jANET_FILE_UPDATE = (8 :: FC.CInt)

{- | __C declaration:__ @JANET_FILE_NOT_CLOSEABLE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 2180:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FILE_NOT_CLOSEABLE :: FC.CInt
jANET_FILE_NOT_CLOSEABLE = (16 :: FC.CInt)

{- | __C declaration:__ @JANET_FILE_CLOSED@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 2181:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FILE_CLOSED :: FC.CInt
jANET_FILE_CLOSED = (32 :: FC.CInt)

{- | __C declaration:__ @JANET_FILE_BINARY@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 2182:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FILE_BINARY :: FC.CInt
jANET_FILE_BINARY = (64 :: FC.CInt)

{- | __C declaration:__ @JANET_FILE_SERIALIZABLE@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 2183:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FILE_SERIALIZABLE :: FC.CInt
jANET_FILE_SERIALIZABLE = (128 :: FC.CInt)

{- | __C declaration:__ @JANET_FILE_NONIL@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 2184:9@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
jANET_FILE_NONIL :: FC.CInt
jANET_FILE_NONIL = (512 :: FC.CInt)
