 #include "movecounter.h"

#include <QFont>

CMoveCounter::CMoveCounter() {
    //Initial Local Variable
    moveCnt = 0;


    //Initial Item
    setPlainText("Moves Count : 0");
    setPos(20, 470);
    setFont(QFont("times", 30, 200));
    setDefaultTextColor(QColor(Qt::darkRed));
}

void CMoveCounter::increse() {
    moveCnt++;
    update();
}

void CMoveCounter::reset() {
    moveCnt = 0;
    update();
}

void CMoveCounter::update() {
    setPlainText(QString("Moves Count: %1").arg(moveCnt));
}
