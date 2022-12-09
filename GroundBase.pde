class GroundBase{
  PVector pos, dim;
  PImage img;
  int tileAmountOfWidth;
  int tileAmountOfHeight;
  
  GroundBase(PVector pos, int amountW, int amountH, PImage image) {
      this.pos = pos;
      img = image;
      tileAmountOfWidth = amountW;
      tileAmountOfHeight = amountH;
      this.dim = new PVector(tileAmountOfWidth * img.width, tileAmountOfHeight * img.height);
  }
 
  void drawMe(Character c) {

    
    pushMatrix();
    translate(-c.pos.x * repeatX + pos.x, pos.y);
    
    for (int y = 0; y < dim.y; y += img.height){
      for (int x = 0; x < dim.x; x += img.width){
        image(img, x, y);
      }
    }
    
    popMatrix();
  }
}
