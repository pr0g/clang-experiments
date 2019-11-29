#include <iostream>

#include <clang-c/Index.h>

#include <llvm/Support/CommandLine.h>

#include <clang/Tooling/CommonOptionsParser.h>
#include <clang/Tooling/CompilationDatabase.h>

int main(int argc, char** argv)
{
    llvm::cl::OptionCategory cppOptionCategories{"cpp-options"};

    llvm::cl::HideUnrelatedOptions(cppOptionCategories);
    llvm::cl::ParseCommandLineOptions(argc, argv);

    CXIndex index = clang_createIndex(
        /*excludeDeclarationsFromPCH=*/ true,
        /*displayDiagnostics=*/true);
    (void)index;

    std::cout << "hello, world!\n";
    return 0;
}
