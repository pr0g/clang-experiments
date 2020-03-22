@echo off

REM Ninja Build
cmake -S . -B build-rel/ -G Ninja^
    -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/LLVM/Release/bin/clang-cl.exe"^
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON^
    -DCMAKE_BUILD_TYPE=Release

REM Visual Studio Build
REM cmake -S . -B build-rel/ -G "Visual Studio 16 2019" -A x64
