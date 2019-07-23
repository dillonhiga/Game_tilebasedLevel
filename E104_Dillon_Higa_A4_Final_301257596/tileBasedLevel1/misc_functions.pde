
//initalizing arraylist
ArrayList<Tile> tiles = new ArrayList<Tile>();

//tile specifacations
int tileSize = 64;
//state check
int check = 0;
PFont cords;
PVector fireDirection = new PVector(0, -10);

PImage pFront;
PImage pBack;
PImage pRight;
PImage pLeft;
PImage pFront2;
PImage pBack2;
PImage pRight2;
PImage pLeft2;

PImage e1Front;
PImage e1Back;
PImage e1Right;
PImage e1Left;
PImage e1Front2;
PImage e1Back2;
PImage e1Right2;
PImage e1Left2;
PImage bt;
PImage ae1a;
PImage ae1b;

PImage e2Front;
PImage e2Back;
PImage e2Right;
PImage e2Left;
PImage e2Front2;
PImage e2Back2;
PImage e2Right2;
PImage e2Left2;
PImage bt2;
PImage ae2a;
PImage ae2b;

PImage b1front;
PImage b1front2;
PImage b1back;
PImage b1back2;
PImage bbt;

PImage b2front;
PImage b2front2;
PImage b2back;
PImage b2back2;
PImage bbt2;
PImage tp;

PImage missile1;
PImage pAttack;
PImage roll;

PImage start;




//player movement/screen movement
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT){
      left = true;
      fireDirection = new PVector(-10, 0);
    }
    else if (keyCode == RIGHT){
      right = true;
      fireDirection = new PVector(10, 0);
    }
    else if (keyCode == UP){
      up = true;
      fireDirection = new PVector(0, -10);
    }
    else if (keyCode == DOWN){
      down = true;
      fireDirection = new PVector(0, 10);
    }
  }
  if(key == 'r' || key == 'R') {
    
  //1evel1.reset();
  //1evel2.reset();
  //1evel3.reset();
  }
}
void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) left = false;
    else if (keyCode == RIGHT) right = false;
    else if (keyCode == UP) up = false;
    else if (keyCode == DOWN) down = false;
  }
}


float speed = 2;
PVector upForce = new PVector(0, -speed);
PVector downForce = new PVector(0, speed);
PVector leftForce = new PVector(-speed, 0);
PVector rightForce = new PVector(speed, 0);
boolean up, down, left, right;
