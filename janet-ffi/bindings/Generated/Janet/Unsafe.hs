{-# LANGUAGE CApiFFI #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_HADDOCK prune #-}

module Generated.Janet.Unsafe where

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
        , "void hs_bindgen_f66482fd8d2cc546 ("
        , "  double arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_number(arg1);"
        , "}"
        , "void hs_bindgen_a552e47745cfbb61 ("
        , "  signed int arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_boolean(arg1);"
        , "}"
        , "void hs_bindgen_1bbe1faabc8ccf25 ("
        , "  JanetString arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_string(arg1);"
        , "}"
        , "void hs_bindgen_1379e01018d6c9df ("
        , "  JanetSymbol arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_symbol(arg1);"
        , "}"
        , "void hs_bindgen_c5ccdc0cdb8f2499 ("
        , "  JanetKeyword arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_keyword(arg1);"
        , "}"
        , "void hs_bindgen_72bfa0dd474280f4 ("
        , "  JanetArray *arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_array(arg1);"
        , "}"
        , "void hs_bindgen_72265fc8e8d19722 ("
        , "  JanetTuple arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_tuple(arg1);"
        , "}"
        , "void hs_bindgen_407aae21fb6bcd0b ("
        , "  JanetStruct arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_struct(arg1);"
        , "}"
        , "void hs_bindgen_5d704db5619ae630 ("
        , "  JanetCFunction arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_cfunction(arg1);"
        , "}"
        , "void hs_bindgen_47f37af586762140 ("
        , "  JanetAbstract arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_abstract(arg1);"
        , "}"
        , "void hs_bindgen_dbe3594512ea0a8e ("
        , "  void *arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_pointer(arg1);"
        , "}"
        , "JanetTable *hs_bindgen_a7817ccf69caff04 ("
        , "  JanetTable *arg1"
        , ")"
        , "{"
        , "  return janet_core_env(arg1);"
        , "}"
        , "signed int hs_bindgen_b3882e1d3b98afb9 ("
        , "  JanetTable *arg1,"
        , "  char const *arg2,"
        , "  char const *arg3,"
        , "  Janet *arg4"
        , ")"
        , "{"
        , "  return janet_dostring(arg1, arg2, arg3, arg4);"
        , "}"
        , "void hs_bindgen_daf4e07fa3d781e4 ("
        , "  double arg1,"
        , "  Janet *arg2"
        , ")"
        , "{"
        , "  *arg2 = janet_wrap_number_safe(arg1);"
        , "}"
        , "signed int hs_bindgen_8166fd3e0425226a (void)"
        , "{"
        , "  return janet_init();"
        , "}"
        , "void hs_bindgen_bd7197b49825fe29 (void)"
        , "{"
        , "  janet_deinit();"
        , "}"
        ]
    )
 )

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_number@
foreign import ccall unsafe "hs_bindgen_f66482fd8d2cc546"
    hs_bindgen_f66482fd8d2cc546_base ::
        Double ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_number@
hs_bindgen_f66482fd8d2cc546 ::
    FC.CDouble ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_f66482fd8d2cc546 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_f66482fd8d2cc546_base

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
                hs_bindgen_f66482fd8d2cc546 x0 res1
            )

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_boolean@
foreign import ccall unsafe "hs_bindgen_a552e47745cfbb61"
    hs_bindgen_a552e47745cfbb61_base ::
        GHC.Int.Int32 ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_boolean@
hs_bindgen_a552e47745cfbb61 ::
    FC.CInt ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_a552e47745cfbb61 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_a552e47745cfbb61_base

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
                hs_bindgen_a552e47745cfbb61 x0 res1
            )

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_string@
foreign import ccall unsafe "hs_bindgen_1bbe1faabc8ccf25"
    hs_bindgen_1bbe1faabc8ccf25_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_string@
hs_bindgen_1bbe1faabc8ccf25 ::
    JanetString ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_1bbe1faabc8ccf25 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_1bbe1faabc8ccf25_base

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
                hs_bindgen_1bbe1faabc8ccf25 x0 res1
            )

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_symbol@
foreign import ccall unsafe "hs_bindgen_1379e01018d6c9df"
    hs_bindgen_1379e01018d6c9df_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_symbol@
hs_bindgen_1379e01018d6c9df ::
    JanetSymbol ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_1379e01018d6c9df =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_1379e01018d6c9df_base

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
                hs_bindgen_1379e01018d6c9df x0 res1
            )

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_keyword@
foreign import ccall unsafe "hs_bindgen_c5ccdc0cdb8f2499"
    hs_bindgen_c5ccdc0cdb8f2499_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_keyword@
hs_bindgen_c5ccdc0cdb8f2499 ::
    JanetKeyword ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_c5ccdc0cdb8f2499 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_c5ccdc0cdb8f2499_base

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
                hs_bindgen_c5ccdc0cdb8f2499 x0 res1
            )

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_array@
foreign import ccall unsafe "hs_bindgen_72bfa0dd474280f4"
    hs_bindgen_72bfa0dd474280f4_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_array@
hs_bindgen_72bfa0dd474280f4 ::
    Ptr.Ptr JanetArray ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_72bfa0dd474280f4 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_72bfa0dd474280f4_base

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
                hs_bindgen_72bfa0dd474280f4 x0 res1
            )

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_tuple@
foreign import ccall unsafe "hs_bindgen_72265fc8e8d19722"
    hs_bindgen_72265fc8e8d19722_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_tuple@
hs_bindgen_72265fc8e8d19722 ::
    JanetTuple ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_72265fc8e8d19722 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_72265fc8e8d19722_base

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
                hs_bindgen_72265fc8e8d19722 x0 res1
            )

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_struct@
foreign import ccall unsafe "hs_bindgen_407aae21fb6bcd0b"
    hs_bindgen_407aae21fb6bcd0b_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_struct@
hs_bindgen_407aae21fb6bcd0b ::
    JanetStruct ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_407aae21fb6bcd0b =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_407aae21fb6bcd0b_base

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
                hs_bindgen_407aae21fb6bcd0b x0 res1
            )

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_cfunction@
foreign import ccall unsafe "hs_bindgen_5d704db5619ae630"
    hs_bindgen_5d704db5619ae630_base ::
        Ptr.FunPtr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_cfunction@
hs_bindgen_5d704db5619ae630 ::
    JanetCFunction ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_5d704db5619ae630 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_5d704db5619ae630_base

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
                hs_bindgen_5d704db5619ae630 x0 res1
            )

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_abstract@
foreign import ccall unsafe "hs_bindgen_47f37af586762140"
    hs_bindgen_47f37af586762140_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_abstract@
hs_bindgen_47f37af586762140 ::
    JanetAbstract ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_47f37af586762140 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_47f37af586762140_base

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
                hs_bindgen_47f37af586762140 x0 res1
            )

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_pointer@
foreign import ccall unsafe "hs_bindgen_dbe3594512ea0a8e"
    hs_bindgen_dbe3594512ea0a8e_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_pointer@
hs_bindgen_dbe3594512ea0a8e ::
    Ptr.Ptr Void ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_dbe3594512ea0a8e =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_dbe3594512ea0a8e_base

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
                hs_bindgen_dbe3594512ea0a8e x0 res1
            )

-- __unique:__ @_Generated.Janet_Unsafe_janet_core_env@
foreign import ccall unsafe "hs_bindgen_a7817ccf69caff04"
    hs_bindgen_a7817ccf69caff04_base ::
        Ptr.Ptr Void ->
        IO (Ptr.Ptr Void)

-- __unique:__ @_Generated.Janet_Unsafe_janet_core_env@
hs_bindgen_a7817ccf69caff04 ::
    Ptr.Ptr JanetTable ->
    IO (Ptr.Ptr JanetTable)
hs_bindgen_a7817ccf69caff04 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_a7817ccf69caff04_base

{- | __C declaration:__ @janet_core_env@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1681:23@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_core_env ::
    -- | __C declaration:__ @replacements@
    Ptr.Ptr JanetTable ->
    IO (Ptr.Ptr JanetTable)
janet_core_env = hs_bindgen_a7817ccf69caff04

-- __unique:__ @_Generated.Janet_Unsafe_janet_dostring@
foreign import ccall unsafe "hs_bindgen_b3882e1d3b98afb9"
    hs_bindgen_b3882e1d3b98afb9_base ::
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        Ptr.Ptr Void ->
        IO GHC.Int.Int32

-- __unique:__ @_Generated.Janet_Unsafe_janet_dostring@
hs_bindgen_b3882e1d3b98afb9 ::
    Ptr.Ptr JanetTable ->
    HsBindgen.Runtime.PtrConst.PtrConst FC.CChar ->
    HsBindgen.Runtime.PtrConst.PtrConst FC.CChar ->
    Ptr.Ptr Janet ->
    IO FC.CInt
hs_bindgen_b3882e1d3b98afb9 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_b3882e1d3b98afb9_base

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
janet_dostring = hs_bindgen_b3882e1d3b98afb9

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_number_safe@
foreign import ccall unsafe "hs_bindgen_daf4e07fa3d781e4"
    hs_bindgen_daf4e07fa3d781e4_base ::
        Double ->
        Ptr.Ptr Void ->
        IO ()

-- __unique:__ @_Generated.Janet_Unsafe_janet_wrap_number_safe@
hs_bindgen_daf4e07fa3d781e4 ::
    FC.CDouble ->
    Ptr.Ptr Janet ->
    IO ()
hs_bindgen_daf4e07fa3d781e4 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_daf4e07fa3d781e4_base

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
                hs_bindgen_daf4e07fa3d781e4 x0 res1
            )

-- __unique:__ @_Generated.Janet_Unsafe_janet_init@
foreign import ccall unsafe "hs_bindgen_8166fd3e0425226a"
    hs_bindgen_8166fd3e0425226a_base ::
        IO GHC.Int.Int32

-- __unique:__ @_Generated.Janet_Unsafe_janet_init@
hs_bindgen_8166fd3e0425226a :: IO FC.CInt
hs_bindgen_8166fd3e0425226a =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_8166fd3e0425226a_base

{- | __C declaration:__ @janet_init@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1930:15@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_init :: IO FC.CInt
janet_init = hs_bindgen_8166fd3e0425226a

-- __unique:__ @_Generated.Janet_Unsafe_janet_deinit@
foreign import ccall unsafe "hs_bindgen_bd7197b49825fe29"
    hs_bindgen_bd7197b49825fe29_base ::
        IO ()

-- __unique:__ @_Generated.Janet_Unsafe_janet_deinit@
hs_bindgen_bd7197b49825fe29 :: IO ()
hs_bindgen_bd7197b49825fe29 =
    HsBindgen.Runtime.Internal.HasFFIType.fromFFIType
        hs_bindgen_bd7197b49825fe29_base

{- | __C declaration:__ @janet_deinit@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1931:16@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_deinit :: IO ()
janet_deinit = hs_bindgen_bd7197b49825fe29
