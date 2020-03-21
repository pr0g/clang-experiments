@echo off

cmake -S . -B build-deb/ -G Ninja^
    -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/LLVM/Release/bin/clang++.exe"^
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON^
    -DCMAKE_BUILD_TYPE=Debug

REM cmake -S . -B build/ -G "Visual Studio 16 2019" -A x64 -T clangcl^
REM     -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/LLVM/bin/clang++.exe"
