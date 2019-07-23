class Tile {
  PVector pos, diff, absDiff;
  PImage img;
  boolean block;
  int flag;

  Tile(String path, PVector pos, boolean block) {
    img = loadImage(path);
    this.pos = pos;
    this.block = block;
  }

  //tile collison
  boolean collision(Player c) {

    diff = PVector.sub(c.pos, pos);

    //diff.add(tileSize+c.dim.x/2, tileSize+c.dim.y/2, 0);  
    absDiff = new PVector(abs(diff.x), abs(diff.y));
    if (block && 
      absDiff.x < c.dim.x / 2 + img.width / 2 && 
      absDiff.y < c.dim.y / 2 + img.height / 2) {

      c.pos.x += diff.x*0.02;
      c.pos.y += diff.y*0.02;
      return true;
    }
    return false;
  }

  //window movement
  boolean inWindow() {
    if (absDiff.x < width && absDiff.y < height) {
      return true;
    }
    return false;
  }

  //tile drawing
  void drawMe(Player player) {
    pushMatrix();
    translate( -player.pos.x + tileSize+player.dim.x/2 + pos.x, 
    -player.pos.y + tileSize+player.dim.y/2 + pos.y);
    
    

    scale(1.04, 1.04);
    image(img, -img.width/2, -img.height/2);
        if (flag == 1) {
      fill(255);
      rect(-img.width/2, -img.height/2, 2,2);
    }
    
    popMatrix();
  }
}
