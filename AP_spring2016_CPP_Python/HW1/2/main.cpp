#include"newton-raphson.h"

#define SPACE 17

void showHeader();
void showResult(SResultVector SResultVector);
void showOption(EquationSolver* solver);
void showFullResult(EquationSolver* solver);
void showSummery(SResultVector results, int number);

int main()
{

    int userInput{};
    EquationSolver* solver = new EquationSolver();

    std::cout <<"WelCome to Newton-raphson Equation Solving . "  << std::endl
              <<"Choose equation that you want to get solved"    << std::endl
              <<"0. (x^3) + (X^2) + (X) + 1\n1. tan(X) - exp(X)" << std::endl;

    std::cin >> userInput;
    solver->setEquationIndex(userInput);

    std::cout <<"Now, PLease select the way you want"
	      << " the Derivative to be calculate" << std::endl
              <<"0.Use a static function that equals Derivative of Equation"
	      << std::endl
              <<"1.Use Derivative definition to find the Derivative"
	      << std::endl;

    std::cin >> userInput;

    solver->setCalcuteDerivative(userInput);

    if(solver->hasMultipleAns(solver->getEquationIndex()))
    {
        showOption(solver);
    }

    solver->execute();
    if(solver->getWithRange())
    {
        showFullResult(solver);
    }
    else
    {
        showResult(solver->resultVec);
    }

    return 0;

}

void showResult(SResultVector resultVector)
{
    showHeader();

    for(SResult member : resultVector.result)
    {

        std::cout << member.repeatCount << std::setw(SPACE);
        std::cout.precision(5);
        std::cout << std::fixed << member.oldInput    << std::setw(SPACE);
        std::cout.precision(5);
        std::cout << std::fixed << member.newInput    << std::setw(SPACE);
        std::cout.precision(5);
        std::cout << std::fixed << member.error       << std::setw(SPACE);
        std::cout.precision(5);
        std::cout << std::fixed << member.output << std::endl;
    }

    std::cout << std::endl << "The answer is :    "
	      << resultVector.lastAnswer << std::endl << std::endl;
}


void showHeader()
{
    std::cout << "Time" << std::setw(SPACE - 6)
              << "OldI" << std::setw(SPACE)
              << "NewI" << std::setw(SPACE)
              << "Erro" << std::setw(SPACE)
              << "OutP" << std::endl;
}

void showOption(EquationSolver* solver)
{
    int userInput{};
    if(solver->getEquationIndex())
    {
        std::cout << "This Equation have infinite answer."
                  << std::endl << "You should set the range that you want "
                  << "aswers founds in or you just want one of the aswers "
                  << "no matter what." << std::endl;
        std::cout << "0. No Matter Waht" << std::endl
                  << "1. I wanna specify the range" << std::endl;

    }
    std::cin >> userInput;
    solver->setWithRange(userInput);
}

void showSummery(SResultVector results, int number)
{
    std::cout << "Asnwer " << number <<". " << results.lastAnswer
              << std::endl;
}

void showFullResult(EquationSolver* solver)
{
    int i{0};
    for(SResultVector results: solver->multiResultVec)
    {
        showResult(results);
    }
    // show Summery Header
    std::cout << "Summery Results :" <<std::endl;
    for(SResultVector results: solver->multiResultVec)
    {
        showSummery(results, i);
        i++;
    }
}
