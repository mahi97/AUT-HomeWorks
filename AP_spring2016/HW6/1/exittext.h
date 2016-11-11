#ifndef CEXITTEXT_H
#define CEXITTEXT_H

#include <QGraphicsItem>

class CExitText : public QGraphicsTextItem {

    Q_OBJECT

public:    
    CExitText();
    void mousePressEvent(QGraphicsSceneMouseEvent *event);
    void move();
signals:
    void sig_exit();
public slots:
    void go();

};

#endif // CEXITTEXT_H
