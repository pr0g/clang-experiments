@echo off

cmake -S llvm/ -B build-rel/ -G "Visual Studio 16 2019"^
    -DCMAKE_INSTALL_PREFIX="C:/Program Files (x86)/LLVM/Release"^
    -DCMAKE_GENERATOR_PLATFORM=x64^
    -Thost=x64^
    -DLLVM_INCLUDE_TESTS=OFF^
    -DLLVM_BUILD_TOOLS=ON^
    -DLLVM_INCLUDE_UTILS=OFF^
    -DLLVM_TARGETS_TO_BUILD=X86^
    -DCLANG_ENABLE_STATIC_ANALYZER=OFF^
    -DCLANG_ENABLE_ARCMT=OFF^
    -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld"
