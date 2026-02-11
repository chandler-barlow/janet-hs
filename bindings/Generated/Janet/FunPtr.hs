{-# LANGUAGE CApiFFI #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_HADDOCK prune #-}

module Generated.Janet.FunPtr where

import qualified Foreign.C as FC
import qualified GHC.IO.Unsafe
import qualified GHC.Ptr as Ptr
import qualified HsBindgen.Runtime.Internal.CAPI
import qualified HsBindgen.Runtime.Internal.HasFFIType
import qualified HsBindgen.Runtime.PtrConst
import Data.Void (Void)
import Generated.Janet
import Prelude (IO)

$(HsBindgen.Runtime.Internal.CAPI.addCSource (HsBindgen.Runtime.Internal.CAPI.unlines
  [ "#include </Users/cbarlow/dev/janet-hs/include/janet.h>"
  , "/* _Generated.Janet_get_janet_wrap_number */"
  , "__attribute__ ((const))"
  , "Janet (*hs_bindgen_a8d3e1a6f720412a (void)) ("
  , "  double arg1"
  , ")"
  , "{"
  , "  return &janet_wrap_number;"
  , "}"
  , "/* _Generated.Janet_get_janet_wrap_boolean */"
  , "__attribute__ ((const))"
  , "Janet (*hs_bindgen_b3659b1f4d787141 (void)) ("
  , "  signed int arg1"
  , ")"
  , "{"
  , "  return &janet_wrap_boolean;"
  , "}"
  , "/* _Generated.Janet_get_janet_wrap_string */"
  , "__attribute__ ((const))"
  , "Janet (*hs_bindgen_55f6e66ebcecfb6d (void)) ("
  , "  JanetString arg1"
  , ")"
  , "{"
  , "  return &janet_wrap_string;"
  , "}"
  , "/* _Generated.Janet_get_janet_wrap_symbol */"
  , "__attribute__ ((const))"
  , "Janet (*hs_bindgen_ceb225668cf4b35b (void)) ("
  , "  JanetSymbol arg1"
  , ")"
  , "{"
  , "  return &janet_wrap_symbol;"
  , "}"
  , "/* _Generated.Janet_get_janet_wrap_keyword */"
  , "__attribute__ ((const))"
  , "Janet (*hs_bindgen_1673067db506aa3d (void)) ("
  , "  JanetKeyword arg1"
  , ")"
  , "{"
  , "  return &janet_wrap_keyword;"
  , "}"
  , "/* _Generated.Janet_get_janet_wrap_array */"
  , "__attribute__ ((const))"
  , "Janet (*hs_bindgen_0af2219f8844c9f4 (void)) ("
  , "  JanetArray *arg1"
  , ")"
  , "{"
  , "  return &janet_wrap_array;"
  , "}"
  , "/* _Generated.Janet_get_janet_wrap_tuple */"
  , "__attribute__ ((const))"
  , "Janet (*hs_bindgen_e855dc1d937f20c9 (void)) ("
  , "  JanetTuple arg1"
  , ")"
  , "{"
  , "  return &janet_wrap_tuple;"
  , "}"
  , "/* _Generated.Janet_get_janet_wrap_struct */"
  , "__attribute__ ((const))"
  , "Janet (*hs_bindgen_822bbdf1879ae658 (void)) ("
  , "  JanetStruct arg1"
  , ")"
  , "{"
  , "  return &janet_wrap_struct;"
  , "}"
  , "/* _Generated.Janet_get_janet_wrap_cfunction */"
  , "__attribute__ ((const))"
  , "Janet (*hs_bindgen_4249d0ae2dd5e285 (void)) ("
  , "  JanetCFunction arg1"
  , ")"
  , "{"
  , "  return &janet_wrap_cfunction;"
  , "}"
  , "/* _Generated.Janet_get_janet_wrap_abstract */"
  , "__attribute__ ((const))"
  , "Janet (*hs_bindgen_b93b53a674cd129b (void)) ("
  , "  JanetAbstract arg1"
  , ")"
  , "{"
  , "  return &janet_wrap_abstract;"
  , "}"
  , "/* _Generated.Janet_get_janet_wrap_pointer */"
  , "__attribute__ ((const))"
  , "Janet (*hs_bindgen_6ce43fb5f0ccf5f5 (void)) ("
  , "  void *arg1"
  , ")"
  , "{"
  , "  return &janet_wrap_pointer;"
  , "}"
  , "/* _Generated.Janet_get_janet_core_env */"
  , "__attribute__ ((const))"
  , "JanetTable *(*hs_bindgen_b79e46e8195be44d (void)) ("
  , "  JanetTable *arg1"
  , ")"
  , "{"
  , "  return &janet_core_env;"
  , "}"
  , "/* _Generated.Janet_get_janet_dostring */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_f769a9bbab9eacd5 (void)) ("
  , "  JanetTable *arg1,"
  , "  char const *arg2,"
  , "  char const *arg3,"
  , "  Janet *arg4"
  , ")"
  , "{"
  , "  return &janet_dostring;"
  , "}"
  , "/* _Generated.Janet_get_janet_wrap_number_safe */"
  , "__attribute__ ((const))"
  , "Janet (*hs_bindgen_7d6c62444663734c (void)) ("
  , "  double arg1"
  , ")"
  , "{"
  , "  return &janet_wrap_number_safe;"
  , "}"
  , "/* _Generated.Janet_get_janet_init */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_79c4ff6b24f060ac (void)) (void)"
  , "{"
  , "  return &janet_init;"
  , "}"
  , "/* _Generated.Janet_get_janet_deinit */"
  , "__attribute__ ((const))"
  , "void (*hs_bindgen_47a280b92187e771 (void)) (void)"
  , "{"
  , "  return &janet_deinit;"
  , "}"
  ]))

-- __unique:__ @_Generated.Janet_get_janet_wrap_number@
foreign import ccall unsafe "hs_bindgen_a8d3e1a6f720412a" hs_bindgen_a8d3e1a6f720412a_base ::
     IO (Ptr.FunPtr Void)

-- __unique:__ @_Generated.Janet_get_janet_wrap_number@
hs_bindgen_a8d3e1a6f720412a :: IO (Ptr.FunPtr (FC.CDouble -> IO Janet))
hs_bindgen_a8d3e1a6f720412a =
  HsBindgen.Runtime.Internal.HasFFIType.fromFFIType hs_bindgen_a8d3e1a6f720412a_base

{-# NOINLINE janet_wrap_number #-}
{-| __C declaration:__ @janet_wrap_number@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 808:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_number :: Ptr.FunPtr (FC.CDouble -> IO Janet)
janet_wrap_number =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_a8d3e1a6f720412a

-- __unique:__ @_Generated.Janet_get_janet_wrap_boolean@
foreign import ccall unsafe "hs_bindgen_b3659b1f4d787141" hs_bindgen_b3659b1f4d787141_base ::
     IO (Ptr.FunPtr Void)

-- __unique:__ @_Generated.Janet_get_janet_wrap_boolean@
hs_bindgen_b3659b1f4d787141 :: IO (Ptr.FunPtr (FC.CInt -> IO Janet))
hs_bindgen_b3659b1f4d787141 =
  HsBindgen.Runtime.Internal.HasFFIType.fromFFIType hs_bindgen_b3659b1f4d787141_base

{-# NOINLINE janet_wrap_boolean #-}
{-| __C declaration:__ @janet_wrap_boolean@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 811:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_boolean :: Ptr.FunPtr (FC.CInt -> IO Janet)
janet_wrap_boolean =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_b3659b1f4d787141

-- __unique:__ @_Generated.Janet_get_janet_wrap_string@
foreign import ccall unsafe "hs_bindgen_55f6e66ebcecfb6d" hs_bindgen_55f6e66ebcecfb6d_base ::
     IO (Ptr.FunPtr Void)

-- __unique:__ @_Generated.Janet_get_janet_wrap_string@
hs_bindgen_55f6e66ebcecfb6d :: IO (Ptr.FunPtr (JanetString -> IO Janet))
hs_bindgen_55f6e66ebcecfb6d =
  HsBindgen.Runtime.Internal.HasFFIType.fromFFIType hs_bindgen_55f6e66ebcecfb6d_base

{-# NOINLINE janet_wrap_string #-}
{-| __C declaration:__ @janet_wrap_string@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 812:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_string :: Ptr.FunPtr (JanetString -> IO Janet)
janet_wrap_string =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_55f6e66ebcecfb6d

-- __unique:__ @_Generated.Janet_get_janet_wrap_symbol@
foreign import ccall unsafe "hs_bindgen_ceb225668cf4b35b" hs_bindgen_ceb225668cf4b35b_base ::
     IO (Ptr.FunPtr Void)

-- __unique:__ @_Generated.Janet_get_janet_wrap_symbol@
hs_bindgen_ceb225668cf4b35b :: IO (Ptr.FunPtr (JanetSymbol -> IO Janet))
hs_bindgen_ceb225668cf4b35b =
  HsBindgen.Runtime.Internal.HasFFIType.fromFFIType hs_bindgen_ceb225668cf4b35b_base

{-# NOINLINE janet_wrap_symbol #-}
{-| __C declaration:__ @janet_wrap_symbol@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 813:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_symbol :: Ptr.FunPtr (JanetSymbol -> IO Janet)
janet_wrap_symbol =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_ceb225668cf4b35b

-- __unique:__ @_Generated.Janet_get_janet_wrap_keyword@
foreign import ccall unsafe "hs_bindgen_1673067db506aa3d" hs_bindgen_1673067db506aa3d_base ::
     IO (Ptr.FunPtr Void)

-- __unique:__ @_Generated.Janet_get_janet_wrap_keyword@
hs_bindgen_1673067db506aa3d :: IO (Ptr.FunPtr (JanetKeyword -> IO Janet))
hs_bindgen_1673067db506aa3d =
  HsBindgen.Runtime.Internal.HasFFIType.fromFFIType hs_bindgen_1673067db506aa3d_base

{-# NOINLINE janet_wrap_keyword #-}
{-| __C declaration:__ @janet_wrap_keyword@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 814:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_keyword :: Ptr.FunPtr (JanetKeyword -> IO Janet)
janet_wrap_keyword =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_1673067db506aa3d

-- __unique:__ @_Generated.Janet_get_janet_wrap_array@
foreign import ccall unsafe "hs_bindgen_0af2219f8844c9f4" hs_bindgen_0af2219f8844c9f4_base ::
     IO (Ptr.FunPtr Void)

-- __unique:__ @_Generated.Janet_get_janet_wrap_array@
hs_bindgen_0af2219f8844c9f4 :: IO (Ptr.FunPtr ((Ptr.Ptr JanetArray) -> IO Janet))
hs_bindgen_0af2219f8844c9f4 =
  HsBindgen.Runtime.Internal.HasFFIType.fromFFIType hs_bindgen_0af2219f8844c9f4_base

{-# NOINLINE janet_wrap_array #-}
{-| __C declaration:__ @janet_wrap_array@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 815:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_array :: Ptr.FunPtr ((Ptr.Ptr JanetArray) -> IO Janet)
janet_wrap_array =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_0af2219f8844c9f4

-- __unique:__ @_Generated.Janet_get_janet_wrap_tuple@
foreign import ccall unsafe "hs_bindgen_e855dc1d937f20c9" hs_bindgen_e855dc1d937f20c9_base ::
     IO (Ptr.FunPtr Void)

-- __unique:__ @_Generated.Janet_get_janet_wrap_tuple@
hs_bindgen_e855dc1d937f20c9 :: IO (Ptr.FunPtr (JanetTuple -> IO Janet))
hs_bindgen_e855dc1d937f20c9 =
  HsBindgen.Runtime.Internal.HasFFIType.fromFFIType hs_bindgen_e855dc1d937f20c9_base

{-# NOINLINE janet_wrap_tuple #-}
{-| __C declaration:__ @janet_wrap_tuple@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 816:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_tuple :: Ptr.FunPtr (JanetTuple -> IO Janet)
janet_wrap_tuple =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_e855dc1d937f20c9

-- __unique:__ @_Generated.Janet_get_janet_wrap_struct@
foreign import ccall unsafe "hs_bindgen_822bbdf1879ae658" hs_bindgen_822bbdf1879ae658_base ::
     IO (Ptr.FunPtr Void)

-- __unique:__ @_Generated.Janet_get_janet_wrap_struct@
hs_bindgen_822bbdf1879ae658 :: IO (Ptr.FunPtr (JanetStruct -> IO Janet))
hs_bindgen_822bbdf1879ae658 =
  HsBindgen.Runtime.Internal.HasFFIType.fromFFIType hs_bindgen_822bbdf1879ae658_base

{-# NOINLINE janet_wrap_struct #-}
{-| __C declaration:__ @janet_wrap_struct@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 817:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_struct :: Ptr.FunPtr (JanetStruct -> IO Janet)
janet_wrap_struct =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_822bbdf1879ae658

-- __unique:__ @_Generated.Janet_get_janet_wrap_cfunction@
foreign import ccall unsafe "hs_bindgen_4249d0ae2dd5e285" hs_bindgen_4249d0ae2dd5e285_base ::
     IO (Ptr.FunPtr Void)

-- __unique:__ @_Generated.Janet_get_janet_wrap_cfunction@
hs_bindgen_4249d0ae2dd5e285 :: IO (Ptr.FunPtr (JanetCFunction -> IO Janet))
hs_bindgen_4249d0ae2dd5e285 =
  HsBindgen.Runtime.Internal.HasFFIType.fromFFIType hs_bindgen_4249d0ae2dd5e285_base

{-# NOINLINE janet_wrap_cfunction #-}
{-| __C declaration:__ @janet_wrap_cfunction@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 821:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_cfunction :: Ptr.FunPtr (JanetCFunction -> IO Janet)
janet_wrap_cfunction =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_4249d0ae2dd5e285

-- __unique:__ @_Generated.Janet_get_janet_wrap_abstract@
foreign import ccall unsafe "hs_bindgen_b93b53a674cd129b" hs_bindgen_b93b53a674cd129b_base ::
     IO (Ptr.FunPtr Void)

-- __unique:__ @_Generated.Janet_get_janet_wrap_abstract@
hs_bindgen_b93b53a674cd129b :: IO (Ptr.FunPtr (JanetAbstract -> IO Janet))
hs_bindgen_b93b53a674cd129b =
  HsBindgen.Runtime.Internal.HasFFIType.fromFFIType hs_bindgen_b93b53a674cd129b_base

{-# NOINLINE janet_wrap_abstract #-}
{-| __C declaration:__ @janet_wrap_abstract@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 823:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_abstract :: Ptr.FunPtr (JanetAbstract -> IO Janet)
janet_wrap_abstract =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_b93b53a674cd129b

-- __unique:__ @_Generated.Janet_get_janet_wrap_pointer@
foreign import ccall unsafe "hs_bindgen_6ce43fb5f0ccf5f5" hs_bindgen_6ce43fb5f0ccf5f5_base ::
     IO (Ptr.FunPtr Void)

-- __unique:__ @_Generated.Janet_get_janet_wrap_pointer@
hs_bindgen_6ce43fb5f0ccf5f5 :: IO (Ptr.FunPtr ((Ptr.Ptr Void) -> IO Janet))
hs_bindgen_6ce43fb5f0ccf5f5 =
  HsBindgen.Runtime.Internal.HasFFIType.fromFFIType hs_bindgen_6ce43fb5f0ccf5f5_base

{-# NOINLINE janet_wrap_pointer #-}
{-| __C declaration:__ @janet_wrap_pointer@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 824:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_pointer :: Ptr.FunPtr ((Ptr.Ptr Void) -> IO Janet)
janet_wrap_pointer =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_6ce43fb5f0ccf5f5

-- __unique:__ @_Generated.Janet_get_janet_core_env@
foreign import ccall unsafe "hs_bindgen_b79e46e8195be44d" hs_bindgen_b79e46e8195be44d_base ::
     IO (Ptr.FunPtr Void)

-- __unique:__ @_Generated.Janet_get_janet_core_env@
hs_bindgen_b79e46e8195be44d :: IO (Ptr.FunPtr ((Ptr.Ptr JanetTable) -> IO (Ptr.Ptr JanetTable)))
hs_bindgen_b79e46e8195be44d =
  HsBindgen.Runtime.Internal.HasFFIType.fromFFIType hs_bindgen_b79e46e8195be44d_base

{-# NOINLINE janet_core_env #-}
{-| __C declaration:__ @janet_core_env@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1767:23@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_core_env :: Ptr.FunPtr ((Ptr.Ptr JanetTable) -> IO (Ptr.Ptr JanetTable))
janet_core_env =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_b79e46e8195be44d

-- __unique:__ @_Generated.Janet_get_janet_dostring@
foreign import ccall unsafe "hs_bindgen_f769a9bbab9eacd5" hs_bindgen_f769a9bbab9eacd5_base ::
     IO (Ptr.FunPtr Void)

-- __unique:__ @_Generated.Janet_get_janet_dostring@
hs_bindgen_f769a9bbab9eacd5 :: IO (Ptr.FunPtr ((Ptr.Ptr JanetTable) -> (HsBindgen.Runtime.PtrConst.PtrConst FC.CChar) -> (HsBindgen.Runtime.PtrConst.PtrConst FC.CChar) -> (Ptr.Ptr Janet) -> IO FC.CInt))
hs_bindgen_f769a9bbab9eacd5 =
  HsBindgen.Runtime.Internal.HasFFIType.fromFFIType hs_bindgen_f769a9bbab9eacd5_base

{-# NOINLINE janet_dostring #-}
{-| __C declaration:__ @janet_dostring@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 1778:15@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_dostring :: Ptr.FunPtr ((Ptr.Ptr JanetTable) -> (HsBindgen.Runtime.PtrConst.PtrConst FC.CChar) -> (HsBindgen.Runtime.PtrConst.PtrConst FC.CChar) -> (Ptr.Ptr Janet) -> IO FC.CInt)
janet_dostring =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_f769a9bbab9eacd5

-- __unique:__ @_Generated.Janet_get_janet_wrap_number_safe@
foreign import ccall unsafe "hs_bindgen_7d6c62444663734c" hs_bindgen_7d6c62444663734c_base ::
     IO (Ptr.FunPtr Void)

-- __unique:__ @_Generated.Janet_get_janet_wrap_number_safe@
hs_bindgen_7d6c62444663734c :: IO (Ptr.FunPtr (FC.CDouble -> IO Janet))
hs_bindgen_7d6c62444663734c =
  HsBindgen.Runtime.Internal.HasFFIType.fromFFIType hs_bindgen_7d6c62444663734c_base

{-# NOINLINE janet_wrap_number_safe #-}
{-| __C declaration:__ @janet_wrap_number_safe@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 2035:17@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_wrap_number_safe :: Ptr.FunPtr (FC.CDouble -> IO Janet)
janet_wrap_number_safe =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_7d6c62444663734c

-- __unique:__ @_Generated.Janet_get_janet_init@
foreign import ccall unsafe "hs_bindgen_79c4ff6b24f060ac" hs_bindgen_79c4ff6b24f060ac_base ::
     IO (Ptr.FunPtr Void)

-- __unique:__ @_Generated.Janet_get_janet_init@
hs_bindgen_79c4ff6b24f060ac :: IO (Ptr.FunPtr (IO FC.CInt))
hs_bindgen_79c4ff6b24f060ac =
  HsBindgen.Runtime.Internal.HasFFIType.fromFFIType hs_bindgen_79c4ff6b24f060ac_base

{-# NOINLINE janet_init #-}
{-| __C declaration:__ @janet_init@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 2042:15@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_init :: Ptr.FunPtr (IO FC.CInt)
janet_init =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_79c4ff6b24f060ac

-- __unique:__ @_Generated.Janet_get_janet_deinit@
foreign import ccall unsafe "hs_bindgen_47a280b92187e771" hs_bindgen_47a280b92187e771_base ::
     IO (Ptr.FunPtr Void)

-- __unique:__ @_Generated.Janet_get_janet_deinit@
hs_bindgen_47a280b92187e771 :: IO (Ptr.FunPtr (IO ()))
hs_bindgen_47a280b92187e771 =
  HsBindgen.Runtime.Internal.HasFFIType.fromFFIType hs_bindgen_47a280b92187e771_base

{-# NOINLINE janet_deinit #-}
{-| __C declaration:__ @janet_deinit@

    __defined at:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h 2043:16@

    __exported by:__ @\/Users\/cbarlow\/dev\/janet-hs\/include\/janet.h@
-}
janet_deinit :: Ptr.FunPtr (IO ())
janet_deinit =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_47a280b92187e771
