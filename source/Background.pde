class Background {
  PImage img;
  int repeatX, repeatY;
  float speed;
  
//  Background(String path, int repeatX, int repeatY) {
  Background(String path, int repeatX, int repeatY, float speed) {
      img = loadImage(path);
      img.resize(img.width, height);
      this.repeatX = repeatX;
      this.repeatY = repeatY;
      this.speed = speed;
    }
//    void drawMe() {
//      PVector pos = new PVector(0, frameCount * 2);
    void drawMe(PVector pos) {
      pos.mult(speed);

      int tilesX = -(floor(pos.x / img.width));
      //println(pos, speed, floor(pos.x / img.width));
      for (int i = tilesX-1; i < tilesX+repeatX; i++) {
          image(img, pos.x + img.width * i, pos.y);
      }
    }
  }
