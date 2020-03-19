# Build notes

## Building LLVM/Clang

Commands for building llvm/clang on windows - https://github.com/pr0g/clang-tidy-and-clang-format

Note: Include `clang` and `lld` in `LLVM_ENABLE_PROJECTS`

```bash
cmake --build build/ --target install --config Release
# or
cmake --build build/ --target install --config Debug
```

- @note `install` command will copy files to `C:\Program Files (x86)\LLVM\bin`
  - May need to move files to `C:\Program Files\LLVM\bin` if building `x64`
- @note: With this setup the Debug and Release libs will overwrite each other (whichever you built last will win)

[llvm-cmake](https://llvm.org/docs/CMake.html) - installation instructions for using llvm with cmake (+ installing)

## Dummy project

Test project to compile with clang (on Windows)

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
cmake -S . -B build/ -G "Visual Studio 16 2019" -A x64 -T clangcl^
    -DCMAKE_CXX_COMPILER="C:/Program Files/LLVM/bin/clang++.exe"
```

```bash
# build command (from src/ root dir, containing CMakeLists.txt and main.cpp)
cmake -S . -B build/ -G "Visual Studio 16 2019" -A x64-T clangcl^
    -DCMAKE_PREFIX_PATH="C:/Program Files/LLVM/lib/cmake/clang;C:/Program Files/LLVM/lib/cmake/llvm"^
    -DCMAKE_CXX_COMPILER="C:/Program Files/LLVM/bin/clang++.exe"
```

## Use-LLVM-Simple

@note Must install `C++ Clang-cl for v142 build tools` in Visual Studio installer
