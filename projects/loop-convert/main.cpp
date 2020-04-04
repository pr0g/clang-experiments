#include <memory>

#include "clang/AST/Stmt.h"
#include "clang/ASTMatchers/ASTMatchFinder.h"
#include "clang/ASTMatchers/ASTMatchers.h"
#include "clang/ASTMatchers/ASTMatchersInternal.h"
#include "clang/Tooling/CommonOptionsParser.h"
#include "clang/Tooling/Tooling.h"
#include "llvm/ADT/ArrayRef.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/Support/CommandLine.h"

using clang::ForStmt;
using clang::ast_matchers::declStmt;
using clang::ast_matchers::equals;
using clang::ast_matchers::forStmt;
using clang::ast_matchers::hasInitializer;
using clang::ast_matchers::hasLoopInit;
using clang::ast_matchers::hasSingleDecl;
using clang::ast_matchers::integerLiteral;
using clang::ast_matchers::MatchFinder;
using clang::ast_matchers::StatementMatcher;
using clang::ast_matchers::varDecl;

static llvm::cl::OptionCategory MyToolCategory("my-tool options");

StatementMatcher LoopMatcher =
    forStmt(hasLoopInit(declStmt(hasSingleDecl(
                varDecl(hasInitializer(integerLiteral(equals(0))))))))
        .bind("forLoop");

class LoopPrinter : public MatchFinder::MatchCallback {
public:
    void run(const MatchFinder::MatchResult& result) override {
        if (const auto* fs = result.Nodes.getNodeAs<ForStmt>("forLoop")) {
            fs->dump();
        }
    }
};

int main(int argc, const char** argv) {
    clang::tooling::CommonOptionsParser optionsParser(
        argc, argv, MyToolCategory);
    clang::tooling::ClangTool tool(
        optionsParser.getCompilations(), optionsParser.getSourcePathList());

    LoopPrinter printer;
    MatchFinder finder;
    finder.addMatcher(LoopMatcher, &printer);

    return tool.run(clang::tooling::newFrontendActionFactory(&finder).get());
}
