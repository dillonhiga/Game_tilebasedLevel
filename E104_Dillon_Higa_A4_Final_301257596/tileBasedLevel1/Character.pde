class Character {
  //fields
  int r;
  PVector pos, vel, dim;
  float damp = 0.75; 
  Level level;



  Character() {
  }

  void move(PVector acc) {
    vel.add(acc);
  }

  //collison check
  boolean collision(Character c) {

    PVector diff = new PVector(pos.x, pos.y);
    diff.sub(c.pos);

    if (diff.mag() < r + (c.r)) {
      check = 1;

      return true;
    }

    return false;
  }

    boolean collisionE(Character c) {

    PVector diff = new PVector(pos.x, pos.y);
    diff.sub(c.pos);

    if (diff.mag() < r + (c.r)) {
      return true;
    }
    return false;
  }
  
  //movement
  void update() {

    vel.mult(damp);
    pos.add(vel);
  }
}
