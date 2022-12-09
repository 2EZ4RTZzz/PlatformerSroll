class Key extends Token{
  

  Key(Block block, PVector rp) {
    super(block, rp);
    imgs = keyImgs;
    dim = new PVector(imgs[0].width, imgs[0].height);
  
  }

  void drawMe(Character c) {
    noStroke();
    pushMatrix();
    translate(-c.pos.x*repeatX+block.pos.x, block.pos.y);
    translate(relPos.x, relPos.y);
    image(imgs[index], -dim.x / 2, -dim.y / 2);
    popMatrix();
  }

  //boolean colission(Character c) {
  //  float x = block.pos.x-c.pos.x * repeatX+relPos.x;
  //  float y = block.pos.y+relPos.y;
  //  return dist(x, y, c.pos.x, c.pos.y) < dim.x/2+c.dim.y/2;
  //}
}
