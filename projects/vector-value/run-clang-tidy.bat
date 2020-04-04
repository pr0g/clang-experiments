@echo off

REM find all .h and .cpp files and run clang-tidy on them
fd -e cpp -e h -0 | xargs -0 clang-tidy -p build-deb\ -fix --format-style=file
