class Level {
  ArrayList<Enemy> enemyList = new ArrayList<Enemy>();
  Tile [][] tiles;
  Player player;

  Level() {
  }

  void reset() {
  }


  void load(int[][] map) {
    tiles = new Tile [map.length][map[0].length];
    for (int i = 0; i < map.length; i++) {
      for (int j = 0; j < map[i].length; j++) {

        //map [i] [j] = 0;
        boolean block = false;
        if (map [i][j] == 0) {    
          block = false;
        } 
        if (map [i][j] == 1) {
          block = true;
        }
        if (map [i][j] == 2) {
          block = false;
        }
        String path = "img/levels/tile" + map[i][j] + ".png";

        tiles[i][j] = (new Tile(path, new PVector(i * tileSize, j * tileSize), block));
      }
    }
  }

  boolean sight(float x1, float y1, float x2, float y2) {
    // float dx = ((-x1 + tileSize+player.dim.x/2 + x2) - 89) ;
    // float dy = ((-y1 + tileSize+player.dim.y/2 + y2) - 89) ;
    float delta;

/*
    if (abs(dx) > abs(dy)) { 
      delta = abs(dx + 1);
    } else {
      delta = abs(dy + 1);
    }

*/


    //line(75, 75, -x1 + tileSize+player.dim.x/2 + x2, -y1 + tileSize+player.dim.y/2 + y2);


    float a1 = 75 + 435;
    float b1 = 75 + 235;
    float a2 = -x1 + tileSize+player.dim.x/2 + x2 + 435;
    float b2 = -y1 + tileSize+player.dim.y/2 + y2 + 235;

    float p, q;

    for (int i=0; i< 20; i++)
    {
      // ENEMY POSITION ON TILES MAP
      p = a1 + i * (a2 - a1)/20 - 435 + player.pos.x;
      q = b1 + i * (b2 - b1)/20 - 235 + player.pos.y;

   // println((int)(p/tileSize) +" "+(int)(q/tileSize));
      if (tiles[(int)(p/tileSize)][(int)(q/tileSize)].block) {
        return false;
      }
    }

    return true;


    /*
    for (int i = 0; i < delta; i++) {
     if (tiles[(int)(x1/tileSize)][(int)(y1/tileSize)].block) {
     return false;
     }
     x1 += 1;
     y1 += dy/dx;
     
     print(dy/dx + " " + x1 + " " + y1);
     println();
     }
     return true;
     */
  }
}
