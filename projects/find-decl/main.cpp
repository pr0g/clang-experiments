#include <memory>

#include "DeclFindingAction.h"
#include "clang/Tooling/CommonOptionsParser.h"
#include "clang/Tooling/Tooling.h"
#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/Support/CommandLine.h"

// reference
// https://xinhuang.github.io/posts/2014-10-19-clang-tutorial-finding-declarations.html

static llvm::cl::extrahelp CommonHelp(
    clang::tooling::CommonOptionsParser::HelpMessage);
llvm::cl::OptionCategory FindDeclCategory("find-decl options");

static char FindDeclUsage[] = "find-decl <source file>";

int main(int argc, const char** argv) {
    clang::tooling::CommonOptionsParser option(
        argc, argv, FindDeclCategory, FindDeclUsage);

    auto files = option.getSourcePathList();
    clang::tooling::ClangTool tool(option.getCompilations(), files);

    return tool.run(clang::tooling::newFrontendActionFactory<DeclFindingAction>().get());
}
