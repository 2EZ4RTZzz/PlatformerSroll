class Player extends Character {
  //fields
  boolean jumping = false;
  int amountOfKey = 0;
  int amountOfCoin = 0;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  int imgState;

  boolean fire = true;

  //a constructor to initialize the fields above with initial values
  Player(PVector pos) {
    super(pos);
    this.pos = pos;
    vel = new PVector(); //must create instance

    damp = 0.8;
    imgs = playerStandImgs;
    dim = new PVector(imgs[0].width, imgs[0].height);
    maxHealth = health = 100;
  }

  //update the physics for the character
  void update() {

    super.update();

    if (block instanceof MovingBlock) {
      MovingBlock b = (MovingBlock)block;
      if (b.direction == 0) pos.add(new PVector(b.vel.x/3, b.vel.y));
      if (b.direction == 1) pos.add(new PVector(b.vel.x, b.vel.y));
    }

    if (pos.y + dim.y/2 > height + 100) { //when it goes off the longest block let it land on the floor
       health = 0;
       reset();
    }

    checkBullets();

    if (imgState == 0) {
      imgs = playerStandImgs;
    }

    if (imgState == 1) {
      imgs = playerWalkImgs;
    }

    if (imgState == 2) {
      imgs = playerJumpImgs;
      index = 0;
    }

    if (block instanceof MovingBlock) {
      MovingBlock b = (MovingBlock)block;
      if (b.angle > 0) player.move(new PVector(2, 0));
      if (b.angle < 0) player.move(new PVector(-2, 0));
    }

    if (block instanceof SpringBlock) {
      SpringBlock b = (SpringBlock)block;
      if (b.isOn(player)) {
        b.index = 1;
      } else b.index = 0;
      if (up) b.index = 0;
    }
  }

  void checkBullets() {
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.drawMe();
      b.update();

      for (int j = 0; j < enemies.size(); j++) {
        Character e = enemies.get(j);
        if (b.hit(e) && e.deadCountdown == -1) {
          e.decreaseHealth(1);
          e.hitCountdown = 60;
          e.pos.x = e.pos.x;
          if (e.health == 0){
             e.dead(30);
             int n = int(random(1,3));
             for (int k = 0; k < n; k++){
               tokens.add(new Coin(e.block, new PVector(e.pos.x + k * 20, -100)));
             }
             
          }
          bullets.remove(b);
        }
      }
    }
  }

  void jump(PVector upAcc) {
    move(upAcc);
    jumping = true;
  }

  void landOn(Block b) {
    block = b;
    pos.y = b.pos.y - dim.y /2 - b.dim.y / 2;
    jumping = false;
    vel.y = 0;
  }

  void fall() {
    vel.y *= -1;
  }


  void drawMe() {
    if (hitCountdown % 2 == 0) {
      pushMatrix();
      
      if (!fire) translate(pos.x + random(-3, -2), pos.y);
      else translate(pos.x, pos.y);
      
      if (vel.x < 0) {
        scale(-1, 1);
      }

      image(imgs[index++ % imgs.length], -dim.x / 2, -dim.y / 2);
      
      image(playerGunImg, 0, -12);

      popMatrix();
    }
  }

  void drawMe2() {
    pushMatrix();

    //scale(sc);
    MovingBlock b = (MovingBlock)block;
    translate(b.pos.x - pos.x * repeatX, b.pos.y);
    rotate(radians(b.angle));
    translate(relPos.x, relPos.y);
    if (vel.x > 0) scale(-1, 1);
    image(imgs[index++ % imgs.length], -dim.x / 2, -dim.y / 2);


    popMatrix();
  }

  void fire() {
    if (fire) {
      PVector loc;
      if (vel.x >= 0)  loc = new PVector(pos.x + random(40, 50), pos.y + random(5, 10));
      else loc = new PVector(pos.x - random(40, 50), pos.y + random(5, 10));
      int dir;
      if (vel.x >= 0) dir = 1;
      else dir = -1;
      PVector speed = new PVector(5 * dir, 0);

      bullets.add(new Bullet(loc, speed, "player"));
      fire = false;
    }
  }

  void decreaseHealth(float n) {
    super.decreaseHealth(n);
    if (health == 0) {
      playerLifeNum--;
      if (playerLifeNum == 0) {
        println("Game over");
      } else {
        health = maxHealth;
        reset();
      }
    }
  }
  
  void reset(){
     pos = new PVector(20, 200); 
  }
  
}
