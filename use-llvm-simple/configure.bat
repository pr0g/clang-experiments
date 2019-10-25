@echo off

cmake -S . -B build/ -G "Visual Studio 16 2019" -A x64 -T "llvm"^
    -DCMAKE_PREFIX_PATH="C:\Program Files (x86)\LLVM\lib\cmake\clang;C:\Program Files (x86)\LLVM\lib\cmake\llvm"
