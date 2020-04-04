#pragma once

#include "DeclFinder.h"

#include "clang/Frontend/CompilerInstance.h"
#include "clang/Frontend/FrontendAction.h"

#include <memory>

class DeclFindingAction : public clang::ASTFrontendAction {
public:
    std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(
        clang::CompilerInstance& ci, clang::StringRef /*InFile*/) final {
        return std::unique_ptr<clang::ASTConsumer>(
            new DeclFinder(ci.getSourceManager()));
    }
};
