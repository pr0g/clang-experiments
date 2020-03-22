@echo off

REM Ninja Build
cmake -S . -B build-rel/ -G Ninja^
    -DCMAKE_BUILD_TYPE=Release^
    -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/LLVM/Release/bin/clang-cl.exe"^
    -DCMAKE_PREFIX_PATH="C:/Program Files (x86)/LLVM/Release/lib/cmake/clang;C:/Program Files (x86)/LLVM/Release/lib/cmake/llvm"^
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

REM Visual Studio Build
REM cmake -S . -B build/ -G "Visual Studio 16 2019" -A x64^
REM     -DCMAKE_PREFIX_PATH="C:/Program Files (x86)/LLVM/Release/lib/cmake/clang;C:/Program Files (x86)/LLVM/Release/lib/cmake/llvm"

REM Visual Studio Build with Clang
REM cmake -S . -B build/ -G "Visual Studio 16 2019" -A x64 -T clangcl^
REM     -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/LLVM/Release/bin/clang++.exe"^
REM     -DCMAKE_PREFIX_PATH="C:/Program Files (x86)/LLVM/Release/lib/cmake/clang;C:/Program Files (x86)/LLVM/Release/lib/cmake/llvm"
