
class Boss2 extends Character {
  PVector waypoints[];
  int target, dead, health, noTarget, att, s;
  float damp; 
  float sightRange = 256;
  int pulseTimer = 120;
  float speedX, speedY;
  int invTimer = 60;
  boolean start;
  int re = 0;
  int state;
  int tpTimer = 180;
  int rTimer = 300;
  int aniSwitch = 20;

  Boss2(PVector[] waypoints, int d, Level l) {
    health = 1;
    damp = .6;
    state = 0;
    r = 50;
    int att =0;
    this.waypoints = waypoints;
    pos = new PVector(waypoints[d].x, waypoints[d].y);
    vel = new PVector(0, 0);
    this.level = l;
  }

  //movement
  void update() {
    aniSwitch--;

    if (invTimer < 60) {
      invTimer--;
    }
    if (invTimer < 0) {
      invTimer = 60;
    }

    if (health == 0) {
      dead = 1;
    }

    if (vision() || health < 2) {
      state = 1;
    }    

    if (state == 1) {
      chase();
    }
    if (dead == 1) {
      num += 1;
    }
    vel.mult(damp);
    pos.add(vel);

    if (state == 0) {
      drawMe();
      patrol();
    }

    if (state == 1) {
      tpTimer--;
    }

    if (tpTimer < 10 && tpTimer > 0) {
      tp();            
      drawMe();
      chase();
    }
    if (tpTimer < -1) {
      rTimer--;
      state = 2;
      drawMe();
      chase();
    }

    if (rTimer == 0) {
      tpTimer = 180;
      rTimer = 300;
      state = 1;
    }

  }
  //player collision

  boolean collision(Character c) {

    PVector diff = new PVector(pos.x, pos.y);
    diff.sub(c.pos);

    if (diff.mag() < r + (c.r) && level.player.state == 1 && (state == 2 || state == 0)) {
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


  boolean vision() { 
    //    println(level.sight((int)level.player.pos.x, (int)level.player.pos.y, (int)pos.x, (int)pos.y));
    PVector los = new PVector(level.player.pos.x, level.player.pos.y);
    los.sub(pos);
    //5 tile widths
    if (los.mag() > 300 || level.sight((int)level.player.pos.x, (int)level.player.pos.y, (int)pos.x, (int)pos.y) == false) {
      return false;
    }
    los.setMag(1);
    PVector dir = new PVector(vel.x, vel.y);
    dir.setMag(1);
    //    if(level.sight((int)level.player.pos.x,(int)level.player.pos.y, (int)pos.x, (int)pos.y)) {
    //      return false;
    //    }
    return (dir.dot(los) > .8);
  }

  void tp() {
    pos = level.player.pos.get();
  }



  void chase() {

    PVector pp = (level.player.pos.get());
    pp.sub(this.pos);
    pp.normalize(); 
    pp.mult(damp);
    pos.add(vel);
    vel.set(pp);
  }

  void patrol() {
    PVector face = new PVector(-pos.x, -pos.y);
    face.add(waypoints[target]);
    if (face.mag() <25 ) {
      target = (target + 1) % waypoints.length;
    } else {
      face.setMag(1);
      move(face);
    }
  }

  //draw function
  void drawMe() {
    pushMatrix();
    noFill();


    noStroke();

    translate( -level.player.pos.x + tileSize+level.player.dim.x/2 + pos.x, 
    -level.player.pos.y + tileSize+level.player.dim.y/2 + pos.y);



    imageMode(CENTER);
    
        if ((tpTimer < 10 && tpTimer > 0) || (tpTimer < 180 && tpTimer > 170)) {  
      image(tp, 0, 0);
    }
    
    image(bbt2, 0, -15);
    if (aniSwitch < -20) {
      aniSwitch = 20;
    }

      if (vel.y < 0) {
        if (aniSwitch > 0) {
          image(b2back, 0, 0);
        }
        if (aniSwitch < 0) {
          image(b2back2, 0, 0);
        } else {

          if (aniSwitch > 0) {
            image(b2front, 0, 0);
          }
          if (aniSwitch < 0) {
            image(b2front2, 0, 0);
          }
        }

        stroke(255, 0, 0);
      }
      imageMode(CORNER);
      popMatrix();
  }
}
