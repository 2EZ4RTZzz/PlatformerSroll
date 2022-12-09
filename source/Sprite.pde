class Sprite{
   PVector pos;
   PVector vel;
   PVector dim;
   color c;

  Sprite(PVector pos) {
    this.pos = pos;
    this.vel = new PVector(random(-3, 3), random(-3, 3));
    
    int size = int(random(5, 10));
    dim = new PVector(size,size);
    c = color(random(255), random(255), random(255));
  }

  void drawMe() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(c);
    noStroke();
    ellipse(0, 0, dim.x, dim.y);
    popMatrix();
  }
  
  void move(){
     pos.add(vel); 
     
  }
  
  void update(){
     move();
     
     dim.sub(new PVector(0.2, 0.2));
     if (dim.x <= 0) dim.x= 0;
     if (dim.y <= 0) dim.y= 0;
  }
}
