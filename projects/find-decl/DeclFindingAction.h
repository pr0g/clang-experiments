#pragma once

#include "DeclFinder.h"

#include "clang/Frontend/FrontendAction.h"
#include "clang/Frontend/CompilerInstance.h"

#include <memory>

class DeclFindingAction : public clang::ASTFrontendAction {
public:
    std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(
        clang::CompilerInstance& ci, clang::StringRef) final {
        return std::unique_ptr<clang::ASTConsumer>(
            new DeclFinder(ci.getSourceManager())
        );
    }
};
