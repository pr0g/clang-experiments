@echo off

REM Ninja Build
cmake -S . -B build-deb/ -G Ninja^
    -DCMAKE_BUILD_TYPE=Debug^
    -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/LLVM/Release/bin/clang-cl.exe"^
    -DCMAKE_PREFIX_PATH="C:/Program Files (x86)/LLVM/Debug/lib/cmake/clang;C:/Program Files (x86)/LLVM/Debug/lib/cmake/llvm"^
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
