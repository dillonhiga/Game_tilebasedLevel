class Level2 extends Level {
  ArrayList<Enemy> enemyList = new ArrayList<Enemy>();
  ArrayList<Enemy2> enemyList2 = new ArrayList<Enemy2>();
  int w = 30;
  Boss2 boss2;

  Level2() {

int[][] mapData ={
       {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
       {1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
       {1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
       {1,2,2,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,1,1,1,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,1,1,1,1,2,2,1},
       {1,2,2,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,1,2,2,1},
       {1,2,2,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,1,2,2,1},
       {1,2,2,1,1,1,1,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,1,1,1,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,1,1,0,0,1,1,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,1,1,1,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,1,1,1,1,2,2,1},
       {1,2,2,1,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,1,1,1,1,2,2,1},
       {1,2,2,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,2,2,1},
       {1,2,2,1,1,1,1,0,0,1,1,1,1,1,0,0,1,1,1,1,1,0,0,1,1,1,1,2,2,1},
       {1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
       {1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
       {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
     };

    load(mapData);

    player = new Player(new PVector(1700, 1800), this);
    PVector [] bossPoints = new PVector[6];
    bossPoints[0] = new PVector(960, 960);
    bossPoints[1] = new PVector(1250, 1368);
    bossPoints[2] = new PVector(603, 1368);
    bossPoints[3] = new PVector(603, 467);
    bossPoints[4] = new PVector(1250, 467);
    bossPoints[5] = new PVector(960, 960);
    boss2 = new Boss2(bossPoints, 0, this);
    spawnEnemies();
  }

  void spawnEnemies() {
    PVector  [] waypoint = new PVector[8];
    waypoint[0] = new PVector(1250, 1368);
    waypoint[1] = new PVector(603, 1368);
    waypoint[2] = new PVector(603, 467);
    waypoint[3] = new PVector(1250, 467);
    waypoint[7] = new PVector(1250, 1368);
    waypoint[6] = new PVector(603, 1368);
    waypoint[5] = new PVector(603, 467);
    waypoint[4] = new PVector(1250, 467);

    enemyList.add(new Enemy(waypoint, .5, 0, 0, this));
    enemyList.add(new Enemy(waypoint, .5, 0, 1, this));
    enemyList.add(new Enemy(waypoint, .5, 0, 2, this));
    enemyList.add(new Enemy(waypoint, .5, 0, 3, this));
    enemyList.add(new Enemy(waypoint, 1, 0, 4, this));
    enemyList.add(new Enemy(waypoint, 1, 0, 5, this));
    enemyList.add(new Enemy(waypoint, 1, 0, 6, this));



    PVector  [] roofPatrol = new PVector[4];
    roofPatrol[0] = new PVector(100, 100);
    roofPatrol[1] = new PVector(100, 1770);
    roofPatrol[2] = new PVector(1770, 1770);
    roofPatrol[3] = new PVector(1770, 100);

    enemyList.add(new Enemy(roofPatrol, .5, 0, 0, this));
    enemyList.add(new Enemy(roofPatrol, .5, 0, 2, this));

    PVector  [] innerPatrol2 = new PVector[7];
    innerPatrol2 [0] = new PVector(1555, 922);
    innerPatrol2 [1] = new PVector(1771, 922);
    innerPatrol2 [2] = new PVector(1771, 472);
    innerPatrol2 [3] = new PVector(1249, 472);
    innerPatrol2 [4] = new PVector(1249, 1372);
    innerPatrol2 [5] = new PVector(1591, 1372);
    innerPatrol2 [6] = new PVector(1591, 922);

    enemyList.add(new Enemy(innerPatrol2, .5, 0, 0, this));
    enemyList.add(new Enemy(innerPatrol2, .5, 0, 2, this));
    enemyList.add(new Enemy(innerPatrol2, .5, 0, 4, this));
    enemyList.add(new Enemy(innerPatrol2, .5, 0, 5, this));

    PVector  [] doorPatrol = new PVector[2];
    doorPatrol[0] = new PVector(279, 900);
    doorPatrol[1] = new PVector(279, 287);


    enemyList2.add(new Enemy2(doorPatrol, .5, 0, 0, this));



    PVector  [] doorPatrol2 = new PVector[2];
    doorPatrol2[0] = new PVector(279, 954);
    doorPatrol2[1] = new PVector(279, 1565);


    enemyList2.add(new Enemy2(doorPatrol2, .5, 0, 0, this));
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
        for (int j = 0; j < 30; j++) {


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
        if (e.dead == 1) {
          enemyList.remove(e);
        }
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
      }

      for ( int i = 0; i < enemyList2.size (); i++) {
        Enemy2 e = enemyList2.get(i);
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
       }
       
      boss2.update();
      boss2.collision(player);
      player.update();
      player.drawMe();
    }

    //dead
    if (check == 1) {
      fill(255, 0, 0);
      text("Game Over", 0, 0);
    }
    fill(255, 0, 0);
    noStroke();
    rect(810, 470, 20, 20);
    rect(780, 470, 20, 20);
    rect(750, 470, 20, 20);
    fill(0, 0, 255);
    rect(810, 470, 20, 20 -player.reloadTimer/30);
    rect(780, 470, 20, 20 -player.rollCD/4.75);
    rect(750, 470, 20, 20 -player.attackTimer/ .75);
    stroke(200);
  }
}
