cmake_minimum_required(VERSION 3.13)
project(test LANGUAGES CXX)

find_package(LLVM REQUIRED CONFIG)
find_package(Clang REQUIRED CONFIG)

llvm_map_components_to_libnames(llvm_libs all)

add_executable(${PROJECT_NAME} main.cpp)

target_link_libraries(
    ${PROJECT_NAME} PRIVATE ${llvm_libs} clangTooling libclang)
target_include_directories(
    ${PROJECT_NAME} PRIVATE ${LLVM_INCLUDE_DIRS})
target_compile_definitions(
    ${PROJECT_NAME} PRIVATE ${LLVM_DEFINITIONS})
