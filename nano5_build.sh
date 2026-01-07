#!/usr/bin/env bash

module purge

module load gcc/11.5.0
module load openmpi/4.1.6
module load cmake/3.24.2

module lista

# Compile deps
cd dep
mkdir build
cd build

cmake .. -DCMAKE_BUILD_TYPE=Release

make -j 4

# Compile source code
cd ../../src
mkdir build
cd build

CC=mpicc CXX=mpicxx cmake .. -DCMAKE_BUILD_TYPE=Release

make -j 4
