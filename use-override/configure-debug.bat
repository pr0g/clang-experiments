@echo off

REM Ninja Build
cmake -S . -B build-deb/ -G Ninja^
    -DCMAKE_BUILD_TYPE=Debug^
    -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/LLVM/Release/bin/clang++.exe"^
    -DCMAKE_PREFIX_PATH="C:/Program Files (x86)/LLVM/Debug/lib/cmake/clang;C:/Program Files (x86)/LLVM/Debug/lib/cmake/llvm"^
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

REM Visual Studio Build
REM cmake -S . -B build/ -G "Visual Studio 16 2019" -A x64^
REM    -DCMAKE_PREFIX_PATH="C:/Program Files (x86)/LLVM/Debug/lib/cmake/clang;C:/Program Files (x86)/LLVM/Debug/lib/cmake/llvm"
