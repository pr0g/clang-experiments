@echo off

REM MSVC
cmake -S . -B build/ -G Ninja^
    -DCMAKE_PREFIX_PATH="C:/Program Files (x86)/LLVM/Debug/lib/cmake/clang;C:/Program Files (x86)/LLVM/Debug/lib/cmake/llvm"^
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

REM Clang
REM cmake -S . -B build-deb/ -G Ninja^
REM     -DCMAKE_BUILD_TYPE=Debug^
REM     -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/LLVM/Release/bin/clang-cl.exe"^
REM     -DCMAKE_PREFIX_PATH="C:/Program Files (x86)/LLVM/Debug/lib/cmake/clang;C:/Program Files (x86)/LLVM/Debug/lib/cmake/llvm"^
REM     -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
