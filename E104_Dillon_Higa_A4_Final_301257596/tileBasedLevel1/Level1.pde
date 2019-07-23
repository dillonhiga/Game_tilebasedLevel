class Level1 extends Level {
  ArrayList<Enemy> enemyList = new ArrayList<Enemy>();

  int w = 30;
      Boss boss = new Boss(960, 960, 200, 2, this);
  Level1() {

int[][] mapData ={
       {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
       {1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
       {1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
       {1,2,2,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,1},
       {1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
       {1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
       {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
     };

    load(mapData);

    player = new Player(new PVector(1700, 1800), this);
    spawnEnemies();
  }
  
  
    void reset() {
    player = new Player(new PVector(1700, 1800), this);
    check = 0;
  }

  void spawnEnemies() {

    PVector  [] waypoint = new PVector[4];
    waypoint[0] = new PVector(300, 300);
    waypoint[1] = new PVector(300, 1570);
    waypoint[2] = new PVector(1570, 1570);
    waypoint[3] = new PVector(1570, 300);

    enemyList.add(new Enemy(waypoint, .5, 0, 0, this));
    enemyList.add(new Enemy(waypoint, .5, 0, 2, this));

    PVector  [] roofPatrol = new PVector[4];
    roofPatrol[0] = new PVector(100, 100);
    roofPatrol[1] = new PVector(100, 1770);
    roofPatrol[2] = new PVector(1770, 1770);
    roofPatrol[3] = new PVector(1770, 100);

    enemyList.add(new Enemy(roofPatrol, .5, 0, 0, this));
    enemyList.add(new Enemy(roofPatrol, .5, 0, 2, this));

    PVector  [] innerPatrol2 = new PVector[4];
    innerPatrol2 [0] = new PVector(515, 515);
    innerPatrol2 [1] = new PVector(515, 1340);
    innerPatrol2 [2] = new PVector(515, 515);
    innerPatrol2 [3] = new PVector(515, 1340);

    enemyList.add(new Enemy(innerPatrol2, .5, 0, 0, this));
    enemyList.add(new Enemy(innerPatrol2, .5, 0, 2, this));
  }

  void draw() {
    //screen movement
    background(0);

    if (left) player.move(leftForce);
    if (right) player.move(rightForce);
    if (up) player.move(upForce);
    if (down) player.move(downForce);

    translate(435, 235);

    //states of game
    //alive
    if (check == 0) {
      for (int i = 0; i < 30; i++) {
        for(int j = 0; j < 30; j++) {
         
         
        if (tiles[i][j].collision(player)) {
          player.vel.mult(0.0);
        }
        if (tiles[i][j].inWindow()) {

          tiles[i][j].drawMe(player);
          tiles[i][j].flag = 0; 
        }
      }
      }
      fill(255);
      text(player.pos.x + ", " + player.pos.y, 0, 0);
      fill(50);
      for ( int i = 0; i < enemyList.size (); i++) {
        Enemy e = enemyList.get(i);
        e.collision(player);
        e.update();
        e.drawMe();
        e.patrol();
       for (int j =0; j < player.missiles.size (); j++) {
         int del = 0;
          if(e.collisionE(player.missiles.get(j))) {
             e.dead = 1;
             del = 1;
          }
          if(del == 1) {
            player.missiles.remove(j);
          }

       }
        if (e.dead == 1) {
          enemyList.remove(e);
        }
      }
      boss.update();
      boss.collision(player);
      player.update();
      player.drawMe();
    }
    //dead
    if (check == 1) {
      fill(255, 0, 0);
      text("Game Over", 0, 0);
    }
    fill(255,0,0);
    noStroke();
    rect(810, 470, 20, 20);
    rect(780, 470, 20, 20);
    rect(750, 470, 20, 20);
    fill(0,0,255);
    rect(810, 470, 20, 20 -player.reloadTimer/30);
    rect(780, 470, 20, 20 -player.rollCD/4.75);
    rect(750, 470, 20, 20 -player.attackTimer/ .75);
    stroke(200);
  }
}
