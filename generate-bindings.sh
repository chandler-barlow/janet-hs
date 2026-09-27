#! /usr/bin/env bash
ROOT=$(git rev-parse --show-toplevel)
hs-bindgen-cli preprocess \
  --hs-output-dir $ROOT/bindings \
  --overwrite-files \
  --create-output-dirs \
  --module Generated.Janet \
  --select-except-deprecated \
  --select-except-by-decl-name "^janet_atomic_(inc|dec|load|load_relaxed)$" \
  --enable-program-slicing \
   $ROOT/include/janet.h \

