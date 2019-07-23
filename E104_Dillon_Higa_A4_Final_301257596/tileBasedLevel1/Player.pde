class Player extends Character {
  //fields
  
  int state, attackTimer, reset, c1, c2, c3;
  PVector dim;
  float damp = 0.8;
  int rollTimer = 5;
  int rollReset = 0;
  int rollCD = 95;
  int cds = 0;
  int reload = 0;
  int fireint = 1;
  int reloadTimer = 600;
  int dir;
  int aniSwitch = 10;
  int rot = 0;
  int anistop = 0;

  ArrayList<Missile> missiles = new ArrayList<Missile>();

  Player(PVector pos, Level l) {
    state = 1;
    attackTimer = 15;
    reset = 0;
    r = 15;
    this.pos = pos;
    vel = new PVector();
    dim = new PVector(32, 32);
    this.level = l;
  }

  void roll() {

    if (rollTimer == 5 && reset == 0) {

      damp = 0.8;
    }

    if (rollTimer < 5 && rollTimer > 0 && rollCD == 95) {
      c1 = 0;
      c2 = 0;
      c3 = 255;
      damp = 1.3;
    }

    if (damp == 1.3) {
      cds = 1;
    }

    if (cds == 1) {
      rollCD--;
    }

    if (rollCD < 0) {
      cds = 0;
      rollCD = 95;
      anistop = 0;
    }

    if (rollTimer == 0) {
      anistop = 1;
      state = 1;
      c1 = 100;
      c2 = 100;
      c3 = 100;
      damp -= .27;
    }

    if (keyPressed) {
      if (key == 'z' || key == 'Z') {
        state = 3;
        rollReset = 1;
        sou2.cue(1);
        sou2.play();
      }
    } 
    if (rollReset == 1) {
      rollTimer --;
    }
    if (rollTimer < 0) {
      rollTimer = 5;
      rollReset = 0;
    }
  }


  // attack function
  void attack() {
    if (attackTimer < 15) {
      c1 = 255;
      c2 = 0;
      c3 = 0;
      damp -= .05;
    }

    if (attackTimer >= 10) { 
      state = 1;
    }

    if (attackTimer == 15 && rollReset == 0) {
      c1 = 100;
      c2 = 100;
      c3 = 100;
      damp = .8;
    }

    if (keyPressed) {
      if (key == ' ') {
        state = 2;
        reset = 1;
      }
    }
    if (reset == 1) {
      attackTimer --;
    }
    if (attackTimer < 0) {
      reset = 0;
      attackTimer = 15;
    }
  }


  //move method, PVector force as parameter, add to acceleration
  void move(PVector acc) {
    vel.add(acc);
  }

  //update the physics for the character
  void update() {
    roll();
    attack();
    fire();
    vel.mult(damp); //multiply velocity by dampening factor (0.9-0.99);
    pos.add(vel); //add velocity to position (moves character)


        for (int i=0; i< missiles.size(); i++) {
      Missile m=missiles.get(i);
      m.update(missiles);
    }
  }

  void fire() {

        
    if(fireint == 0 && reloadTimer == 600) {
    missiles.add(new Missile(pos.get(), fireDirection, level));
    reload = 1;
    }
    if(reloadTimer < 0) {
      fireint = 1;
      reload = 0;
      reloadTimer = 600;
    }
    if(reload == 1) {
      reloadTimer--;
    }
        if (keyPressed) {
      if (key == 'x' || key ==  'X') {
       fireint = 0;
       sou3.cue(0);
       sou3.play();
      }
    }
   
  }

  //drawing player
  void drawMe() {

    aniSwitch--;
    fill(c1, c2, c3);
    if(aniSwitch < -10) {
      aniSwitch = 10;
    }
    if(aniSwitch < -10) {
      aniSwitch = 10;
    }
   
    if(down && aniSwitch > 0) {

      dir = 0;
      
    }
    if(up && aniSwitch > 0) {
      dir = 1;
    }
    if(right && aniSwitch > 0) { 
      dir = 2;
    }
    if(left && aniSwitch > 0) {
      dir = 3;
    }
      if(down && aniSwitch < 0) {
      dir = 4;
      
    }
    if(up && aniSwitch < 0) {
      dir = 5;
    }
    if(right && aniSwitch < 0) { 
      dir = 6;
    }
    if(left && aniSwitch < 0) {
      dir = 7;
    }
    
    if(dir == 0) image(pFront ,tileSize+dim.x/2 - 15, tileSize+dim.y/2 - 15);
    if(dir == 1) image(pBack,tileSize+dim.x/2 - 15, tileSize+dim.y/2 - 15);
    if(dir == 2) image(pRight,tileSize+dim.x/2 - 15, tileSize+dim.y/2 - 15);
    if(dir == 3) image(pLeft,tileSize+dim.x/2 - 15, tileSize+dim.y/2 - 15);
    if(dir == 4) image(pFront2 ,tileSize+dim.x/2 - 15, tileSize+dim.y/2 - 15);
    if(dir == 5) image(pBack2,tileSize+dim.x/2 - 15, tileSize+dim.y/2 - 15);
    if(dir == 6) image(pRight2,tileSize+dim.x/2 - 15, tileSize+dim.y/2 - 15);
    if(dir == 7) image(pLeft2,tileSize+dim.x/2 - 15, tileSize+dim.y/2 - 15);
    
    if (attackTimer < 15 && attackTimer > 10) {
      sou.cue(0);
      sou.play();
      pushMatrix();
      rot += 1;
      translate(81,81);
      rotate(rot);
      imageMode(CENTER);
      image(pAttack, 0, 0);
      noFill();
      imageMode(CORNER);
      popMatrix();


    }
    if (rollTimer < 5 && rollTimer > 0) {
      imageMode(CENTER);
      rot += 1;
      translate(81,81);
      rotate(rot);
      if(anistop == 0) {
      image(roll, 0, 0);
      }
      imageMode(CORNER);
      noFill();
    }
  }
}
