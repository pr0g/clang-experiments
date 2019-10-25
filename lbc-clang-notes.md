# Build notes

## Building LLVM/Clang

Commands for building llvm/clang on windows

```bash
mkdir llvm && cd llvm
git clone https://github.com/llvm/llvm-project.git .
cmake -S . -B build\ -DLLVM_ENABLE_PROJECTS=clang;lld -G "Visual Studio 16 2019" -A x64 -Thost=x64 ..\llvm

cmake --build build/ --target install --config Release
# or
cmake --build build/ --target install --config Debug
```

- Must copy files from build `bin/` folder to `C:\Program Files\LLVM\bin`
  - e.g. `<root>/llvm/llvm/build/Release/bin/`

[llvm-cmake](https://llvm.org/docs/CMake.html) - installation instructions for using llvm with cmake (+ installing)

## Dummy project

Test project to compile with clang (on Windows)

Must install Visual Studio extension `llvm2019` for `-T "llvm"` option to work

```cmake
# CMakeLists.txt
cmake_minimum_required(VERSION 3.13)
project(test LANGUAGES CXX)
add_executable(${PROJECT_NAME} main.cpp)
```

```c++
// main.cpp
#include <iostream>

int main(int argc, char** argv)
{
    std::cout << "hello, world!\n";
    return 0;
}
```

```bash
# build command (from src/ root dir, containing CMakeLists.txt and main.cpp)
cmake -S . -B build/ -G "Visual Studio 16 2019" -A x64 -T "llvm"
```

```bash
# build command (from src/ root dir, containing CMakeLists.txt and main.cpp)
cmake -S . -B build/ -G "Visual Studio 16 2019" -A x64 -T "llvm"^
    -DCMAKE_PREFIX_PATH="C:\Program Files (x86)\LLVM\lib\cmake\clang;C:\Program Files (x86)\LLVM\lib\cmake\llvm"
```

## Use-LLVM-Simple
