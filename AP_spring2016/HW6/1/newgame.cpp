#include "newgame.h"

#include <QGraphicsSceneEvent>
#include <QDebug>
#include <QFont>

CNewGame::CNewGame() : QGraphicsTextItem() {
    setPlainText("New Game");
    setFont(QFont("times", 50, 200));
    setDefaultTextColor(QColor(Qt::white));
    setPos(90,300);
}

void CNewGame::mousePressEvent(QGraphicsSceneMouseEvent *event) {
    if(event->button() == Qt::LeftButton) {
        qDebug() << " New Game Clicked";
        emit sig_start();
    }
}
