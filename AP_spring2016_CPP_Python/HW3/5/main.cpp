#include <algorithm>
#include <string>
#include <iostream>
#include <fstream>

int main()
{

    std::string str{};
    unsigned int counter{};
    std::cout  << "Please Insert your String!" << std::endl;
    std::cin >> str;

    std::ofstream output{"output.txt"};
    output.clear();

    std::sort(str.begin(), str.end());

    do {
        counter++;
        std::cout << counter << ". " << str << '\n';
        output    << counter << ". " << str << '\n';
    } while(std::next_permutation(str.begin(), str.end()));

    std::cout << "\n" << counter << " Diffrent Permutation" << std::endl;
    output    << "\n" << counter << " Diffrent Permutation" << std::endl;

    output.close();
}
