import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer sou;
AudioPlayer sou2;
AudioPlayer sou3;
AudioPlayer sou4;
AudioPlayer sou5;

//use arrow keys to move and space to kill enemeis.
// additonally you can now go invincible for 5 frames and get a speed boost( an escape mech), has no timer as of yet so can be mashed
//level 2 has no enemies yet as they will be of a different kind.
//enemies now have cones of vision, although currently bugged then can see you through walls
//boss 1 emits a shock wave every 3 seconds,its invisable atm becasue need to load animation.
// boss health is currently set to 1 atm will change however unsure as to what,
//to be coded for final, projectiles, boss 2 and 3, animations, and 1 new enemy.
// wont take that long as it is just modifications of code. project is now 90% complete

Level1 level1;
Level2 level2;
Level3 level3;
int num;
void setup() {
  //font for cordinates

  minim = new Minim(this);
  sou = minim.loadFile("Swords_Collide-Sound_Explorer-2015600826.mp3");
  sou2 = minim.loadFile("cloth-Anna-2094913298.mp3");
  sou3 = minim.loadFile("spear_throw-Mike_Koenig-2064202968.mp3");
  sou4 = minim.loadFile("Fire_Burning-JaBa-810606813.mp3");
  sou5 = minim.loadFile("song.mp3");

  start = loadImage("start.png");

  pFront = loadImage("player front.png");
  pBack = loadImage("player back.png");
  pRight = loadImage("player right.png");
  pLeft = loadImage("player left.png");
  pFront2 = loadImage("player front2.png");
  pBack2 = loadImage("player back2.png");
  pRight2 = loadImage("player right2.png");
  pLeft2 = loadImage("player left2.png");
  
  e1Front = loadImage("enemy front.png");
  e1Back = loadImage("enemy back.png");
  e1Right = loadImage("enemy right.png");
  e1Left = loadImage("Enemy left.png");
  e1Front2 = loadImage("enemy front2.png");
  e1Back2 = loadImage("enemy back2.png");
  e1Right2 = loadImage("enemy right2.png");
  e1Left2 = loadImage("enemy left2.png");
  bt = loadImage("body temp.png");
  ae1a = loadImage("agroe1.png");
  ae1b = loadImage("agroe1.png");
  
  e2Front = loadImage("enemy2 front.png");
  e2Back = loadImage("enemy2 back.png");
  e2Right = loadImage("enemy2 right.png");
  e2Left = loadImage("enemy2 left.png");
  e2Front2 = loadImage("enemy2 front2.png");
  e2Back2 = loadImage("enemy2 back2.png");
  e2Right2 = loadImage("enemy2 right2.png");
  e2Left2 = loadImage("enemy2 left2.png");
  bt2 = loadImage("body temp2.png");
  ae2a = loadImage("enemy2 agro1.png");
  ae2b = loadImage("enemy2 agro2.png");
  
  
  b1front = loadImage("boss1 front.png");
  b1front2 = loadImage("boss1 front2.png");
  b1back = loadImage("boss1 back.png");
  b1back2 = loadImage("boss1 back2.png");
  bbt = loadImage("boss bt.png");
  
  b2front = loadImage("boss2 front.png");
  b2front2 = loadImage("boss2 front2.png");
  b2back = loadImage("boss2 back.png");
  b2back2 = loadImage("boss2 back2.png");
  bbt2 = loadImage("bbt2.png");
  tp = loadImage("tp.png");
  
  missile1 = loadImage("missile1.png");
  pAttack = loadImage("player attack.png");
  roll = loadImage("roll.png");
  int num = 0;
  cords = loadFont("CenturySchoolbook-48.vlw");
  size(1275, 750);
  stroke(200);
  strokeWeight(2);
  fill(63);
  level1 = new Level1();
  level2 = new Level2();
  level3 = new Level3();
  //patrol areas and enemy initialization

  //0 is wood, 1 is wall, 2 is roof
}

void draw() {
  switch(num) {
  case 0:
  scale(.73,.60);
  image(start,0,0);
  sou5.cue(1);
  sou5.play();
 {
  if(keyPressed) {
    if(key == 't' || key == 'T') {
      num = 1;
    }
  }
 }
    break;
  case 1:
    level1.draw();
    break;
  case 2:
    level2.draw();
    break;
  case 3:
    level3.draw();
    break;
  case 4:
    break;

  }
}

// adapted from lecture ex. March 12th 2015, week 10,  IAT 167 
