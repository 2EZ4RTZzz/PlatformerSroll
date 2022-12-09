class Explosion{
   PVector pos;
   ArrayList<Sprite> balls = new ArrayList<Sprite>();
   
   Explosion(PVector pos){
       this.pos = pos;
       
       for (int i = 0; i < 30; i++){
           balls.add(new Sprite(new PVector(pos.x, pos.y)));
       }
   }
   
   void update(){
       for (int i = 0; i < balls.size(); i++){
           Sprite s = balls.get(i);
           s.drawMe();
           s.update();
           if (s.dim.x == 0) balls.remove(s);
       }
   }
}
