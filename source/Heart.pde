class Heart extends Token{
  

  Heart(Block block, PVector rp) {
    super(block, rp);
    imgs = heartImgs;
    dim = new PVector(imgs[0].width, imgs[0].height);
    displayCountdown = 1800;
  }

  void drawMe(Character c) {
    noStroke();
    pushMatrix();
    translate(-c.pos.x*repeatX+block.pos.x, block.pos.y);
    translate(relPos.x, relPos.y);
    fill(255);
    textSize(15);
    textAlign(CENTER, CENTER);
    text(displayCountdown / 60 + 1, 0, -25);
    image(imgs[index], -dim.x / 2, -dim.y / 2);
    popMatrix();
  }

  //boolean colission(Character c) {
  //  float x = block.pos.x-c.pos.x * repeatX+relPos.x;
  //  float y = block.pos.y+relPos.y;
  //  return dist(x, y, c.pos.x, c.pos.y) < dim.x/2+c.dim.y/2;
  //}
}
