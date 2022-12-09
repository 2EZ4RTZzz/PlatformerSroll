class Bullet {
  PVector pos, originalPos;
  PVector vel;
  PVector dim;
  PImage[] imgs;
  String type;
  int index;

  Bullet(PVector pos, PVector vel, String type) {
    this.pos = pos;
    originalPos = pos.copy();
    this.vel = vel;
    this.type = type;
    
    if (type == "player"){
       //imgs = playerBulletImgs; 
    }
    
    if (type == "cat"){
       //imgs = catBulletImgs; 
    }
    //dim = new PVector(imgs[0].width, imgs[0].height);
    
    dim = new PVector(15, 4);
  }

  void drawMe() {
    pushMatrix();
    translate(pos.x, pos.y);
    //if (vel.x > 0) {
    //  scale(-1, 1);
    //}
    //image(imgs[index], -dim.x / 2, -dim.y / 2);
    noStroke();
    if (type == "player") fill(255, 128 , 0);
    if (type == "alian") fill(128, 128 , 255);
    rect(-dim.x / 2, -dim.y / 2, dim.x, dim.y, 5);
    popMatrix();
  }
  
  void move(){
     pos.add(vel); 
  }
  
  void update(){
     move();
     if (detectRange()){
       player.bullets.remove(this);
     }
  }
  
  boolean detectWall(){
    if (pos.x + dim.x / 2 > width || pos.x - dim.x / 2 < 0 || pos.y + dim.y / 2 > height || pos.y - dim.y / 2 < 0){
      return true;
    }
    return false;
  }
  
  boolean detectRange(){
    if (pos.x + dim.x / 2 > width || pos.x - dim.x / 2 < 0 || pos.y + dim.y / 2 > height || pos.y - dim.y / 2 < 0){
      return true;
    }
    if (pos.x > originalPos.x + random(180, 200)){
      return true;
    }
    return false;
  }
  
  boolean hit(Character target){
    float x = target.block.pos.x-player.pos.x * repeatX+target.pos.x;
    float y = target.block.pos.y+target.pos.y;
    
    //println(x, y, pos.x, pos.y);
    return dist(x, y, pos.x, pos.y) < dim.x/2+target.dim.x/2;
    
  }
}
