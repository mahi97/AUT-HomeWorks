#include "exittext.h"

#include <QDebug>
#include <QApplication>
#include <QGraphicsSceneEvent>
#include <QFont>
#include <QTimer>

CExitText::CExitText() {
    setPlainText("Exit");
    setFont(QFont("times", 50, 200));
    setDefaultTextColor(QColor(Qt::white));
    setPos(160,400);
}

void CExitText::mousePressEvent(QGraphicsSceneMouseEvent *event) {
    if(event->button() == Qt::LeftButton) {
        qDebug() << " Exit Button Clicked";
        emit sig_exit();
        QApplication::exit(0);
    }
}

void CExitText::move() {
     QTimer *timer = new QTimer(this);
     connect(timer, SIGNAL(timeout()), this, SLOT(go()));
     timer->start(1);
}

void CExitText::go() {
    if(x() < 300)
        setPos(x() + 4, y());
    else if(y() < 530)
        setPos(x(), y() + 6);
}
