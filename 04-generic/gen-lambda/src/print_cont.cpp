#include <iostream>
#include <vector>
#include <string>
#include <algorithm>

template <typename C>
void print(const C &c) {
  std::for_each(begin(c), end(c), 
    [](decltype(*begin(c)) x) {
      std::cout << x << " ";
    }
  );
  std::cout << "\n";
}

int main() {
  using namespace std;
  vector<int> v {1, 2, 3, 4};
  vector<string> w {
      "Daniel", "Carlos", "Maria"
  };

  print(v);
  print(w);
  
  return 0;
}
