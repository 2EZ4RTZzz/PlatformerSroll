class DisintegrateBlock extends Block{
  boolean solid;
  int alpha;
  int countdown;
  
  DisintegrateBlock(PVector pos, int amount, PImage[] images) {
    super(pos, amount, images);
    solid = false;
    alpha = 80;
  }
  

  void drawMe(Character c) {
    noStroke();
    pushMatrix();
    translate(-c.pos.x * repeatX + pos.x, pos.y);
    noStroke();
    if (solid) alpha = 255;
    else alpha = 80;
    fill(255,0,0, alpha);
    
    rect(-dim.x/2, -dim.y/2, dim.x, dim.y);
    fill(0);
    if (solid) text(countdown / 60 + 1, 0, 0);
    popMatrix();
  }
  
  void update(){
    //println(countdown);
    if (countdown > 0){
       countdown--;
       if (countdown == 0){
         solid = false;
         player.jumping = true;
       }
    }
  }
  
}
