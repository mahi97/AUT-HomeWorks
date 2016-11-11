#include <iostream>
#include <iomanip>

#define UPPERCASE_START 65
#define LOWERCASE_START 97

void showUpperCase(int _conter, int _distance);
void showLowerCase(int _conter, int _distance);
void showAbbr(int _distance);
void showLine(int _distance);


int main()
{
    int distanceChar{};
    char tryAgain{};
    bool doAgain{false};

    std::cout << "Welcome, kindly read this abbvreviations before start!"
	      << std::endl
              << "BIG - UpperCaseChar"    << std::endl
              << "DEC - UpperCaseDeciaml" << std::endl
              << "HEX - UpperCaseHex"     << std::endl
              << "SML - LowerCaseChar"    << std::endl
              << "DEC - LowerCaseDecimal" << std::endl
              << "HEX - LowerCaseHex"     << std::endl;

    do
    {
    	std::cout << "Enter distance that you want between columns (unit : char)"
		<< std::endl
		<< "(10 is recommanded, min : 4, max : 15)" << std::endl;
      	std::cin >> distanceChar;
        std::cout << std::endl;

      	if     (distanceChar  <  4) distanceChar =  4;
      	else if(distanceChar  > 15) distanceChar = 15;

      	showAbbr(distanceChar);
        showLine(distanceChar);
      
      	for(int i = 0; i < 26; i++) 
      	{
		    	showUpperCase(i, distanceChar);
		    	showLowerCase(i, distanceChar);
         showLine(distanceChar);
      	}
        
        showAbbr(distanceChar);
      
      	std::cout << "Do you want try another size (y/n)?" << std::endl;
      	std::cin >> tryAgain;
      	doAgain = (tryAgain == 'y' || tryAgain == 'Y');

    }while(doAgain);
    return 0;
}

void showUpperCase(int _counter,int _distance) 
{
  int upperCase{};
  upperCase = _counter + UPPERCASE_START;
  std::cout << static_cast<char>(upperCase)
	    << std::setw(_distance + 1)
	    << std::dec << upperCase << std::setw(_distance)
	    << std::hex << upperCase << std::setw(_distance - 1);
  
}

void showLowerCase(int _counter, int _distance) 
{
  int lowerCase{};
  lowerCase = _counter + LOWERCASE_START;
  std::cout << static_cast<char>(lowerCase)
	    << ((lowerCase < 100) ? std::setw(_distance + 1)
		                  : std::setw(_distance + 2))
	    << std::dec << lowerCase
	    << ((lowerCase < 100) ? std::setw(_distance)
	                          : std::setw(_distance - 1))
	    << std::hex << lowerCase << std::endl;
	
}

void showAbbr(int _distance) 
{
  std::cout  << "UCC" << std::setw(_distance)
	    << "UCD" << std::setw(_distance)
	    << "UCH" << std::setw(_distance)
	    << "LCC" << std::setw(_distance)
	    << "LCD" << std::setw(_distance)
	    << "LCH" <<std::endl;
}

void showLine(int _distance) 
{
  int i{0};
  while(i < (_distance * 5) + 5) {
    std::cout << '_';
    i++;
  }
  std::cout << std::endl << std::endl;
}
