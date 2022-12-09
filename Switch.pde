class Switch extends Token {
  int countdown = -1;
  
  Switch(Block block, PVector rp) {
    super(block, rp);
    imgs = switchImgs;
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
  
  void update(){
    if (countdown > 0) {
      countdown--;
      if (countdown == 0){
        
      }
    
      if (countdown >0 && countdown <= 10){
         index = 2;
      }
      
      if (countdown >=11 && countdown <= 20){
         index = 1;
      }
    
    }
  }
  
  void open(){
    countdown = 20;
  }
  
  void close(){
     index = 0;
     countdown = -1;
  }
}
