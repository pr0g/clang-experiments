#include "clang/Frontend/FrontendActions.h"
#include "clang/Frontend/FrontendPluginRegistry.h"
#include "clang/Frontend/TextDiagnosticPrinter.h"
#include "clang/Rewrite/Core/Rewriter.h"
#include "clang/Tooling/CommonOptionsParser.h"
#include "clang/Tooling/Tooling.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Signals.h"

#include "clang/ASTMatchers/ASTMatchFinder.h"
#include "clang/ASTMatchers/ASTMatchers.h"

using clang::ast_matchers::decl;
using clang::ast_matchers::DeclarationMatcher;
using clang::ast_matchers::functionDecl;
using clang::ast_matchers::hasAnyParameter;
using clang::ast_matchers::hasType;
using clang::ast_matchers::matchesName;
using clang::ast_matchers::recordDecl;

static const char* const FunctionId = "function-id";
DeclarationMatcher declMatcher = functionDecl(
    decl().bind(FunctionId),
    hasAnyParameter(hasType(recordDecl(matchesName("std::vector")))));

class VecCallback : public clang::ast_matchers::MatchFinder::MatchCallback {
public:
    virtual void run(
        const clang::ast_matchers::MatchFinder::MatchResult& result) final {
        llvm::outs() << ".";
        if (const auto func =
                result.Nodes.getNodeAs<clang::FunctionDecl>(FunctionId)) {
            const auto& sm = *result.SourceManager;
            const auto& loc = func->getLocation();
            llvm::outs() << sm.getFilename(loc) << ":"
                         << sm.getSpellingLineNumber(loc) << ":"
                         << sm.getSpellingColumnNumber(loc) << "\n";
        }
    }
};

static llvm::cl::OptionCategory FindVecCategory("find-vec options");

int main(int argc, const char** argv) {
    llvm::sys::PrintStackTraceOnErrorSignal(argv[0]);
    clang::tooling::CommonOptionsParser options(argc, argv, FindVecCategory);
    clang::tooling::ClangTool tool(
        options.getCompilations(), options.getSourcePathList());

    VecCallback vecCallback;
    clang::ast_matchers::MatchFinder finder;
    finder.addMatcher(declMatcher, &vecCallback);

    return tool.run(clang::tooling::newFrontendActionFactory(&finder).get());
}
