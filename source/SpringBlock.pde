class SpringBlock extends Block{
  int index;
  
  SpringBlock(PVector pos, int amount, PImage[] images) {
    super(pos, amount, images);
    
  }
 
  void drawMe(Character c) {
    pushMatrix();
    translate(-c.pos.x * repeatX + pos.x, pos.y);
  
    image(imgs[index], -dim.x / 2, -dim.y / 2);
 
    popMatrix();
  }
}
