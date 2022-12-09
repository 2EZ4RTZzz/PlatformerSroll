class Alian extends Character {
  //fields

  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  //a constructor to initialize the fields above with initial values
  Alian(Block b, PVector rp) {
    super(rp);
    damp = 1;
    this.block = b;
    vel = new PVector(random(-1, -0.5), 0); //must create instance
    imgs = catImgs;
    dim = new PVector(imgs[0].width, imgs[0].height);
    health = 3;
  }

  //update the physics for the character
  void update() {
    super.update();

    if (pos.x + dim.x / 2 > block.dim.x / 2 || pos.x - dim.x / 2 < -block.dim.x / 2) {
      vel.x *= -1;
    }

    //println(dist(-player.pos.x*repeatX+block.pos.x + pos.x, block.pos.y, player.pos.x, player.pos.y));
    if (dist(-player.pos.x*repeatX+block.pos.x + pos.x, block.pos.y, player.pos.x, player.pos.y) < 120 && frameCount % 20 == 0 && vel.x < 0) {
      fireSound.play(0);
      fire();
    }

    checkBullets();
  }


  void drawMe(Character c) {
    if (hitCountdown % 2 == 0) {
      pushMatrix();
      translate(-c.pos.x*repeatX+block.pos.x, block.pos.y);
      translate(pos.x, pos.y); //relative position to block stand on
      if (deadCountdown > 0) scale(map(deadCountdown, 0, 30, 0, 1));
      if (vel.x < 0) scale(-1, 1);

      if (frameCount % 5 == 0) index++;
      image(imgs[index%imgs.length], -dim.x / 2, -dim.y / 2);
      popMatrix();
    }
  }

  void fire() {

    PVector loc;
    if (vel.x >= 0)  loc = new PVector(pos.x + 50, pos.y + 7);
    else loc = new PVector(-player.pos.x * repeatX + block.pos.x, block.pos.y + pos.y + 7);
    PVector speed = new PVector(-10, 0);

    bullets.add(new Bullet(loc, speed, "alian"));
  }

  void checkBullets() {
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.drawMe();
      b.update();

      if (b.hit(player) && player.deadCountdown == -1) {
        player.decreaseHealth(100);
        player.hitCountdown = 60;

        if (player.health == 0) {
          player.dead(30);
        }
        bullets.remove(b);
      }
    }
  }
}
