#!/usr/bin/env bash

set -e

function genDir {
  dir=$1
  echo "Generating protobuf for $dir folder"
  mkdir -p gen/$dir

  filenames=''
  for file in ./src/$dir/*.proto
  do
    filenames+=${file##*/}' '
  done

  out="gen/$dir/go"
  mkdir -p $out
  protoc -I./src -I./src/$dir --go_out=plugins=grpc:$out $filenames
}

function start {
  echo "Starting protobuf build script..."

  passedDirs=$1
  uniqueFolders=`echo -e $passedDirs | uniq`

  echo "Generating protobuf for common.proto"

  out="gen/common/go"
  mkdir -p $out
  protoc -I./src --go_out==plugins=grpc:$out common.proto
  mv $out/github.com/enfipy/tesimp/schema/gen/common/go/* $out
  rm -rf $out/github.com

  for folder in $uniqueFolders
  do
    genDir $folder
  done

  rm -rf gen/src
}

mkdir -p gen

while [ "$1" != "" ]; do
  dirsToGen+=${1}'\n'
  shift;
done;

start $dirsToGen
