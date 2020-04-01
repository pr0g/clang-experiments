# Clang on Windows

## Building LLVM/Clang

Commands for building LLVM/Clang on Windows.

### LLVM/Clang Windows Prerequisites

- [Visual Studio 2019](https://visualstudio.microsoft.com/downloads/)
- [CMake](https://cmake.org/download/)
- [Git](https://git-scm.com/downloads)

### Instructions

1. Create a directory to sync the LLVM Project repo to.

    ```bash
    cd ${SRC_ROOT} # root folder for LLVM repo
    git clone --depth 1 https://github.com/llvm/llvm-project .
    ```

2. From the root folder, configure the build for LLVM.

    ```bash
    cmake -S llvm/ -B build/ -G "Visual Studio 16 2019"^
        -DCMAKE_GENERATOR_PLATFORM=x64^
        -Thost=x64^
        -DLLVM_INCLUDE_TESTS=OFF^
        -DLLVM_BUILD_TOOLS=ON^
        -DLLVM_INCLUDE_UTILS=OFF^
        -DLLVM_TARGETS_TO_BUILD=X86^
        -DCLANG_ENABLE_STATIC_ANALYZER=OFF^
        -DCLANG_ENABLE_ARCMT=OFF^
        -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld"
    ```

3. Build LLVM/Clang.

    ```bash
    cmake --build build/ --target install --config Release
    ```

    - The `--target install` command will copy built files (.lib, .exe etc.) to `C:\Program Files (x86)\LLVM` by default. This location can be customized by setting the `-DCMAKE_INSTALL_PREFIX` variable when running the configure step.
        - If a custom install location isn't set and a Debug version of the library is built/installed, the files will overwrite the previous Release files (whichever you built last will win). Please see the example files in [examples/llvm-build-scripts](examples/llvm-build-scripts) for an example of how to install both Debug and Release versions using `-DCMAKE_INSTALL_PREFIX`.

4. More information can be found [here](https://llvm.org/docs/CMake.html) on using LLVM and CMake.

## Ninja

It is possible to use the Ninja build system on Windows (even when using the MSVC (`cl.exe`) compiler) as opposed to `MSBuild`. This is useful if you want to generate a `compile_commands.json` file for your project.

### Ninja Prerequisites

- If you wish to use your normal terminal (e.g. cmd.exe, cmder, Windows Terminal etc.) Ninja must be added to your path.
    - Potential locations include:
      - `C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\IDE\CommonExtensions\Microsoft\CMake\Ninja\ninja.exe`
      - `C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\Ninja\ninja.exe`
- To use the Ninja generator from your normal terminal with MSVC you must also run `vcvars64.bat`. This is so CMake knows the location of the compiler (`cl.exe`).
    - Potential locations include:
      - `"C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\VC\Auxiliary\Build\vcvars64.bat"`
      - `"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"`
- It is also possible to simply launch the Developer Command Prompt for Visual Studio to have these options added automatically to the environment.

> The exact location of `ninja.exe` and `vcvars64.bat` may differ depending on which version of Visual Studio you have installed (year/edition etc.)).

## Projects

### Build with Clang

There are several options available when building your project.

- If you would like to use the full Visual Studio tool-chain then you can download _C++ Clang Compiler for Windows (9.0.0)_ from the Visual Studio Installer _(Modify - Individual Components - (search 'llvm'))_.
- To build using MSBuild and a custom Clang build, download _C++ Clang-cl for v142 build tools (x64/x86)_ _(Modify - Individual Components - (search 'llvm'))_.

    ```bash
    # configure with MSBuild generator and Clang compiler
    cmake -S . -B build/ -G "Visual Studio 16 2019" -A x64 -T clangcl^
        -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/LLVM/bin/clang++.exe" # optional - custom Clang location

    # build with MSBuild
    cmake --build build --config Release
    ```

  - For the above to work, you must add the location where you installed `clang` to your Path, or have the previously mentioned _C++ Clang Compiler for Windows (9.0.0)_ downloaded. By default Visual Studio looks for Clang in two places ([source](https://docs.microsoft.com/en-us/cpp/build/clang-support-cmake)):
    - (Windows) The internally installed copy of Clang/LLVM that comes with the Visual Studio installer.
    - (Windows and Linux) The PATH environment variable.

        If neither of these are present than the CMake configure step will fail. Afterwards you can still customize the location of the compiler with `CMAKE_CXX_COMPILER` once the default has been located.

      ```bash
      # configure with Ninja and clang compiler
      cmake -S . -B build-rel/ -G Ninja^
          -DCMAKE_BUILD_TYPE=Release^
          -DCMAKE_CXX_COMPILER="C:/Program Files (x86)/LLVM/bin/  clang-cl.exe"^

      # build with Ninja
      cmake --build build
      ```

- To verify which compiler is being used to build, pass `-v` (`--verbose`) to the `cmake --build <folder>` command.

    ```bash
    cmake --build build -v
    ```

### Use Clang Libraries (LibTooling)

In addition to being able to use Clang to compile, with Clang/LLVM installed, it is possible to build projects making using of `libTooling`. It is possible to use the `libTooling` libraries with MSVC or Clang.

Please refer to [use-llvm-simple/CMakeLists.txt](projects/use-llvm-simple/CMakeLists.txt) for an example of how to setup a project that uses Clang and LLVM as dependencies and the [use-llvm-simple/configure-debug.bat](projects/use-llvm-simple/configure-debug.bat) for how to configure the project.

## include-what-you-use

With the LLVM and Clang libraries installed it's possible to build `include-what-you-use` to analyse C and C++ source files.

Please see [examples/iwyu-build-scripts](examples/iwyu-build-scripts) for commands to build the library.

Once `iwyu` is built, add the location of `include-what-you-use.exe` to your path and then invoke `iwyu_tool.py` in the directory of a `compile_commands.json` file of a project you've already built.

```bash
# analyse includes, write output to file
python C:\path\to\iwyu\iwyu_tool.py -p . > iwyu.out

# apply fixes
python C:\path\to\iwyu\fix_includes.py < iwyu.out --blank_lines --nocomments --reorder
# optional --dry_run
```

Please find more information on `include-what-you-use` [here](https://github.com/include-what-you-use/include-what-you-use/blob/master/README.md).
