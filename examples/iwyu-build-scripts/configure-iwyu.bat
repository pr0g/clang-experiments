@echo off

REM Visual Studio Build (msbuild)
REM cmake -S . -B build/ -G "Visual Studio 16 2019" -A x64^
REM     -DCMAKE_PREFIX_PATH="C:/Program Files (x86)/LLVM/Release/lib/cmake/clang;C:/Program Files (x86)/LLVM/Release/lib/cmake/llvm"

REM Visual Studio Build (ninja)
cmake -S . -B build-ninja/ -G Ninja^
    -DCMAKE_PREFIX_PATH="C:/Program Files (x86)/LLVM/Release/lib/cmake/clang;C:/Program Files (x86)/LLVM/Release/lib/cmake/llvm"^
    -DCMAKE_BUILD_TYPE=Release

REM Command to invoke iwyu
REM python C:\Users\hultonha\Documents\iwyu\iwyu_tool.py -p .
