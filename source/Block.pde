class Block {
  PVector pos, originalPos, dim;
  PImage[] imgs;
  int tileAmount;

  Block(PVector pos, int amount, PImage[] images) {
    this.pos = pos;
    tileAmount = amount;
    originalPos = new PVector(pos.x, pos.y);
    this.imgs = images;
    this.dim = new PVector(tileAmount * imgs[0].width, imgs[0].height);
  }
  boolean isOn(Character c) {
    //if (abs(c.pos.x - pos.x) < c.dim.x / 2 + dim.x / 2) {
    if (abs(c.pos.x * repeatX - (pos.x-c.pos.x)) < c.dim.x / 2 + dim.x / 2) {
      return true;
    }
    return false;
  }
  boolean bump(Character c) {
    if (abs(c.pos.x * repeatX - (pos.x-c.pos.x)) < c.dim.x / 2 + dim.x / 2 &&
      //if (abs(c.pos.x - pos.x )< c.dim.x / 2 + dim.x / 2 &&
      abs(c.pos.y - pos.y) < c.dim.y / 2 + dim.y / 2) {
        //println("hit");
      return true;
    }
    return false;
  }

  void drawMe(Character c) {
    pushMatrix();
    translate(-c.pos.x * repeatX + pos.x, pos.y);

    image(imgs[0], -dim.x / 2, -dim.y / 2);
    for (int i = 0; i < tileAmount - 2; i++) {
      image(imgs[1], -dim.x / 2 + (i + 1) * imgs[0].width, -dim.y / 2);
    }
    image(imgs[imgs.length - 1], dim.x / 2 - imgs[0].width, -dim.y / 2);
    popMatrix();
  }

  void update() {
  }
}
