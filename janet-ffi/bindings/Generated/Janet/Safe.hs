{-# LANGUAGE CApiFFI #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module Generated.Janet.Safe where

import Data.Void (Void)
import Foreign.C qualified as FC
import GHC.Int qualified
import GHC.Ptr qualified as Ptr
import Generated.Janet
import HsBindgen.Runtime.Internal.CAPI qualified
import HsBindgen.Runtime.Internal.HasFFIType qualified
import HsBindgen.Runtime.PtrConst qualified
import Prelude (Double, IO)

$( HsBindgen.Runtime.Internal.CAPI.addCSource
    ( HsBindgen.Runtime.Internal.CAPI.unlines
        [ "#include </Users/cbarlow/dev/janet-hs/include/janet.h>"
        , "void hs_bindgen_c98a26414cefc508 ("
        , "  double arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_number(arg1);"
        , "}"
        , "void hs_bindgen_6e39e487dc34bb13 ("
        , "  signed int arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_boolean(arg1);"
        , "}"
        , "void hs_bindgen_12276a909bb84596 ("
        , "  JanetString arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_string(arg1);"
        , "}"
        , "void hs_bindgen_72037dba3cedb282 ("
        , "  JanetSymbol arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_symbol(arg1);"
        , "}"
        , "void hs_bindgen_2c002f933f1ae386 ("
        , "  JanetKeyword arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_keyword(arg1);"
        , "}"
        , "void hs_bindgen_c881c05bfd59d895 ("
        , "  JanetArray *arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_array(arg1);"
        , "}"
        , "void hs_bindgen_e588f50a3e0e06fa ("
        , "  JanetTuple arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_tuple(arg1);"
        , "}"
        , "void hs_bindgen_8ef12d20018dfe51 ("
        , "  JanetStruct arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_struct(arg1);"
        , "}"
        , "void hs_bindgen_818283a3ac3771b2 ("
        , "  JanetCFunction arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_cfunction(arg1);"
        , "}"
        , "void hs_bindgen_bbd6b23279c7febb ("
        , "  JanetAbstract arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_abstract(arg1);"
        , "}"
        , "void hs_bindgen_580a81fbeaebfb55 ("
        , "  void *arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_pointer(arg1);"
        , "}"
        , "JanetTable *hs_bindgen_780c12c6f9f452d4 ("
        , "  JanetTable *arg1"
        , ")"
        , "{"
        , "  return janet_core_env(arg1);"
        , "}"
        , "signed int hs_bindgen_9ee51bbb3e5c02e8 ("
        , "  JanetTable *arg1,"
        , "  char const *arg2,"
        , "  char const *arg3,"
        , "  Janet *arg4"
        , ")"
        , "{"
        , "  return janet_dostring(arg1, arg2, arg3, arg4);"
        , "}"
        , "void hs_bindgen_8ebf0f4bcdac1d66 ("
        , "  double arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_number_safe(arg1);"
        , "}"
        , "signed int hs_bindgen_091667e14590aaf8 (void)"
        , "{"
        , "  return janet_init();"
        , "}"
        , "void hs_bindgen_605bef7d32f3dfa4 (void)"
        , "{"
        , "  janet_deinit();"
        , "}"
        ]
    )
 )

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_number@
foreign import ccall safe "hs_bindgen_c98a26414cefc508"
    hs_bindgen_c98a26414cefc508_base ::
        Double ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_number@
hs_bindgen_c98a26414cefc508 ::
    FC.CDouble ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_c98a26414cefc508 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_c98a26414cefc508_base

{- | __C declaration:__ @janet_wrap_number@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 799:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_number ::
    -- | __C declaration:__ @x@
    FC.CDouble ->
    IO Janet
janet_wrap_number =
    \x0 ->
        HsBindgen.Runtime.Internal.CAPI.allocaAndPeek
            ( \res1 ->
                hs_bindgen_c98a26414cefc508 x0 res1
            )

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_boolean@
foreign import ccall safe "hs_bindgen_6e39e487dc34bb13"
    hs_bindgen_6e39e487dc34bb13_base ::
        GHC.Int.Int32 ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_boolean@
hs_bindgen_6e39e487dc34bb13 ::
    FC.CInt ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_6e39e487dc34bb13 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_6e39e487dc34bb13_base

{- | __C declaration:__ @janet_wrap_boolean@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 802:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_boolean ::
    -- | __C declaration:__ @x@
    FC.CInt ->
    IO Janet
janet_wrap_boolean =
    \x0 ->
        HsBindgen.Runtime.Internal.CAPI.allocaAndPeek
            ( \res1 ->
                hs_bindgen_6e39e487dc34bb13 x0 res1
            )

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_string@
foreign import ccall safe "hs_bindgen_12276a909bb84596"
    hs_bindgen_12276a909bb84596_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_string@
hs_bindgen_12276a909bb84596 ::
    JanetString ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_12276a909bb84596 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_12276a909bb84596_base

{- | __C declaration:__ @janet_wrap_string@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 803:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_string ::
    -- | __C declaration:__ @x@
    JanetString ->
    IO Janet
janet_wrap_string =
    \x0 ->
        HsBindgen.Runtime.Internal.CAPI.allocaAndPeek
            ( \res1 ->
                hs_bindgen_12276a909bb84596 x0 res1
            )

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_symbol@
foreign import ccall safe "hs_bindgen_72037dba3cedb282"
    hs_bindgen_72037dba3cedb282_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_symbol@
hs_bindgen_72037dba3cedb282 ::
    JanetSymbol ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_72037dba3cedb282 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_72037dba3cedb282_base

{- | __C declaration:__ @janet_wrap_symbol@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 804:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_symbol ::
    -- | __C declaration:__ @x@
    JanetSymbol ->
    IO Janet
janet_wrap_symbol =
    \x0 ->
        HsBindgen.Runtime.Internal.CAPI.allocaAndPeek
            ( \res1 ->
                hs_bindgen_72037dba3cedb282 x0 res1
            )

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_keyword@
foreign import ccall safe "hs_bindgen_2c002f933f1ae386"
    hs_bindgen_2c002f933f1ae386_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_keyword@
hs_bindgen_2c002f933f1ae386 ::
    JanetKeyword ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_2c002f933f1ae386 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_2c002f933f1ae386_base

{- | __C declaration:__ @janet_wrap_keyword@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 805:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_keyword ::
    -- | __C declaration:__ @x@
    JanetKeyword ->
    IO Janet
janet_wrap_keyword =
    \x0 ->
        HsBindgen.Runtime.Internal.CAPI.allocaAndPeek
            ( \res1 ->
                hs_bindgen_2c002f933f1ae386 x0 res1
            )

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_array@
foreign import ccall safe "hs_bindgen_c881c05bfd59d895"
    hs_bindgen_c881c05bfd59d895_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_array@
hs_bindgen_c881c05bfd59d895 ::
    Ptr.Ptr JanetArray ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_c881c05bfd59d895 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_c881c05bfd59d895_base

{- | __C declaration:__ @janet_wrap_array@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 806:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_array ::
    -- | __C declaration:__ @x@
    Ptr.Ptr JanetArray ->
    IO Janet
janet_wrap_array =
    \x0 ->
        HsBindgen.Runtime.Internal.CAPI.allocaAndPeek
            ( \res1 ->
                hs_bindgen_c881c05bfd59d895 x0 res1
            )

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_tuple@
foreign import ccall safe "hs_bindgen_e588f50a3e0e06fa"
    hs_bindgen_e588f50a3e0e06fa_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_tuple@
hs_bindgen_e588f50a3e0e06fa ::
    JanetTuple ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_e588f50a3e0e06fa =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_e588f50a3e0e06fa_base

{- | __C declaration:__ @janet_wrap_tuple@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 807:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_tuple ::
    -- | __C declaration:__ @x@
    JanetTuple ->
    IO Janet
janet_wrap_tuple =
    \x0 ->
        HsBindgen.Runtime.Internal.CAPI.allocaAndPeek
            ( \res1 ->
                hs_bindgen_e588f50a3e0e06fa x0 res1
            )

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_struct@
foreign import ccall safe "hs_bindgen_8ef12d20018dfe51"
    hs_bindgen_8ef12d20018dfe51_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_struct@
hs_bindgen_8ef12d20018dfe51 ::
    JanetStruct ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_8ef12d20018dfe51 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_8ef12d20018dfe51_base

{- | __C declaration:__ @janet_wrap_struct@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 808:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_struct ::
    -- | __C declaration:__ @x@
    JanetStruct ->
    IO Janet
janet_wrap_struct =
    \x0 ->
        HsBindgen.Runtime.Internal.CAPI.allocaAndPeek
            ( \res1 ->
                hs_bindgen_8ef12d20018dfe51 x0 res1
            )

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_cfunction@
foreign import ccall safe "hs_bindgen_818283a3ac3771b2"
    hs_bindgen_818283a3ac3771b2_base ::
        Ptr.FunPtr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_cfunction@
hs_bindgen_818283a3ac3771b2 ::
    JanetCFunction ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_818283a3ac3771b2 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_818283a3ac3771b2_base

{- | __C declaration:__ @janet_wrap_cfunction@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 812:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_cfunction ::
    -- | __C declaration:__ @x@
    JanetCFunction ->
    IO Janet
janet_wrap_cfunction =
    \x0 ->
        HsBindgen.Runtime.Internal.CAPI.allocaAndPeek
            ( \res1 ->
                hs_bindgen_818283a3ac3771b2 x0 res1
            )

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_abstract@
foreign import ccall safe "hs_bindgen_bbd6b23279c7febb"
    hs_bindgen_bbd6b23279c7febb_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_abstract@
hs_bindgen_bbd6b23279c7febb ::
    JanetAbstract ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_bbd6b23279c7febb =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_bbd6b23279c7febb_base

{- | __C declaration:__ @janet_wrap_abstract@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 814:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_abstract ::
    -- | __C declaration:__ @x@
    JanetAbstract ->
    IO Janet
janet_wrap_abstract =
    \x0 ->
        HsBindgen.Runtime.Internal.CAPI.allocaAndPeek
            ( \res1 ->
                hs_bindgen_bbd6b23279c7febb x0 res1
            )

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_pointer@
foreign import ccall safe "hs_bindgen_580a81fbeaebfb55"
    hs_bindgen_580a81fbeaebfb55_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_pointer@
hs_bindgen_580a81fbeaebfb55 ::
    Ptr.Ptr Void ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_580a81fbeaebfb55 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_580a81fbeaebfb55_base

{- | __C declaration:__ @janet_wrap_pointer@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 815:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_pointer ::
    -- | __C declaration:__ @x@
    Ptr.Ptr Void ->
    IO Janet
janet_wrap_pointer =
    \x0 ->
        HsBindgen.Runtime.Internal.CAPI.allocaAndPeek
            ( \res1 ->
                hs_bindgen_580a81fbeaebfb55 x0 res1
            )

-- __unique:__ @_Generated.Janet_Safe_janet_core_env@
foreign import ccall safe "hs_bindgen_780c12c6f9f452d4"
    hs_bindgen_780c12c6f9f452d4_base ::
        Ptr.Ptr Void ->
        IO (Ptr.Ptr Void)

-- __unique:__ @_Generated.Janet_Safe_janet_core_env@
hs_bindgen_780c12c6f9f452d4 ::
    Ptr.Ptr JanetTable ->
    IO (Ptr.Ptr JanetTable)
hs_bindgen_780c12c6f9f452d4 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_780c12c6f9f452d4_base

{- | __C declaration:__ @janet_core_env@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1681:23@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_core_env ::
    -- | __C declaration:__ @replacements@
    Ptr.Ptr JanetTable ->
    IO (Ptr.Ptr JanetTable)
janet_core_env = hs_bindgen_780c12c6f9f452d4

-- __unique:__ @_Generated.Janet_Safe_janet_dostring@
foreign import ccall safe "hs_bindgen_9ee51bbb3e5c02e8"
    hs_bindgen_9ee51bbb3e5c02e8_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO GHC.Int.Int32

-- __unique:__ @_Generated.Janet_Safe_janet_dostring@
hs_bindgen_9ee51bbb3e5c02e8 ::
    Ptr.Ptr JanetTable ->
    HsBindgen.Runtime.PtrConst.PtrConst FC.CChar ->
    HsBindgen.Runtime.PtrConst.PtrConst FC.CChar ->
    Ptr.Ptr Janet ->
    IO FC.CInt
hs_bindgen_9ee51bbb3e5c02e8 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_9ee51bbb3e5c02e8_base

{- | __C declaration:__ @janet_dostring@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1686:15@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_dostring ::
    -- | __C declaration:__ @env@
    Ptr.Ptr JanetTable ->
    -- | __C declaration:__ @str@
    HsBindgen.Runtime.PtrConst.PtrConst FC.CChar ->
    -- | __C declaration:__ @sourcePath@
    HsBindgen.Runtime.PtrConst.PtrConst FC.CChar ->
    -- | __C declaration:__ @out@
    Ptr.Ptr Janet ->
    IO FC.CInt
janet_dostring = hs_bindgen_9ee51bbb3e5c02e8

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_number_safe@
foreign import ccall safe "hs_bindgen_8ebf0f4bcdac1d66"
    hs_bindgen_8ebf0f4bcdac1d66_base ::
        Double ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Safe_janet_wrap_number_safe@
hs_bindgen_8ebf0f4bcdac1d66 ::
    FC.CDouble ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_8ebf0f4bcdac1d66 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_8ebf0f4bcdac1d66_base

{- | __C declaration:__ @janet_wrap_number_safe@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1923:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_number_safe ::
    -- | __C declaration:__ @x@
    FC.CDouble ->
    IO Janet
janet_wrap_number_safe =
    \x0 ->
        HsBindgen.Runtime.Internal.CAPI.allocaAndPeek
            ( \res1 ->
                hs_bindgen_8ebf0f4bcdac1d66 x0 res1
            )

-- __unique:__ @_Generated.Janet_Safe_janet_init@
foreign import ccall safe "hs_bindgen_091667e14590aaf8"
    hs_bindgen_091667e14590aaf8_base ::
        IO GHC.Int.Int32

-- __unique:__ @_Generated.Janet_Safe_janet_init@
hs_bindgen_091667e14590aaf8 :: IO FC.CInt
hs_bindgen_091667e14590aaf8 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_091667e14590aaf8_base

{- | __C declaration:__ @janet_init@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1930:15@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_init :: IO FC.CInt
janet_init = hs_bindgen_091667e14590aaf8

-- __unique:__ @_Generated.Janet_Safe_janet_deinit@
foreign import ccall safe "hs_bindgen_605bef7d32f3dfa4"
    hs_bindgen_605bef7d32f3dfa4_base ::
        IO ()

-- __unique:__ @_Generated.Janet_Safe_janet_deinit@
hs_bindgen_605bef7d32f3dfa4 :: IO ()
hs_bindgen_605bef7d32f3dfa4 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_605bef7d32f3dfa4_base

{- | __C declaration:__ @janet_deinit@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1931:16@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_deinit :: IO ()
janet_deinit = hs_bindgen_605bef7d32f3dfa4
