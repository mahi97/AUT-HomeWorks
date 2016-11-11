#ifndef DECODER
#define DECODER

#include "base.h"

class Decoder {
public:
    Decoder();
    ~Decoder();
    bool getFile(const char* _input);
    void outFile();
    void execute();
private:

    void decode(int _key, VOS _words);
    void shift(std::string& _input,int _key);
    void makeResult(const VOS& _words, int _key);
    void fillWordsVector(const std::ifstream &_file, VOS& _wordsVec );
    std::string drawLine();

    std::string m_resultString;
    std::ifstream m_inputFile;
    std::ofstream m_outputFile;
    std::vector<std::string> m_resultWords;

};

#endif // DECODER

