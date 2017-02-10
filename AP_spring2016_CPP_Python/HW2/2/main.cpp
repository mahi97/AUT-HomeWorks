#include "decoder.h"


int main () {

    Decoder decoder;
    if(decoder.getFile("statement-coded.txt")) {
        decoder.execute();
        decoder.outFile();
    }
    return 0;
}
