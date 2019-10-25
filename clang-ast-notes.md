# clang ast notes

## Types

- Stmt (statement)
  - examples: if
- Decl (declaration)
  - examples: class, variable, function, enum, values, names,fields, variables
- Expr (expression)
  - derives from statement
- Type (types)
  - type declaration
  - qual type - includes const and volatile specifiers

## Clang Tooling

- libClang (c interface)
  - stable api
- libTooling

### libClang

- cursors - a pointer to a node
- no base class for all types of nodes (no AST node)
- in C++ visitation class is used
- has built in code completion
  - codeCompleteAt (insert a special marker in the AST)
- has a pythonAPI
- very high level
- usually easier to achieve things with libClang

### libTooling

- c++ library
- more powerful
  - clang tidy
    - could add a new plugin to clang-tidy
  - clang plugin
    - dynamic libraries that you build and link into clang when you run it
    - could put it into your build tool, check for linter errorsetc
  - clang tool
    - standalone executable with clang as a library
    - has a main function
    - more power

## Info

- AST Dump - dump out whole AST

## Demo/Example

- Create an index (CIIndex) - a structure that will manage all your translation units for you



## Progress - https://youtu.be/E6i8jmiy8MY?t=1562
