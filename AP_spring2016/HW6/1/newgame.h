#ifndef CNEWGAME_H
#define CNEWGAME_H

//#include "game.h"
#include <QGraphicsItem>

class CNewGame : public QGraphicsTextItem {

    Q_OBJECT

public:
    CNewGame();
    void mousePressEvent(QGraphicsSceneMouseEvent *event);

signals:
    void sig_start();
};

#endif // CNEWGAME_H
