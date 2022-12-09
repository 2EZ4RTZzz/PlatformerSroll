class WaterBlock extends Block{
  WaterBlock(PVector pos, int amount, PImage[] images) {
    super(pos,amount, images);
    
  }
  

  void drawMe(Character c) {
    noStroke();
    pushMatrix();
    translate(-c.pos.x * repeatX + pos.x, pos.y);
    //if (frameCount % 10 == 0){
    //   scale(-1, 1); 
    //}
    noStroke();
    fill(50, 50, 50);
  
   pushStyle();
      tint(255, 200);
    image(imgs[0], -dim.x / 2, -dim.y / 2);
    for (int i = 0; i < tileAmount - 2; i++){
      image(imgs[1], -dim.x / 2 + (i + 1) * imgs[0].width, -dim.y / 2);
    }
    image(imgs[imgs.length - 1], dim.x / 2 - imgs[0].width, -dim.y / 2);
    noFill();
    stroke(0);
    //rect(-dim.x  /2, -dim.y / 2, dim.x, dim.y);
   popStyle();
    popMatrix();
  }
}
