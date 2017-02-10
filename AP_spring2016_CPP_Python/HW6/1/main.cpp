#include <QApplication>

#include "game.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    CGame *game;
    game = new CGame();
    game->show();

    return a.exec();
}
