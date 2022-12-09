class Token {
  PVector relPos; //relative position of token with respect to the block b
  PVector originalRelPos; //relative position of token with respect to the block b
  PVector dim; //size of the token circle
  Block block;    //the block the token is positioned above
  int displayCountdown = -1;
  //float sc;
  
  PImage[] imgs;
  int index = 0;

  Token(Block b, PVector rp) {
    relPos = rp;
    originalRelPos = relPos.copy();
    this.block = b;
  }

  void drawMe(Character c) {
    
  }

  boolean collision(Character c) {
    float x = block.pos.x-c.pos.x * repeatX+relPos.x;
    float y = block.pos.y+relPos.y;
    //println(x, y, c.pos.x, c.pos.y);
    return dist(x, y, c.pos.x, c.pos.y) < dim.x/2+c.dim.y/2;
  }
  
  void update(){
      if (frameCount % 10 == 0){
         index++; 
         if (index == imgs.length) index = 0;
      }
      
      if (displayCountdown > 0) displayCountdown--;
  }
  
  void setDisplayCountdown(int n){
     displayCountdown = n;
  }
}
