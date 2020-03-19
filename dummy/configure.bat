@echo off

cmake -S . -B build/ -G "Visual Studio 16 2019" -A x64 -T clangcl^
    -DCMAKE_CXX_COMPILER="C:/Program Files/LLVM/bin/clang++.exe"
