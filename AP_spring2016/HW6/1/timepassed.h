#ifndef TIMEPASSED_H
#define TIMEPASSED_H

#include <QGraphicsItem>

class CTimeCounter : public QGraphicsTextItem{

    Q_OBJECT

public:
    CTimeCounter();
    void resetTime();
public slots:
    void increse();
private:
    int time;
};

#endif // TIMEPASSED_H

