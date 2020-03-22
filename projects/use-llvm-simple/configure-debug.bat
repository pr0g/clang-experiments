@echo off

REM Ninja Build
cmake -S . -B build-deb/ -G Ninja^
    -DCMAKE_BUILD_TYPE=Debug^
    -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/LLVM/Release/bin/clang-cl.exe"^
    -DCMAKE_PREFIX_PATH="C:/Program Files (x86)/LLVM/Debug/lib/cmake/clang;C:/Program Files (x86)/LLVM/Debug/lib/cmake/llvm"

REM Visual Studio Build (with clang-cl)
REM cmake -S . -B build/ -G "Visual Studio 16 2019" -A x64 -T clangcl^
REM    -DCMAKE_PREFIX_PATH="C:/Program Files/LLVM/lib/cmake/clang;C:/Program Files/LLVM/lib/cmake/llvm"^
REM    -DCMAKE_CXX_COMPILER="C:/Program Files/LLVM/bin/clang++.exe"
