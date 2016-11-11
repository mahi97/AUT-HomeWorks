 #include <iostream>
#include <time.h>


using std::cout;
using std::endl;

//For save location of 0
struct SPos {
    int x,y;
    void set(const int& _x, const int& _y) {
        x = _x;
        y = _y;
    }
}cursor;

//Move Functions
void moveLeft (int _puzzle[][4]);
void moveRight(int _puzzle[][4]);
void moveUp   (int _puzzle[][4]);
void moveDown (int _puzzle[][4]);

//Randomly Fill Puzzle
void messUp(int _puzzle[][4]);

//Fill Puzzle in Order
void fillPuzzle(int _puzzle[][4]);
//Show Puzzle
void showPuzzle(const int _puzzle[][4]);

int main() {
    
    srand(time(0));
    
    int puzzle[4][4]; 
    char order;
    bool exit{false};

    fillPuzzle(puzzle); // initial Puzzle
    messUp(puzzle);     // messUp  Puzzle

    while(!exit) {

        cout << "For Exit Press X" << endl;

        showPuzzle(puzzle);
        std::cin >> order;
        switch(order) {
        case 'X':
        case 'x':
            exit = true;
            break;
        case 'W':
        case 'w':
            moveUp(puzzle);
            break;
        case 'S':
        case 's':
            moveDown(puzzle);
            break;
        case 'A':
        case 'a':
            moveLeft(puzzle);
            break;
        case 'D':
        case 'd':
            moveRight(puzzle);
            break;
        default:
            break;
            
        }
    }
     
}


void moveLeft(int _puzzle[][4]) {
    if(cursor.y > 0) {
        _puzzle[cursor.x][cursor.y] = _puzzle[cursor.x][cursor.y - 1];
        _puzzle[cursor.x][cursor.y - 1] = 0;
        cursor.y--;
    }
}

void moveRight(int _puzzle[][4]) {
    if(cursor.y < 3) {
        _puzzle[cursor.x][cursor.y] = _puzzle[cursor.x][cursor.y + 1];
        _puzzle[cursor.x][cursor.y + 1] = 0;
        cursor.y++;
    }
}

void moveUp(int _puzzle[][4]) {
    if(cursor.x > 0) {
        _puzzle[cursor.x][cursor.y] = _puzzle[cursor.x - 1][cursor.y ];
        _puzzle[cursor.x - 1][cursor.y] = 0;
        cursor.x--;
    }
}

void moveDown(int _puzzle[][4]) {
    if(cursor.x < 3) {
        _puzzle[cursor.x][cursor.y] = _puzzle[cursor.x + 1][cursor.y];
        _puzzle[cursor.x + 1][cursor.y] = 0;
        cursor.x++;
    }
}


// Do 100 random moves in order to messup puzzle
void messUp(int _puzzle[][4]) {
    for(size_t i{0};i < 100;i++) {
        switch (rand()%4) {
        case 0:
            moveDown(_puzzle);
            break;
        case 1:
            moveUp(_puzzle);
            break;
        case 2:
            moveLeft(_puzzle);
            break;
        case 3:
            moveRight(_puzzle);
            break;
        default:
            break;
        }    
    }
}

void fillPuzzle(int _puzzle[][4]) {
    cursor.set(0,0);  
    for(size_t i{0}; i < 4; i++) {
        for(size_t j{0}; j < 4; j++) {
            _puzzle[i][j] =  (i * 4) + j;
        }
    }
}

void showPuzzle(const int _puzzle[][4]) {
    for(size_t i{0}; i < 4; i++) {
        for(size_t j{0}; j < 4; j++) {
            cout << _puzzle[i][j];
            
            //Make space between elemnts more appropriate
            (_puzzle[i][j] < 10) ? cout << "    " : cout << "   ";
        }
        cout << endl;
    }
}

