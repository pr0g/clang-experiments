#pragma once

#include "clang/AST/RecursiveASTVisitor.h"
#include "clang/Basic/SourceManager.h"
#include "llvm/Support/raw_ostream.h"

#include <sstream>
#include <string>

class DeclVisitor : public clang::RecursiveASTVisitor<DeclVisitor> {
    clang::SourceManager& sourceManager_;

public:
    DeclVisitor(clang::SourceManager& sourceManager)
        : sourceManager_(sourceManager) {}

    bool VisitNamedDecl(clang::NamedDecl* namedDecl) {
        llvm::outs() << "Found " << namedDecl->getQualifiedNameAsString()
                     << " at " << getDeclLocation(namedDecl->getBeginLoc())
                     << "\n";

        return true;
    }

private:
    std::string getDeclLocation(clang::SourceLocation loc) const {
        std::ostringstream oss;
        oss << sourceManager_.getFilename(loc).str() << ":"
            << sourceManager_.getSpellingLineNumber(loc) << ":"
            << sourceManager_.getSpellingColumnNumber(loc);

        return oss.str();
    }
};
