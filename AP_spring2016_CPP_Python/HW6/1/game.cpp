#include "game.h"

#include <QGraphicsScene>
#include <QKeyEvent>


CGame::CGame() : QGraphicsView() {

    srand(time(0));
    //initialize Scene
    p_scene = new QGraphicsScene();
    p_scene->setSceneRect(0 , 0, 400, 600);

    //initialize View
    initView();

    //initialize Logo
    p_logo = new QGraphicsPixmapItem();
    p_logo->setPixmap(QPixmap(":/images/images/logo.png"));
    p_logo->setPos(50, 50);

    //initialize New Game Item
    p_newGame = new CNewGame();

    //initialize Exit item
    p_exitText = new CExitText();

    //Add Items to Scene
    p_scene->addItem(p_logo);
    p_scene->addItem(p_newGame);
    p_scene->addItem(p_exitText);

    //Set Variables Intial Values
    m_nullBrush = QBrush();
    showFlag = true;

    //Just Construct
    p_backgroundPLayer = new QMediaPlayer();
    p_mainImg          = new QImage();
    p_fullImage        = new QGraphicsRectItem();
    p_mainPlayer       = new QMediaPlayer();
    p_time             = new CTimeCounter();
    p_moves            = new CMoveCounter();
    p_hint             = new QGraphicsTextItem();
    
    
    
    qDebug() << "Game Constructed";
    connect(p_newGame , SIGNAL(sig_start()), this, SLOT(slt_startGame()));
    connect(p_exitText, SIGNAL(sig_exit()) , this, SLOT(slt_exit()));
}

CGame::~CGame() {

    delete p_time;
    delete p_mainImg;
    delete p_mainPlayer;
    delete p_backgroundPLayer;
    delete p_moves;
    delete p_fullImage;

    qDebug() << "Game destructed";
}

void CGame::slt_startGame() {

    p_time->resetTime();

    //remove All Current Item in the Scene except Exit
    for(size_t i  = 1; i < p_scene->items().size(); i++) {
        p_scene->removeItem(p_scene->items().at(i));
    }
    delete p_newGame;
    delete p_logo;
    p_exitText->move();

    //Play BackGround Music
    p_backgroundPLayer->setMedia(QUrl("qrc:/sounds/sounds/m.mp3"));
    p_backgroundPLayer->play();
    //Initial MainImg
    p_mainImg->load(":/images/images/pic.jpg");
    //Initial Full Images GRectItem
    p_fullImage->setRect(0, 0, 400, 400);
    p_fullImage->setBrush(p_mainImg->copy());
    //Initial Squares
    initSquares();
    //Init Hint Text
    p_hint->setPlainText("Hint : Press Space");
    p_hint->setPos(50, 550);
    p_hint->setFont(QFont("times", 25, 150));
    p_hint->setDefaultTextColor(QColor(Qt::red));

    //Add Items To Scene
    p_scene->addItem(p_time);
    p_scene->addItem(p_moves);
    p_scene->addItem(p_hint);
    for(size_t i = 0; i < 4; i++)
        for(size_t j = 0;j < 4;j++)
            p_scene->addItem(p_squaresArr[i][j]);

    //Mess Up Puzzle
    messUp();

    //Start Count Move
    p_moves->reset();
    
}

void CGame::slt_exit() {
    delete this;
}

void CGame::keyPressEvent(QKeyEvent *event) {
    if(event->key() == Qt::Key_Left) {
        qDebug() << "Left Key Pressed";
        moveLeft();
    }
    if(event->key() == Qt::Key_Right) {
        qDebug() << "Right Key Pressed";
        moveRight();
    }
    if(event->key() == Qt::Key_Up) {
        qDebug() << "Up Key Pressed";
        moveUp();
    }
    if(event->key() == Qt::Key_Down) {
        qDebug() << "Down Key Pressed";
        moveDown();
    }
    if(event->key() == Qt::Key_Space) {
        if(showFlag) {
            qDebug() << "Space key Hold";
            p_scene->addItem(p_fullImage);
            showFlag = false;
        }
    }

}

void CGame::keyReleaseEvent(QKeyEvent *event) {
    if(event->key() == Qt::Key_Space) {
        qDebug() << "Space Key Released";
        p_scene->removeItem(p_scene->items().first());
        showFlag = true;
    }
}

void CGame::moveRight() {
    if(m_nullPosition.x < 3) {
        p_moves->increse();
        p_mainPlayer->setMedia(QUrl("qrc:/sounds/sounds/step.wav"));
        p_mainPlayer->play();
        p_squaresArr[m_nullPosition.x][m_nullPosition.y]->setBrush(p_squaresArr[m_nullPosition.x + 1][m_nullPosition.y]->brush());
        p_squaresArr[m_nullPosition.x + 1][m_nullPosition.y]->setBrush(m_nullBrush);
        m_nullPosition.x++;
    }
    else {
        p_mainPlayer->setMedia(QUrl("qrc:/sounds/sounds/ball.wav"));
        p_mainPlayer->play();
    }
}

void CGame::moveLeft() {
    if(m_nullPosition.x > 0) {
        p_moves->increse();
        p_mainPlayer->setMedia(QUrl("qrc:/sounds/sounds/step.wav"));
        p_mainPlayer->play();
        p_squaresArr[m_nullPosition.x][m_nullPosition.y]->setBrush(p_squaresArr[m_nullPosition.x - 1][m_nullPosition.y]->brush());
        p_squaresArr[m_nullPosition.x - 1][m_nullPosition.y]->setBrush(m_nullBrush);
        m_nullPosition.x--;
    }
    else {
        p_mainPlayer->setMedia(QUrl("qrc:/sounds/sounds/ball.wav"));
        p_mainPlayer->play();
    }
}

void CGame::moveDown() {
    if(m_nullPosition.y < 3) {
        p_moves->increse();
        p_mainPlayer->setMedia(QUrl("qrc:/sounds/sounds/step.wav"));
        p_mainPlayer->play();
        p_squaresArr[m_nullPosition.x][m_nullPosition.y]->setBrush(p_squaresArr[m_nullPosition.x][m_nullPosition.y + 1]->brush());
        p_squaresArr[m_nullPosition.x][m_nullPosition.y + 1]->setBrush(m_nullBrush);
        m_nullPosition.y++;
    }
    else {
        p_mainPlayer->setMedia(QUrl("qrc:/sounds/sounds/ball.wav"));
        p_mainPlayer->play();
    }
}

void CGame::moveUp() {
    if(m_nullPosition.y > 0) {
        p_moves->increse();
        p_mainPlayer->setMedia(QUrl("qrc:/sounds/sounds/step.wav"));
        p_mainPlayer->play();
        p_squaresArr[m_nullPosition.x][m_nullPosition.y]->setBrush(p_squaresArr[m_nullPosition.x][m_nullPosition.y - 1]->brush());
        p_squaresArr[m_nullPosition.x][m_nullPosition.y - 1]->setBrush(m_nullBrush);
        m_nullPosition.y--;
    }
    else {
        p_mainPlayer->setMedia(QUrl("qrc:/sounds/sounds/ball.wav"));
        p_mainPlayer->play();
    }
}

void CGame::messUp() {
    for(size_t i = 0; i < 300; i++) {
        switch (rand()%4) {
        case 0:
            moveDown();
            break;
        case 1:
            moveUp();
            break;
        case 2:
            moveLeft();
            break;
        case 3:
            moveRight();
            break;

        }
    }
}

void CGame::initView() {
    setScene(p_scene);
    setBackgroundBrush(QBrush(QImage(":/images/images/back.jpg")));
    setFixedSize(400, 600);
    setHorizontalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
    setVerticalScrollBarPolicy(Qt::ScrollBarAlwaysOff);
}

void CGame::initSquares() {
    for(size_t i  = 0;i < 4; i++) {
        for(size_t j = 0;j < 4;j++) {
            p_squaresArr[i][j] = new QGraphicsRectItem(i * 100, j * 100,
                                                           100,     100);
            p_squaresArr[i][j]->setFlag(QGraphicsItem::ItemIsFocusable);
            p_squaresArr[i][j]->setFocus();
        }
    }

    QRect copyRect;
    for(size_t i = 0; i < 4; i++) {
        for(size_t j = 0;j < 4;j++) {
            copyRect.setRect(i * 100, j * 100,100,100);
            p_squaresArr[i][j]->setBrush(p_mainImg->copy(copyRect));
        }
    }
    p_squaresArr[3][3]->setBrush(m_nullBrush);
    m_nullPosition.set(3, 3);
}


