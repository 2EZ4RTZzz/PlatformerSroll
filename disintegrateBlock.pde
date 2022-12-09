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
    //noStroke();
    //pushMatrix();
    //translate(-c.pos.x * repeatX + pos.x, pos.y);
    //noStroke();
    //if (solid) alpha = 255;
    //else alpha = 80;
    //fill(255,0,0, alpha);
    
    //rect(-dim.x/2, -dim.y/2, dim.x, dim.y);
    
    //popMatrix();
    
    pushMatrix();
    translate(-c.pos.x * repeatX + pos.x, pos.y);
    
    if (solid) alpha = 255;
    else alpha = 80;
    fill(255,0,0, alpha);
    pushStyle();
    tint(255, alpha);

    image(imgs[0], -dim.x / 2, -dim.y / 2);
    for (int i = 0; i < tileAmount - 2; i++) {
      image(imgs[1], -dim.x / 2 + (i + 1) * imgs[0].width, -dim.y / 2);
    }
    image(imgs[imgs.length - 1], dim.x / 2 - imgs[0].width, -dim.y / 2);
    
    fill(255);
    textSize(20);
    textAlign(CENTER);
    if (solid) text(countdown / 60 + 1, 0, 0);
    popStyle();
    popMatrix();
  }
  
  void update(){
    //println(countdown);
    if (countdown > 0){
       countdown--;
       if (countdown == 0){
         solid = false;
         player.jumping = true;
         
         for (int i = 0; i < tokens.size(); i++) {
            Token t = tokens.get(i);
            if (t instanceof Switch){
               ((Switch)t).close();
            }
         }
       }
    }
  }
  
  void unlock(){
      solid = true;
      countdown = 300;
  }
  
}
