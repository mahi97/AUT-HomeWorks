#include "decoder.h"

Decoder::Decoder() {

}

Decoder::~Decoder() {

}

bool Decoder::getFile(const char* _input) {
    m_inputFile.open(_input);

    if(m_inputFile.is_open()) {
        std::cout << "File Opened Succesfully!" << std::endl;
        return true;
    }
    std::cout << "Oops ! File Doesn't Found." << std::endl;
    return false;
}

void Decoder::outFile() {
    std::ofstream out("output.txt");
    out << m_resultString;
    out.close();
}

void Decoder::execute() {

    std::vector<std::string> tempWordVec;
    fillWordsVector(m_inputFile, tempWordVec);
    for(int i{1}; i < 26;i++) {
        decode(i, tempWordVec);
        std::cout << "Decoded By " << i << " is Done!"<< std::endl;
    }
    std::cout << m_resultString << std::endl;

}

void Decoder::decode(int _key, VOS _words) {
    for(int j{};j < _words.size();j++)
        shift(_words[j],_key);
    makeResult(_words, _key);

}

void Decoder::shift(std::string &_input, int _key) {
    for(int i{};i < _input.length();i++) {
        if(isalpha(_input[i])) {
            if((islower(_input[i]) && _input[i] + _key > 'z')
                    || (isupper(_input[i]) && _input[i] + _key > 'Z')) {
                _input[i] -= 26;
            }
            _input[i] += _key;
        }
    }
}

void Decoder::fillWordsVector(const std::ifstream &_file, VOS& _wordsVec ) {
    std::string tempString;
    _wordsVec.clear();
    while(m_inputFile >> tempString)
        _wordsVec.push_back(tempString);
}

void Decoder::makeResult(const VOS&_words, int _key) {
    std::string tempStr;
    char string[20];
    sprintf(string,"Decoded By : %d \n\n",_key);

    for(int i{};i < _words.size();i++) {
        tempStr += _words[i] + " ";
    }
    m_resultString += string;
    m_resultString += tempStr + "\n";
    m_resultString += drawLine();
}

std::string Decoder::drawLine()
{
    std::string tempStr;
    int i{};
    while(i <  15) {
        tempStr += '_';
        i++;
    }
    tempStr += "\n";
    return tempStr;
}
