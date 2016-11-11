#include "timepassed.h"

#include <QFont>
#include <QTimer>

CTimeCounter::CTimeCounter() {

    QTimer * timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(increse()));
    timer->start(1000);

    //intial local Variable
    time = 0;

    //intial Item
    setPlainText("Time Passed : 0");
    setPos(20, 420);
    setFont(QFont("times", 30, 200));
    setDefaultTextColor(QColor(Qt::darkRed));
}

void CTimeCounter::resetTime() {
    time = 0;
}

void CTimeCounter::increse() {
    time++;
    setPlainText(QString("Time Passed : %1").arg(time));
}
