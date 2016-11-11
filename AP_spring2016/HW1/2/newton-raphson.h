#ifndef NEWTONRAPHSON
#define NEWTONRAPHSON

#include "base.h"

#define E 0.000001

class EquationSolver
{
public:
    EquationSolver();
    void execute();
    bool hasMultipleAns(int index);

    SResultVector resultVec{};
    std::vector<SResultVector> multiResultVec{};
private:




    double function(double input);
    double Dfunction(double input);
    void newtonRaphson(double input);
    void setRange();

    void fillResult (double _oldInput, double _newInput,
                     double _err, double _output, int _repeatCnt,
                     SResult& _resualt);
    int i{};
    double range1{},range2{};

    PROPERTY(int , equationIndex, EquationIndex)
    PROPERTY(bool, calcuteDerivative, CalcuteDerivative)
    PROPERTY(int , repeatCount, RepeatCount)
    PROPERTY(int , withRange , WithRange)
};



#endif // NEWTONRAPHSON

