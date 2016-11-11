#ifndef GAME
#define GAME

#include <QGraphicsView>
#include <QMediaPlayer>

#include "timepassed.h"
#include "movecounter.h"
#include "newgame.h"
#include "exittext.h"

struct SPos {
    void set(int _x, int _y) {
        x = _x;
        y = _y;
    }
    int x;
    int y;
};

class CGame : public QGraphicsView {

    Q_OBJECT

public:

    CGame();
    virtual ~CGame();

    void keyPressEvent(QKeyEvent *event);

    CTimeCounter        * p_time;
    CExitText           * p_exitText;
    QGraphicsPixmapItem * p_logo;
    CNewGame            * p_newGame;

private:

    void keyReleaseEvent(QKeyEvent *event);

    //Mess Up Puzzle
    void messUp();

    //Move Squares Functions
    void moveUp   ();
    void moveDown ();
    void moveLeft ();
    void moveRight();

    //initial Objects
    void initView();
    void initSquares();



    QImage            * p_mainImg;
    QMediaPlayer      * p_mainPlayer;
    QMediaPlayer      * p_backgroundPLayer;
    CMoveCounter      * p_moves;
    QGraphicsScene    * p_scene;
    QGraphicsRectItem * p_squaresArr[4][4];
    QGraphicsRectItem * p_fullImage;
    QGraphicsTextItem * p_hint;

    SPos   m_nullPosition;
    QBrush m_nullBrush;

    bool showFlag;

public slots:
    void slt_startGame();
    void slt_exit();
};

#endif // GAME

