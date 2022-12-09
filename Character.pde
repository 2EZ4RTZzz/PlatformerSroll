class Character {
  //fields
  PVector pos, relPos, vel, dim;
  float damp = 1; //constant damping factor

  Block block = null;

  float health;
  float maxHealth;
  PImage[] imgs;
  int index;
  int hitCountdown;
  int deadCountdown = -1;
  float sc = 1;
  //float sc;

  //a constructor to initialize the fields above with initial values
  Character(PVector pos) {
    this.pos = pos;
    vel = new PVector(); //must create instance
    dim = new PVector();
  }
  //move method, PVector force as parameter, add to acceleration
  void move(PVector acc) {
    vel.add(acc);
  }

  //update the physics for the character
  void update() {
    vel.x *= pow(damp, 4); //multiply velocity by dampening factor (0.9-0.99);
    vel.y *= damp; //multiply velocity by dampening factor (0.9-0.99);
    pos.add(vel); //add velocity to position (moves character)
    
    if (block != null){
       relPos = new PVector(pos.x - block.pos.x + pos.x * repeatX, pos.y - block.pos.y);
    }
    
    if (deadCountdown > 0) deadCountdown--;
    if (hitCountdown > 0) hitCountdown--;
  }

  void drawMe() {
    pushMatrix();
    translate(pos.x, pos.y);
    ellipse(0, 0, dim.x, dim.y);
    popMatrix();
  }
  
  void drawMe(Character c){
    
  }
  
  void decreaseHealth(float n){
     health -= n;
     if (health < 0) health = 0;
  }
  
  boolean collision(Character c) {
    float x = block.pos.x-c.pos.x*repeatX+pos.x;
    float y = block.pos.y+pos.y;
    //println(x, y, c.pos.x, c.pos.y);
    return dist(x, y, c.pos.x, c.pos.y) < dim.x/2+c.dim.y/2;
  }
  
  void dead(int n){
     deadCountdown = n; 
     vel.mult(0);
  }
}
