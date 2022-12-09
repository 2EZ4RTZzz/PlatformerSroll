class GroundBlock extends Block{
  int mrAmt = int(random(2, 10));
  PVector[] mrPosArr = new PVector[mrAmt];
  int[] mrIndexsArr = new int[mrAmt];
  int bushAmount = int(random(1, 3));
  PVector[] bushPosArr = new PVector[bushAmount];
  float[] bushPosScArr = new float[bushAmount];

  
  GroundBlock(PVector pos, int amount, PImage[] images) {
    super(pos, amount, images);
    for (int i = 0; i < mrPosArr.length; i++){
      mrPosArr[i] = new PVector(random(-dim.x / 2 + 20, dim.x / 2-20), -dim.y / 2 - tinyMushroomImgs[0].height);
    }
    
    for (int i = 0; i < mrIndexsArr.length; i++){
      mrIndexsArr[i] = int(random(tinyMushroomImgs.length));
    }
    
    for (int i = 0; i < bushPosScArr.length; i++){
      bushPosScArr[i] = random(0.5, 1.5);
    }
    
    for (int i = 0; i < bushPosArr.length; i++){
      bushPosArr[i] = new PVector(random(-dim.x / 2 , dim.x / 2-bushImg.width / 2 * bushPosScArr[i]), -dim.y / 2);
    }
    
    

  }
 
  void drawMe(Character c) {
    super.drawMe(c);
    
    pushMatrix();
    translate(-c.pos.x * repeatX + pos.x, pos.y);
    
    for (int i = 0; i < bushPosArr.length; i++){
      pushMatrix();
      scale(bushPosScArr[i]);
      //println(bushPosArr[i].x , bushPosArr[i].y );
      image(bushImg, bushPosArr[i].x , bushPosArr[i].y );
      popMatrix();
    }
    popMatrix();
    
    
    

    pushMatrix();
    translate(-c.pos.x * repeatX + pos.x, pos.y);
   
    for (int i = 0; i < mrPosArr.length; i++){
      //println(mrIndexsArr[i]);
      image(tinyMushroomImgs[mrIndexsArr[i]], mrPosArr[i].x, mrPosArr[i].y);
    }
    
    
    
    popMatrix();
  }
}
