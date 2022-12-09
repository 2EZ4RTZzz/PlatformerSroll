class Snail extends Character {
  //fields

  //a constructor to initialize the fields above with initial values
  Snail(Block b, PVector rp) {
    super(rp);
    damp = 1;
    this.block = b;
    vel = new PVector(random(-0.5, 0.5), 0); //must create instance
    imgs = snailImgs;
    dim = new PVector(imgs[0].width, imgs[0].height);
    health = 1;
    sc = random(1, 1.5);
  }

  //update the physics for the character
  void update() {
    super.update();
    
    if (pos.x + dim.x / 2 > block.dim.x / 2 || pos.x - dim.x / 2 < -block.dim.x / 2) {
      vel.x *= -1;
    }
  }


  void drawMe(Character c) {
    if (hitCountdown % 2 == 0){
      pushMatrix();
      translate(-c.pos.x*repeatX+block.pos.x, block.pos.y);
      translate(pos.x, pos.y); //relative position to block stand on
      scale(sc);
      if (deadCountdown > 0) scale(map(deadCountdown, 0, 30, 0, 1));
      if (vel.x > 0) scale(-1, 1);
      
      if (frameCount % 8 == 0) index++;
      image(imgs[index%imgs.length], -dim.x / 2, -dim.y / 2);
      popMatrix();
    }
  }
}
