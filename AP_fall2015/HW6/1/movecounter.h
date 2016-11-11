#ifndef CMOVECOUNTER_H
#define CMOVECOUNTER_H

#include <QGraphicsItem>

class CMoveCounter : public QGraphicsTextItem
{
public:
    CMoveCounter();
    void increse();
    void reset();
private:
    void update();
    int moveCnt;

};

#endif // CMOVECOUNTER_H
