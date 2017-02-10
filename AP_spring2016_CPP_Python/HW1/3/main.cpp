#include "sort.h"
#include "base.h"
#include "sorts.h"
#include "fstream"



sortResult sort(Esort _sort, std::vector<int> _input);
void showResult(sortResult _result);
char* EsortToString(Esort _input);
MySort *selectSort(Esort _sort);

int main()
{
    int userInput{};
    bool halfRestart{},fullRestart{};
    int i{0};
    std::vector<int> numberVec;
    sortResult result;
    

    std::cout << "Welcome, \nPlease inster your First Number" << std::endl
              << "Consider when you insert 0 :" << std::endl
              << "1. Program stop Collecting number" << std::endl
              << "2. sort numbers" << std::endl
              << "3. show you result" << std::endl;
    
    do
    {
        std::cout << " Now Insert Your Numbers : \n";
        do
        {
            std::cin >> userInput;
            numberVec.push_back(userInput);
            i++;
            std::cout << i << " input is inserted. "
                      << "Enter next Numbers" << std::endl;
        } while(userInput);

        do
        {
            std::cout << "Plese select your sorting algorithm :" << std::endl;
            std::cout << "0. Bubble \n1. Merge\n2. Quick\n3. Insertion\n"
		      <<"4. Selection\n5. Shell\n6. Heap\n" ;
            std::cin >> userInput;

            result = sort(static_cast<Esort>(userInput),numberVec);

            showResult(result);

            std::cout << std::endl << "Do You Want Try Another Sort ? \n"
                      << "0. No\n"
                      << "1. Yes\n"
                      << "2. Yes But with New Number!";
            std::cin >> userInput;

            if(userInput > 1)
            {
                fullRestart = true;
                halfRestart = false;
            }
            else if(userInput == 1)
            {
                fullRestart = false;
                halfRestart = true;
            }
            else
            {
                fullRestart = false;
                halfRestart = false;
            }
        } while(halfRestart);

    } while(fullRestart);

}

void showResult(sortResult _result)
{
    std::cout <<"Sort is Done ! \n";

    for(int member : _result.result)
    {
        std::cout << member << std::endl;
    }

    std::cout << "ClockSpent :  " <<_result.time << std::endl
              << "Number that Data : " <<_result.result.size() << std::endl
              << "Algorithm That Used:"
              << EsortToString(_result.algorithm) << std::endl;
}

sortResult sort(Esort _sort,std::vector<int> _input)
{
    MySort* mainSort;
    mainSort = selectSort(_sort);
    mainSort->setAlgorithm(_sort);
    mainSort->setNubmerVec(_input);

    clock_t beginTime = clock();
    mainSort->execute();
    mainSort->setTime(static_cast<int>(clock() - beginTime));

    return mainSort->getResult();
}

MySort* selectSort(Esort _sort)
{    
    MySort *mainSort;

    if(_sort == Esort::EBUBBLE)
    {
    	Bubble *bubbleSort = new Bubble();
        mainSort = bubbleSort;
    }
    else if(_sort == Esort::EMERGE)
    {
    	Merge *mergeSort = new Merge();
        mainSort = mergeSort;
    }
    else if(_sort == Esort::EHEAP)
    {
    	Heap *heapSort = new Heap();
        mainSort = heapSort;
    }
    else if(_sort == Esort::EINSERTION)
    {
    	Insertion *insertionSort = new Insertion();
        mainSort = insertionSort;
    }
    else if(_sort == Esort::EQUICK)
    {
    	Quick *quickSort = new Quick();
        mainSort = quickSort;
    }
    else if(_sort == Esort::ESELECTION)
    {
    	Selection *selectionSort = new Selection();
        mainSort = selectionSort;
    }
    else if(_sort == Esort::ESHELL)
    {
    	Shell *shellSort = new Shell();
        mainSort = shellSort;
    }
    else mainSort = new MySort();

    return mainSort;

}

char* EsortToString(Esort _input)
{
    if(_input == Esort::EBUBBLE)
    {
        return "Bubble";
    }
    if(_input == Esort::EMERGE)
    {
        return "Merge";
    }
    if(_input == Esort::EHEAP)
    {
        return "Heap";
    }
    if(_input == Esort::EINSERTION)
    {
        return "Insertion";
    }
    if(_input == Esort::EQUICK)
    {
        return "Quick";
    }
    if(_input == Esort::ESELECTION)
    {
        return "Selection";
    }
    if(_input == Esort::ESHELL)
    {
        return "Shell";
    }
}

