#include <vector>

void foo(std::vector<int> is);
void bar(const std::vector<int> is);
void foobar(const std::vector<int>& cis);
void fooboo(std::vector<int>& cis);
