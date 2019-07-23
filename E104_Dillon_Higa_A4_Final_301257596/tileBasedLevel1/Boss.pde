
class Boss extends Character {

  int target, dead, health, noTarget, att, s;
  float damp; 
  float sightRange = 256;
  int pulseTimer = 240;
  float speedX, speedY;
  int invTimer = 60;
  boolean start;
  int re = 0;
  int state;
  int aniSwitch = 20;
  int pRange;
  Boss(float x, float y, int pRange, int health, Level l) {
    this.health = health;
    this.pRange = pRange;
    damp = 1.2;
    state = 0;
    r = 50;
    int att =0;
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    this.level = l;
  }

  //movement
  void update() {

    if (invTimer < 60) {
      invTimer--;
    }
    if (invTimer < 0) {
      invTimer = 60;
    }

    if (health == 0) {
      dead = 1;
    }

    if (level.player.pos.x > 651 && level.player.pos.x < 670 && level.player.pos.y > 816 && level.player.pos.y < 1039) {
      state = 1;
    }

    if (state == 0) {
    }
    if (state == 1) {
      pulse();
      chase();
    }
    if (state == 3) {
      num++;
      state = 0;
    }
    vel.mult(damp);
    pos.add(vel);
    if (dead == 1) {
      state = 3;
    }
    drawMe();
  }
  //player collision

  boolean collision(Character c) {

    PVector diff = new PVector(pos.x, pos.y);
    diff.sub(c.pos);

    if (diff.mag() < r + (c.r) && level.player.state == 1 && att == 0) {
      check = 1;
      return true;
    }
    if (diff.mag() < r + (c.r) && level.player.state == 2) {
      if (invTimer == 60) {
        invTimer = 59;
        health -= 1;
      }

      return false;
    }
    if (diff.mag() < r + (c.r) && level.player.state == 3) {
      return false;
    }

    return false;
  }


  void chase() {
    PVector pp = (level.player.pos.get());
    pp.sub(this.pos);
    pp.normalize(); 
    pp.mult(damp);
    pos.add(vel);
    vel.set(pp);
  }

  void pulse() {
    //println(pulseTimer);



    if (r <= pRange && att == 0) {
      r += 1;
      sou4.play();
    }
    if (r == pRange) {
      att = 1;
    }
    if (att == 1) {
      r = 50;
    }
    if (r == 50) {
      att = 3;
    }
    if (att == 3) {
      pulseTimer--;
    }
    if (pulseTimer == 0) {
      r = 50;
      att =0;
      pulseTimer = 240;
      sou4.cue(0);
    }
  }


  //draw function
  void drawMe() {
    pushMatrix();
    noFill();
    imageMode(CENTER);
    
    translate( -level.player.pos.x + tileSize+level.player.dim.x/2 + pos.x, 
    -level.player.pos.y + tileSize+level.player.dim.y/2 + pos.y);

    image(bbt,0,-10);
    aniSwitch--;
    if (aniSwitch < -20) {
      aniSwitch = 20;
    }
    stroke(255, 0, 0);
    ellipse(0,0,r * 2,r * 2);
    stroke(255, 255, 0);
    ellipse(0,0,(r-2) * 2,(r-2) * 2);
    if (vel.y < 0) {
      if (aniSwitch > 0) {
        image(b1back, 0, 0);
      }
      if (aniSwitch < 0) {
        image(b1back2, 0, 0);
      } else {
        if (aniSwitch > 0) {
          image(b1front, 0, 0);
        }
        if (aniSwitch < 0) {
          image(b1front2, 0, 0);
        }
      }



    }
    imageMode(CORNER);

   popMatrix();
  }
}
