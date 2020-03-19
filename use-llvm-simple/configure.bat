@echo off

REM Visual Studio Build
cmake -S . -B build/ -G "Visual Studio 16 2019" -A x64 -T clangcl^
    -DCMAKE_PREFIX_PATH="C:/Program Files/LLVM/lib/cmake/clang;C:/Program Files/LLVM/lib/cmake/llvm"^
    -DCMAKE_CXX_COMPILER="C:/Program Files/LLVM/bin/clang++.exe"

REM Ninja Build
REM cmake -S . -B build/ -G Ninja^
REM -DCMAKE_PREFIX_PATH="C:/Program Files/LLVM/lib/cmake/clang;C:/Program Files/LLVM/lib/cmake/llvm"^
REM -DCMAKE_BUILD_TYPE=Release
