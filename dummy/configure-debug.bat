@echo off

REM Ninja Build
cmake -S . -B build-deb/ -G Ninja^
    -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/LLVM/Release/bin/clang-cl.exe"^
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON^
    -DCMAKE_BUILD_TYPE=Debug

REM Visual Studio Build with Clang
REM cmake -S . -B build-deb/ -G "Visual Studio 16 2019" -A x64 -T clangcl^
REM     -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/LLVM/bin/clang++.exe"
