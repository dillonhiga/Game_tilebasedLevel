
class Enemy extends Character {
  PVector waypoints[];
  int target, dead;
  float damp; 
  float sightRange = 256;
  int redash = 120;
  int dashTimer = 15;
  float speedX, speedY;
  boolean start;
  int re = 0;
  int state;
  int aniSwitch = 10;
  int pres = 0;

  Enemy(PVector[] waypoints, float speedX, float speedY, int d, Level l) {
    state = 0;
    damp = 0.7; 
    r = 25;
    dead = 0;
    target = d + 1;
    pos = new PVector(waypoints[d].x, waypoints[d].y);
    vel = new PVector(0, 0);
    this.waypoints = waypoints;
    this.level = l;
  }

  //movement
  void update() {

    if (state == 0) {
      patrol();
    }
    if (state == 1) {
      chase();
    }
    inVision(); 



    vel.mult(damp);
    pos.add(vel);
  }
  //player collision

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


  boolean collision(Character c) {

    PVector diff = new PVector(pos.x, pos.y);
    diff.sub(c.pos);

    if (diff.mag() < r + (c.r) && level.player.state == 1) {
      check = 1;
      return true;
    }
    if (diff.mag() < r + (c.r * 3) && level.player.state == 2) {
      dead = 1;
      return false;
    }
    if (diff.mag() < r + (c.r * 3) && level.player.state == 3) {
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


  void inVision() {
    if (vision() && dashTimer > 0) {
      fill(255, 0, 0);
      state = 1;
      damp = 4;
      redash = 120;
    } 

    if (vision() && damp == 2) {
      dashTimer--;
    }

    if (dashTimer < 0) {
      damp = 1;
      redash--;
    }
    if (redash < 0) {
      dashTimer = 15;
    }
  }
  //patrol path

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
    aniSwitch--;
    if(aniSwitch < -10) {
      aniSwitch = 10;
    }
    pushMatrix();
    fill(255);
    translate( -level.player.pos.x + tileSize+level.player.dim.x/2 + pos.x, 
    -level.player.pos.y + tileSize+level.player.dim.y/2 + pos.y);
    
    if(state == 1) {
      if(aniSwitch > 0) image(ae1a, -25, -25);
      if(aniSwitch < 0) image(ae1b, -25, -25);
    }

    if (state == 0) {
      rectMode(CENTER);
      image(bt,-25,-25);
      if(vel.y == 0) {
        pres = 0;
      }
      
      if (vel.x > 0 && aniSwitch > 0 && pres == 0) image(e1Right, -25, -25);
      if (vel.y > 0 && aniSwitch > 0) {
        pres = 1;
        image(e1Front, -25, -25);
      }
      if (vel.x < 0 && aniSwitch > 0 && pres == 0) image(e1Left, -25, -25);
      if (vel.y < 0 && aniSwitch > 0) {
        pres = 1;
        image(e1Back, -25, -25);
      }
      if (vel.x > 0 && aniSwitch < 0 && pres == 0) image(e1Right2, -25, -25);
      if (vel.y > 0 && aniSwitch < 0) {
        pres = 1;
        image(e1Front2, -25, -25);
      }
      if (vel.x < 0 && aniSwitch < 0 && pres == 0) image(e1Left2, -25, -25);
      if (vel.y < 0 && aniSwitch < 0) {
        pres = 1;
        image(e1Back2, -25, -25);
      }
    }
    rectMode(CORNER);

    stroke(255, 0, 0);

    popMatrix();
  }
}
