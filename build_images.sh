#!/bin/bash
pushd 01_supervisor;    ./build_image.sh; popd
pushd 02_java;          ./build_image.sh; popd
pushd 03_zookeeper;     ./build_image.sh; popd
pushd 04_zookeeper_ui;  ./build_image.sh; popd
