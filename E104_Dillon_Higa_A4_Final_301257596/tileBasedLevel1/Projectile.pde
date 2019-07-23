class Missile extends Character{
//decay for missles
int missileDecay;
Level level;
float rot = 0;

  //missle constructors
  Missile(PVector pos, PVector vel, Level l) {
    this.level = l;
    this.pos = pos;
    this.vel = vel;
    missileDecay = 180;
  }
  
  //update function for missles, drawing them, and decaying
  void update(ArrayList list) {
    pos.add(vel);
    draw();
    missileDecay--;

  //bounds for missles
   if (pos.y < 0) list.remove(this);
   if (pos.y > 64 * 29) list.remove(this);
   if (pos.x < 0) list.remove(this);
   if (pos.x > 64 * 29) list.remove(this);
   
   
   if(level.tiles[(int)pos.x/64][(int)pos.y/64].block) {
     missileDecay = -1;
   }
  }
  
  boolean collision(Character c) {

    PVector diff = new PVector(pos.x, pos.y);
    diff.sub(c.pos);

    if (diff.mag() < r + (c.r) && level.player.state == 1) {
      check = 1;
      return true;
    }
    
    if (diff.mag() < r + (c.r * 3) && level.player.state == 2) {
      return true;
    }

    if (diff.mag() < r + (c.r) && level.player.state == 3) {
      return false;
    }

    return false;
  }
  
    boolean collisionE(Character c) {

    PVector diff = new PVector(pos.x, pos.y);
    diff.sub(c.pos);

    if (diff.mag() < r + (c.r)) {
      check = 1;
      return true;
    }    

    return false;
  }
    
    
    
    
    
    
  //viseral appeal of missles
  void draw() {
    rot += 1.5;
    pushMatrix();
    translate( -level.player.pos.x + tileSize+level.player.dim.x/2 + pos.x, 
    -level.player.pos.y + tileSize+level.player.dim.y/2 + pos.y);
    stroke(0,255,0);
    fill(0,255,0);
    rotate(rot);
    imageMode(CENTER);
    image(missile1, 0,0);
    imageMode(CORNER);
    popMatrix();
    fill(0,0,0);
  }
}
