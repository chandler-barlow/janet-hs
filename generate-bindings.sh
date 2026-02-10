#! /usr/bin/env bash
ROOT=$(git rev-parse --show-toplevel)
hs-bindgen-cli preprocess \
  --hs-output-dir $ROOT/bindings \
  --overwrite-files \
  --create-output-dirs \
  --module Generated.Janet \
  --select-except-deprecated \
  --select-by-decl-name "janet_init" \
  --enable-program-slicing \
  --select-by-decl-name "janet_core_env" \
  --select-by-decl-name "janet_deinit" \
  --select-by-decl-name "janet_dostring" \
  --select-by-decl-name "janet_unwrap_struct" \
  --select-by-decl-name "janet_unwrap_tuple" \
  --select-by-decl-name "janet_unwrap_array" \
  --select-by-decl-name "janet_unwrap_string" \
  --select-by-decl-name "janet_unwrap_symbol" \
  --select-by-decl-name "janet_unwrap_keyword" \
  --select-by-decl-name "janet_unwrap_abstract" \
  --select-by-decl-name "janet_unwrap_pointer" \
  --select-by-decl-name "janet_unwrap_cfunction" \
  --select-by-decl-name "janet_unwrap_boolean" \
  --select-by-decl-name "janet_unwrap_number" \
  --select-by-decl-name "janet_unwrap_integer" \
  --select-by-decl-name "janet_wrap_struct" \
  --select-by-decl-name "janet_wrap_tuple" \
  --select-by-decl-name "janet_wrap_array" \
  --select-by-decl-name "janet_wrap_string" \
  --select-by-decl-name "janet_wrap_symbol" \
  --select-by-decl-name "janet_wrap_keyword" \
  --select-by-decl-name "janet_wrap_abstract" \
  --select-by-decl-name "janet_wrap_pointer" \
  --select-by-decl-name "janet_wrap_cfunction" \
  --select-by-decl-name "janet_wrap_boolean" \
  --select-by-decl-name "janet_wrap_number" \
  --select-by-decl-name "janet_wrap_integer" \
  --select-by-decl-name "JANET" \
   $ROOT/include/janet.h \

