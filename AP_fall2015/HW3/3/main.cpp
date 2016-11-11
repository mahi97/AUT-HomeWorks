#include "message.h"


// Template ProtoTypes For Operators
template<typename T1, typename T2>
bool operator!=(T1& _first, T2& _second);
template<typename T1, typename T2>
bool operator>=(T1& _first, T2& _second);
template<typename T1, typename T2>
bool operator<=(T1& _first, T2& _second);
template<typename T1, typename T2>
bool operator >(T1& _first, T2& _second);

// Function for Showing Char*
void show(const char* _toShow);
 
int main() {

    CMessage msg;
    const char* first  = new char[20];
    const char* second = new char[5];
    std::string s = "Test Message";
    first = s.c_str();

    std::cout << "msg :\n";
    msg.show();
    std::cout << "first :\n";
    show(first);
    std::cout << "second :\n";
    show(second);


    //Compare first to msg
    if(msg  > first) std::cout << "msg is Greater that first" << std::endl;
    if(msg  < first) std::cout << "msg is Smaller that first" << std::endl;
    if(msg == first) std::cout << "msg Equals first"          << std::endl;
    if(msg <= first) std::cout << "msg is Small-Equal first"  << std::endl;
    if(msg >= first) std::cout << "msg is Great-Equal first"  << std::endl;
    if(msg != first) std::cout << "msg isn't Equal first"     << std::endl;

    std::cout << "---------------------------------" << std::endl;

    //Compare second to msg
    if(msg  > second) std::cout << "msg is Greater that second" << std::endl;
    if(msg  < second) std::cout << "msg is Smaller that second" << std::endl;
    if(msg == second) std::cout << "msg Equals second"          << std::endl;
    if(msg <= second) std::cout << "msg is Small-Equal second"  << std::endl;
    if(msg >= second) std::cout << "msg is Great-Equal second"  << std::endl;
    if(msg != second) std::cout << "msg isn't Equal second"     << std::endl;

    std::cout << "---------------------------------" << std::endl;

    //Compare msg to msg
    if(msg  > msg) std::cout << "msg is Greater that msg" << std::endl;
    if(msg  < msg) std::cout << "msg is Smaller that msg" << std::endl;
    if(msg == msg) std::cout << "msg Equals msg"          << std::endl;
    if(msg <= msg) std::cout << "msg is Small-Equal msg"  << std::endl;
    if(msg >= msg) std::cout << "msg is Great-Equal msg"  << std::endl;
    if(msg != msg) std::cout << "msg isn't Equal msg"     << std::endl;

    std::cout << std::endl;

    return 0;

}

template<typename T1, typename T2>
bool operator!=(T1& _first, T2& _second) {
    return !(_first == _second);
}

template<typename T1, typename T2>
bool operator<=(T1& _first, T2& _second) {
    return (_first == _second) || (_first < _second);
}

template<typename T1, typename T2>
bool operator>=(T1& _first, T2& _second) {
    return (_first == _second) || !(_first < _second);
}

template<typename T1, typename T2>
bool operator >(T1& _first, T2& _second) {
    return !(_first < _second) && !(_first == _second);
}


void show(const char *_toShow) {
    std::cout << "Message is : " << _toShow << std::endl;
}
