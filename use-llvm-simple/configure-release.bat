@echo off

cmake -S . -B build-rel/ -G Ninja^
    -DCMAKE_BUILD_TYPE=Release^
    -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/LLVM/Release/bin/clang++.exe"^
    -DCMAKE_PREFIX_PATH="C:/Program Files (x86)/LLVM/Release/lib/cmake/clang;C:/Program Files (x86)/LLVM/Release/lib/cmake/llvm"
