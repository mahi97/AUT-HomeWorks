#ifndef BASE_H
#define BASE_H

#include<math.h>
#include<iostream>
#include<vector>
#include<iomanip>

#define PROPERTY(type, name, label) \
private : type m_##name{};				     \
public  :const type& get##label() const { return m_##name; } \
public  :void set##label(const type& v) { m_##name = v; }

struct SResult {
  int repeatCount{0};
  double oldInput{0};
  double newInput{0};
  double error{0};
  double output{0};
};

struct SResultVector {
  std::vector<SResult> result{};
  double lastAnswer {0};
};


#endif // BASE_H

