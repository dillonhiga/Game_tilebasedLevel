class Level3 extends Level {
  ArrayList<Enemy> enemyList = new ArrayList<Enemy>();
  ArrayList<Enemy2> enemyList2 = new ArrayList<Enemy2>();

  int w = 30;
       Boss boss = new Boss(960, 960, 500, 10, this);
  Level3() {
    

int[][] mapData ={
       {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
       {1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
       {1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
       {1,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,1},
       {1,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,1},
       {1,2,2,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,2,2,1},
       {1,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,1},
       {1,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,1},
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

    PVector  [] waypoint = new PVector[7];
    waypoint[0] = new PVector(537, 405);
    waypoint[1] = new PVector(1325, 405);
    waypoint[2] = new PVector(1325, 1501);
    waypoint[3] = new PVector(537, 1501);
    waypoint[4] = new PVector(1325, 1501);
    waypoint[5] = new PVector(1325, 405);
    waypoint[6] = new PVector(537, 405);

    enemyList2.add(new Enemy2(waypoint, .5, 0, 0, this));
    enemyList2.add(new Enemy2(waypoint, .5, 0, 1, this));
    enemyList2.add(new Enemy2(waypoint, .5, 0, 2, this));
    enemyList2.add(new Enemy2(waypoint, .5, 0, 3, this));
    enemyList2.add(new Enemy2(waypoint, 1, 0, 4, this));





    PVector  [] roofPatrol = new PVector[4];
    roofPatrol[0] = new PVector(100, 100);
    roofPatrol[1] = new PVector(100, 1770);
    roofPatrol[2] = new PVector(1770, 1770);
    roofPatrol[3] = new PVector(1770, 100);

    enemyList.add(new Enemy(roofPatrol, .5, 0, 0, this));
    enemyList.add(new Enemy(roofPatrol, .5, 0, 2, this));
    
    PVector  [] innerPatrol2 = new PVector[2];
    innerPatrol2 [0] = new PVector(1310, 405);
    innerPatrol2 [1] = new PVector(519, 405);


    enemyList.add(new Enemy(innerPatrol2, .5, 0, 0, this));

    
     PVector  [] innerPatrol3 = new PVector[2];
     innerPatrol3 [0] = new PVector(1310, 1437);
     innerPatrol3 [1] = new PVector(519, 1437);

    enemyList.add(new Enemy(innerPatrol3, .5, 0, 0, this));


    PVector  [] doorPatrol = new PVector[2];
    doorPatrol[0] = new PVector(1569, 1622);
    doorPatrol[1] = new PVector(1569, 215);


    enemyList.add(new Enemy(doorPatrol, .5, 0, 0, this));

    
    
    PVector  [] doorPatrol2 = new PVector[2];
    doorPatrol2[0] = new PVector(289, 215);
    doorPatrol2[1] = new PVector(289, 1622);


    enemyList.add(new Enemy(doorPatrol2, .5, 0, 0, this));
    

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
