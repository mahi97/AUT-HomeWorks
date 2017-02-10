#ifndef CMESSAGE_H
#define CMESSAGE_H

#include <iostream>
#include <string>
#include <cstring>

class CMessage {
private:
    std::string* ptext; // Pointer to object text string
public:
    // Function to display a message
    void show() const {
        std::cout << "Message is: " << *ptext << std::endl;
    }

    // Constructor
    CMessage(const char* text = "No message")
    {
        ptext = new std::string(text); // Allocate space for text
    }
    // Destructor
    ~CMessage()
    {
        delete ptext;
    }

    // Comparision Operations 
    bool operator==(const CMessage& _toCompare) const;
    bool operator <(const CMessage& _toCompare) const;
    bool operator <(const char*& _toCompare) const;
    bool operator==(const char*& _toCompare) const;

};



#endif // CMESSAGE_H
