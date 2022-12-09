class Fish extends Character {
  //fields
  boolean jump;
  PVector g = new PVector(); //gravity
  int red,green,blue;
  

  //a constructor to initialize the fields above with initial values
  Fish(Block b, PVector rp) {
    super(rp);
    damp = 1;
    this.block = b;
    vel = new PVector(random(-0.8, 0.8), 0); //must create instance
    imgs = fishImgs;
    dim = new PVector(imgs[0].width, imgs[0].height);
    health = 1;
    sc = random(0.5, 1);
    red = int(random(128));
    green = int(random(128));
    blue = 255;
  }

  //update the physics for the character
  void update() {
    super.update();
    vel.add(g);
    
    if (pos.x + dim.x / 2 > block.dim.x / 2 || pos.x - dim.x / 2 < -block.dim.x / 2) {
      vel.x *= -1;
    }
    
    float n = random(1, 500);
    if (n < 2 && jump == false){
       jump = true;
       vel.y = random(-5, -20);
       vel.x *= 3;
       g = new PVector(0, 0.3);
    }
    
    if (pos.y > 0) {
      jump = false;
      g.mult(0);
      vel.y = 0;
      vel.x /= 3;
      pos.y = random(0, -5);
    }
  }


  void drawMe(Character c) {
    if (hitCountdown % 2 == 0){
      pushMatrix();
      translate(-c.pos.x*repeatX+block.pos.x, block.pos.y);
      translate(pos.x, pos.y); //relative position to block stand on
      scale(sc);
      rotate(vel.heading() + PI);
      
      if (deadCountdown > 0) scale(map(deadCountdown, 0, 30, 0, 1));
      if (vel.x > 0) scale(1, -1);
      
      if (frameCount % 5 == 0) index++;
      pushStyle();
      tint(red, green, blue);
      image(imgs[index%imgs.length], -dim.x / 2, -dim.y / 2);
      popStyle();
      popMatrix();
    }
  }
}
