class Cloud{
   PVector pos;
   PVector vel;
   PImage img;
   float sc;
   
   Cloud(PImage img){
     this.pos = new PVector(random(width), random(20, height / 3));
     vel = new PVector(random(0.1, 0.3), 0);
     this.img = img;
     sc = random(0.5, 1);
   }
   
   void drawMe(){
      pushMatrix();
      translate(pos.x, pos.y);
      scale(sc);
      image(img, -img.width / 2, -img.height / 2);
      popMatrix();
   }
   
   void move(){
      pos.add(vel); 
   }
   
   void update(){
      drawMe();
      move();
      detectWall();
   }
   
   void detectWall(){
      if (pos.x - img.width / 2 > width) {
         pos.x = - img.width / 2; 
      }
      
      if (pos.x + img.width / 2 < 0) {
         pos.x = width + img.width / 2; 
      }
   }
}
