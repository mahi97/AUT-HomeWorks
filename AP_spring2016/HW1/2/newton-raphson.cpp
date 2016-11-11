#include "newton-raphson.h"

EquationSolver::EquationSolver()
{
    m_repeatCount = 0;
    i = 0;
    resultVec.result.clear();
}

void EquationSolver::execute()
{
    bool repeated{false};
    if(m_withRange)
    {
        setRange();
        for(double i{range1}; i < range2; i += 0.1)
        {

            newtonRaphson(i);

            if(!multiResultVec.empty())
            {
                repeated = false;
                for(int i{0};i < multiResultVec.size();i++)
                {
                    if(fabs(multiResultVec.at(i).result.back().newInput -
                            resultVec.result.back().newInput ) < 0.1)
                    {
                        repeated = true;
                    }
                }
                if(!repeated)
                {
                    multiResultVec.push_back(resultVec);
                }
            }
            else if(resultVec.result.back().newInput < 100000)
            {
                multiResultVec.push_back(resultVec);
            }
        }
    }

    else
    {
        newtonRaphson(1.00);
    }
}

double EquationSolver::function(double input)
{
    if(m_equationIndex)
    {
        return tan(input) - exp(input);
    }
    else
    {
        return pow(input,3) + pow(input,2) + input + 1;
    }
}

double EquationSolver::Dfunction(double input)
{
    if(m_calcuteDerivative)
    {
        return (function(input + E) - function(input) )/E;
    }
    else
    {
        if(m_equationIndex)
	{
            return pow((1/cos(input)),2) - exp(input);
        }
        else
	{
            return 3*pow(input,2) + 2*pow(input,1) + 1;
        }
    }
}

void EquationSolver::newtonRaphson(double input)
{
    double tempFuncOutput{function(input)};
    double newInput{input - (tempFuncOutput / Dfunction(input))};
    double tempErr{fabs((newInput/input) - 1)};
    SResult tempResult{};


    if(E < tempErr)
    {
        m_repeatCount++;
        fillResult(input, newInput, tempErr,
                   tempFuncOutput, m_repeatCount, tempResult);

        resultVec.result.push_back(tempResult);
        resultVec.lastAnswer = newInput;
        newtonRaphson(newInput);
    }
}

void EquationSolver::fillResult (double _oldInput, double _newInput,
                                 double _err, double _output, int _repeatCnt,
                                 SResult& _resualt)
{
    _resualt.oldInput = _oldInput;
    _resualt.newInput = _newInput;
    _resualt.error = _err;
    _resualt.output = _output;
    _resualt.repeatCount = _repeatCnt;

}

void EquationSolver::setRange()
{
    double userInput{};
    std::cout  << std::endl << "Enter the Min Range" <<std::endl;
    std::cin >> userInput;
    range1 = userInput;
    std::cout  << std::endl << "Enter the Max Range" <<std::endl;
    std::cin >> userInput;
    range2 = userInput;
}

bool EquationSolver::hasMultipleAns(int index)
{
    if(index == 1)
    {
        return true;
    }
    else
    {
        return false;
    }
}


