#! /usr/bin/env bash
ROOT=$(git rev-parse --show-toplevel)
hs-bindgen-cli preprocess \
  --hs-output-dir $ROOT/out \
  --overwrite-files \
  --create-output-dirs \
  --module Generated.Janet \
  --select-except-deprecated \
  --enable-program-slicing \
   $ROOT/include/janet.h \

