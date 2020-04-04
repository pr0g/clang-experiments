#pragma once

#include "DeclVisitor.h"

#include "clang/AST/ASTConsumer.h"
#include "clang/AST/ASTContext.h"
#include "clang/Basic/SourceManager.h"

class DeclFinder : public clang::ASTConsumer {
    DeclVisitor visitor_;
    const clang::SourceManager& sm_;

public:
    DeclFinder(clang::SourceManager& sm) : visitor_(sm), sm_(sm) {}

    void HandleTranslationUnit(clang::ASTContext& context) final {
        auto decls = context.getTranslationUnitDecl()->decls();
        for (const auto& decl : decls) {
            if (decl->getLocation().isValid() &&
                sm_.isInSystemHeader(decl->getLocation())) {
                continue;
            }
            visitor_.TraverseDecl(decl);
        }
    }
};
