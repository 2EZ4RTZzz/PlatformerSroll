PImage[] playerWalkImgs = new PImage[11];
PImage[] playerJumpImgs = new PImage[1];
PImage[] playerDuckImgs = new PImage[1];
PImage[] playerStandImgs = new PImage[1];
PImage[] heartImgs = new PImage[2];
PImage[] keyImgs = new PImage[2];
PImage[] catImgs = new PImage[4];
PImage[] groundImgs = new PImage[3];
PImage[] plateformImgs = new PImage[3];
PImage[] waterImgs = new PImage[2];
PImage[] tinyMushroomImgs = new PImage[7];
PImage[] springImgs = new PImage[2];
PImage[] shroomRedImgs = new PImage[4];
PImage[] snailImgs = new PImage[2];
PImage[] fishImgs = new PImage[2];
PImage stemBaseImg;
PImage stemCrownImg;
PImage stemVineImg;
PImage bgImg;
PImage cloud1Img;
PImage cloud2Img;
PImage cloud3Img;
PImage playerGunImg;
PImage bushImg;
PImage[] coinImgs = new PImage[2];

void loadAllImages() {

  playerStandImgs[0] = loadImage("p3_stand.png");
  playerStandImgs[0].resize(72/2, 97/2);
  playerJumpImgs[0] = loadImage("p3_jump.png");
  playerJumpImgs[0].resize(72/2, 97/2);
  for (int i = 0; i < playerWalkImgs.length; i++) {
    playerWalkImgs[i] = loadImage("p3_walk" + i + ".png");
    playerWalkImgs[i].resize(72/2, 97/2);
  }

  for (int i = 0; i < heartImgs.length; i++) {
    heartImgs[i] = loadImage("heart" + i + ".png");
    heartImgs[i].resize(25, 25);
  }

  for (int i = 0; i < keyImgs.length; i++) {
    keyImgs[i] = loadImage("key" + i + ".png");
    keyImgs[i].resize(30, 30);
  }

  for (int i = 0; i < catImgs.length; i++) {
    catImgs[i] = loadImage("p1_walk" + i + ".png");
    catImgs[i].resize(72 / 2, 97 / 2);
  }

  for (int i = 0; i < groundImgs.length; i++) {
    groundImgs[i] = loadImage("ground" + i + ".png");
    groundImgs[i].resize(40, 40);
  }

  for (int i = 0; i < plateformImgs.length; i++) {
    plateformImgs[i] = loadImage("plateform" + i + ".png");
    plateformImgs[i].resize(40, 20);
  }

  for (int i = 0; i < waterImgs.length; i++) {
    waterImgs[i] = loadImage("water" + i + ".png");
    waterImgs[i].resize(40, 20);
  }

  for (int i = 0; i < tinyMushroomImgs.length; i++) {
    tinyMushroomImgs[i] = loadImage("mushroom" + i + ".png");
    tinyMushroomImgs[i].resize(40, 40);
  }

  for (int i = 0; i < springImgs.length; i++) {
    springImgs[i] = loadImage("spring" + i + ".png");
    springImgs[i].resize(30, 30);
  }

  for (int i = 0; i < shroomRedImgs.length; i++) {
    shroomRedImgs[i] = loadImage("shroomRed" + i + ".png");
    shroomRedImgs[i].resize(60, 60);
  }
  
  for (int i = 0; i < snailImgs.length; i++) {
    snailImgs[i] = loadImage("snailWalk" + i + ".png");
    snailImgs[i].resize(54*3/ 5, 31*3/5);
  }
  
  for (int i = 0; i < coinImgs.length; i++) {
    coinImgs[i] = loadImage("coin" + i + ".png");
    coinImgs[i].resize(20, 20);
  }
  
  for (int i = 0; i < fishImgs.length; i++) {
    fishImgs[i] = loadImage("fishSwim" + i + ".png");
    fishImgs[i].resize(62 / 3, 43 / 3);
  }

  bgImg = loadImage("bg.png");
  bgImg.resize(width, height);

  cloud1Img = loadImage("cloud1.png");
  cloud2Img = loadImage("cloud1.png");
  cloud3Img = loadImage("cloud1.png");

  stemBaseImg = loadImage("stemBase.png");
  stemCrownImg = loadImage("stemCrown.png");
  stemVineImg = loadImage("stemVine.png");

  playerGunImg = loadImage("raygun.png");
  playerGunImg.resize(40, 40);
  
  bushImg = loadImage("bush.png");
  bushImg.resize(216 / 2, 72/ 2);
  
}
