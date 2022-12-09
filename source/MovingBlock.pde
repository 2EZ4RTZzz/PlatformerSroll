class MovingBlock extends Block{
  PVector vel;
  int direction; //0 is horizental, 1 is vertical
  float offset;
  float angle;
  float angle_speed;
 
  MovingBlock (PVector pos, int amount, int d, PImage[] images) {
    super(pos, amount, images);
    direction = d;
    if (direction == 0) vel = new PVector(-1, 0);
    if (direction == 1) vel = new PVector(0, 2);
    if (direction == 2) {
      vel = new PVector();
      angle_speed = 0.5;
    }
    offset = 100;
  }
  
  void drawMe(Character c) {
    pushMatrix();
    translate(-c.pos.x * repeatX + pos.x, pos.y);
    if (direction == 2){
      image(stemCrownImg, -35, -10);
      image(stemVineImg, -35, -10 + stemCrownImg.height / 2);
      image(stemVineImg, -35, -10 + stemCrownImg.height / 2 + stemVineImg.height);
      image(stemVineImg, -35, -10 + stemCrownImg.height / 2 + stemVineImg.height * 2);
       image(stemVineImg, -35, -10 + stemCrownImg.height / 2 + stemVineImg.height * 3);
        image(stemBaseImg, -35, -10 + stemCrownImg.height / 2 + stemVineImg.height * 4 - 15);
    }
    
    pushMatrix();
    rotate(radians(angle));

    image(imgs[0], -dim.x / 2, -dim.y / 2);
    for (int i = 0; i < tileAmount - 2; i++) {
      image(imgs[1], -dim.x / 2 + (i + 1) * imgs[0].width, -dim.y / 2);
    }
    image(imgs[imgs.length - 1], dim.x / 2 - imgs[0].width, -dim.y / 2);
    popMatrix();
    
    popMatrix();
    
    //pushMatrix();
    //translate(-c.pos.x * repeatX + pos.x, pos.y);
    
    //popMatrix();
  }
  

  //void drawMe(Character c) {
  //  noStroke();
  //  pushMatrix();
  //  translate(-c.pos.x * repeatX + pos.x, pos.y);
  //  rotate(radians(angle));
  //  noStroke();
  //  fill(50, 50, 50);
  //  rect(-dim.x/2, -dim.y/2, dim.x, dim.y);
  //  popMatrix();
  //}
  
  void move(){
     pos.add(vel); 
     
     if (direction == 0){
       if (pos.x > originalPos.x + offset || pos.x < originalPos.x - offset){
        vel.x *= -1; 
       }
     }
     
     if (direction == 1){
       if (pos.y > originalPos.y + offset || pos.y < originalPos.y - offset){
        vel.y *= -1; 
       }
     }
     
     if (direction == 2){
       
       angle += angle_speed;
       
       if (angle > 20 || angle < -20){
        angle_speed *= -1; 
       }
     }
     
  }
  
  
}
