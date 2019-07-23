
class Enemy2 extends Character {
  PVector waypoints[];
  PVector cpos;
  int target, dead;
  float damp; 
  float sightRange = 256;
  int refire = 120;
  int fireTimer = 15;
  float speedX, speedY;
  boolean start;
  int re = 0;
  int state;
  ArrayList<Missile> missiles;
  int pres = 0;
  int aniSwitch = 10;

  Enemy2(PVector[] waypoints, float speedX, float speedY, int d, Level l) {
    state = 0;
    damp = 0.7; 
    r = 25;
    dead = 0;
    target = d + 1;
    missiles=new ArrayList<Missile>();
    pos = new PVector(waypoints[d].x, waypoints[d].y);
    vel = new PVector(0, 0);
    this.waypoints = waypoints;
    this.level = l;
  }

  //movement
  void update() {

    for (int i = 0; i < missiles.size(); i++) {
      Missile m = missiles.get(i);
      m.update(missiles);
      if (m.missileDecay < 0) {
        missiles.remove(m);
      }
    }
    
    if (state == 0) {
      patrol();
    }
    if (state == 1) {
       //chase();
       fire();
    }
    vel.mult(damp);
    pos.add(vel);
  }


  boolean vision() { 
    PVector los = new PVector(level.player.pos.x, level.player.pos.y);
    los.sub(pos);
    //5 tile widths
    if (los.mag() > 300 || level.sight((int)level.player.pos.x, (int)level.player.pos.y, (int)pos.x, (int)pos.y) == false) {
      return false;
    }
    los.setMag(1);
    PVector dir = vel.get();
    dir.setMag(1);
    //    if(level.sight((int)level.player.pos.x,(int)level.player.pos.y, (int)pos.x, (int)pos.y)) {
    //      return false;
    //    }
    return (dir.dot(los) > .8);
  }
  
  void fire() {
    if (fireTimer < 0) {
    PVector pp = (level.player.pos.get());
    pp.sub(this.pos);
    pp.normalize();
    pp.setMag(40);
    fireTimer = 3 * 60;
    missiles.add(new Missile(pos.get(), pp, level));
  }
  fireTimer--;
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

  void patrol() {
    PVector face = new PVector(-pos.x, -pos.y);
    face.add(waypoints[target]);
    if (face.mag() <25 ) {
      target = (target + 1) % waypoints.length;
    } else {
      face.setMag(1);
      move(face);
    }
    if (vision()) {
      state = 1;
    }
    
  }

  //draw function
  void drawMe() {
    aniSwitch--;
   // println(vision());
    pushMatrix();
    fill(0,0,255);
    translate( -level.player.pos.x + tileSize+level.player.dim.x/2 + pos.x, 
    -level.player.pos.y + tileSize+level.player.dim.y/2 + pos.y);

   
   if(state == 1) {
      if(aniSwitch > 0) image(ae2a, -25, -25);
      if(aniSwitch < 0) image(ae2b, -25, -25);
    }

      if(aniSwitch < -10) {
        aniSwitch = 10;
      }
    if (state == 0) {
      rectMode(CENTER);
      
      if(vel.y == 0) {
        pres = 0;
      }
      
      if (vel.x > 0 && aniSwitch > 0 && pres == 0) image(e2Right, -25, -25);
      if (vel.y > 0 && aniSwitch > 0) {
        pres = 1;
        image(e2Front, -31, -31);
      }
      if (vel.x < 0 && aniSwitch > 0 && pres == 0) image(e2Left, -25, -25);
      if (vel.y < 0 && aniSwitch > 0) {
        pres = 1;
        image(e2Back, -25, -31);
      }
      if (vel.x > 0 && aniSwitch < 0 && pres == 0) image(e2Right2, -25, -25);
      if (vel.y > 0 && aniSwitch < 0) {
        pres = 1;
        image(e2Front2, -31, -31);
      }
      if (vel.x < 0 && aniSwitch < 0 && pres == 0) image(e2Left2, -25, -25);
      if (vel.y < 0 && aniSwitch < 0) {
        pres = 1;
        image(e2Back2, -25, -31);
      }
    }
    popMatrix();

      for (int i = 0; i < missiles.size (); i++) {
      Missile m = missiles.get(i);
      m.draw();
      m.collision(level.player);
    }    

  }
}
