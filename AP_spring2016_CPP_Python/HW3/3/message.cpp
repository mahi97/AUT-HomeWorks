#include "message.h"


// Operators For CMessage Comparision
bool CMessage::operator <(const CMessage& _toCompare) const {
    return this->ptext->length() < _toCompare.ptext->length();
}

bool CMessage::operator==(const CMessage& _toCompare) const {
    return this->ptext->length() == _toCompare.ptext->length();
}
// Operators For const char* Comparision
bool CMessage::operator <(const char*& _toCompare) const {
    return this->ptext->length() < strlen(_toCompare);
}

bool CMessage::operator==(const char*& _toCompare) const {
    return this->ptext->length() == strlen(_toCompare);
}



