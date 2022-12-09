import ddf.minim.*;

float speed = 2;
float upSpeed = 20;
PVector upForce = new PVector(0, -speed * 20);
PVector upForcePower = new PVector(0, -speed * 30);
PVector leftForce = new PVector(-speed, 0);
PVector rightForce = new PVector(speed, 0);
boolean up, left, right;
float grav = 2;
PVector gravForce = new PVector(0, grav);
int repeatX=2;
int playerLifeNum = 3;

Player player;
ArrayList<Block> blocks = new ArrayList<Block>();
ArrayList<Token> tokens = new ArrayList<Token>();
ArrayList<Character> enemies = new ArrayList<Character>();
ArrayList<Cloud> clouds = new ArrayList<Cloud>();

Explosion explosion;

GroundBase groundBase;



Background bg;


//int countdown;




void drawHUD() {
  for (int i = 0; i < playerLifeNum; i++) {
    image(heartImgs[0], 50 + (heartImgs[0].width + 5) * i, 20);
  }

  pushStyle();
  noStroke();
  fill(255, 0, 0);
  rect(50, 50, map(player.health, 0, player.maxHealth, 0, 100), 10, 10);
  stroke(0);
  strokeWeight(3);
  noFill();
  rect(50, 50, 100, 10, 10);
  popStyle();

  image(keyImgs[0], width - 300, 20);
  text(player.amountOfKey, width - 270, 50);
  image(coinImgs[0], width - 200, 20);
  text(player.amountOfCoin, width - 170, 50);
}

void loadAllBlocks() {
  blocks.add(new WaterBlock(new PVector(540, height - 10), 7, waterImgs));
  blocks.add(new GroundBlock(new PVector(groundImgs[0].width * 10 / 2, height - 20), 10, groundImgs, false));
  blocks.add(new Block(new PVector(200, height - 120), 3, plateformImgs));
  blocks.add(new Block(new PVector(360, height - 220), 3, plateformImgs));
  blocks.add(new GroundBlock(new PVector(880, height - 20), 10, groundImgs, false));
  blocks.add(new MovingBlock(new PVector(600, height - 140), 3, 0, plateformImgs));
  blocks.add(new Block(new PVector(750, height - 240), 3, plateformImgs));
  blocks.add(new Block(new PVector(830, height - 320), 3, plateformImgs));
  blocks.add(new Block(new PVector(940, height - 500), 3, plateformImgs));
  blocks.add(new SpringBlock(new PVector(850, height - 345), 1, springImgs));
  blocks.add(new MovingBlock(new PVector(1150, height - 345), 2, 1, plateformImgs));
  blocks.add(new GroundBlock(new PVector(1350, height - 20), 5, ground2Imgs, false));
  //blocks.add(new Block(new PVector(1250, height - 245), 2, plateformImgs));
  blocks.add(new DisintegrateBlock(new PVector(1180, height - 120), 3, plateformImgs));
  blocks.add(new MovingBlock(new PVector(1350, height - 400), 4, 2, shroomRedImgs));
  blocks.add(new MovingBlock(new PVector(1550, height - 345), 2, 1, plateformImgs));
  blocks.add(new GroundBlock(new PVector(2500, height - 160), 28, ground2Imgs, true));
}


void setup() {
  size(1000, 600);
  stroke(200);
  strokeWeight(2);
  fill(63);
  //player = new Character(new PVector(width/4, height/4));
  loadAllImages();
  player = new Player(new PVector(30, 50));
  player.jumping = true;

  bg = new Background("bg.png", 2, 1, 0.5);


  clouds.add(new Cloud(cloud1Img));
  clouds.add(new Cloud(cloud2Img));
  clouds.add(new Cloud(cloud3Img));


  loadAllBlocks();

  //tokens.add(new Heart(blocks.get(2), new PVector(-50, -80)));
  tokens.add(new Key(blocks.get(11), new PVector(0, -40)));
  tokens.add(new Switch(blocks.get(11), new PVector(60, -45)));

  enemies.add(new Snail(blocks.get(2), new PVector(30, -17)));
  enemies.add(new Snail(blocks.get(3), new PVector(30, -17)));
  enemies.add(new Snail(blocks.get(4), new PVector(random(-160, 160), -28)));
  enemies.add(new Snail(blocks.get(4), new PVector(random(-160, 160), -28)));
  enemies.add(new Snail(blocks.get(4), new PVector(random(-160, 160), -28)));
  enemies.add(new Snail(blocks.get(4), new PVector(random(-160, 160), -28)));
  enemies.add(new Alian(blocks.get(8), new PVector(random(-30, 30), -30)));
  enemies.add(new Alian(blocks.get(7), new PVector(random(-30, 30), -30)));
  enemies.add(new Alian(blocks.get(6), new PVector(random(30, 30), -30)));
  enemies.add(new Alian(blocks.get(6), new PVector(random(-30, 30), -30)));

  enemies.add(new Fish(blocks.get(0), new PVector(random(-30, 20), 0)));
  enemies.add(new Fish(blocks.get(0), new PVector(random(-30, 10), 0)));
  enemies.add(new Fish(blocks.get(0), new PVector(random(-30, 15), 0)));
  enemies.add(new Fish(blocks.get(0), new PVector(random(-30, 15), 0)));
  enemies.add(new Fish(blocks.get(0), new PVector(random(-30, 15), 0)));
  //enemies.add(new Alian(blocks.get(2), new PVector(30, -32)));
  //enemies.add(new Alian(blocks.get(5), new PVector(30, -32)));
  //enemies.add(new Alian(blocks.get(6), new PVector(30, -32)));
  //enemies.add(new Alian(blocks.get(4), new PVector(-50, -45)));
  //enemies.add(new Alian(blocks.get(4), new PVector(-30, -45)));
  //enemies.add(new Alian(blocks.get(4), new PVector(30, -45)));


  loadAllAudios();

  bgMusic.loop();
}

void draw() {
  //image(bgImg, 0, 0);
  bg.drawMe(new PVector(-player.pos.x, 0));

  //player.detectFloor();
  drawHUD();


  float x = 1000;
  float y = 200;
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 20; j++) {
      image(groundBaseImg, x + j * groundImgs[1].width, y + i * groundImgs[1].height);
    }
  }

  for (Cloud c : clouds) {
    c.update();
  }

  if (up && !player.jumping) {
    if (player.block instanceof SpringBlock) player.jump(upForcePower);
    else player.jump(upForce);
  }
  if (left) player.move(leftForce);
  if (right) player.move(rightForce);


  //leave the current block
  if (player.block != null) {
    if (!player.block.isOn(player)) {
      player.jumping = true;
    }
  }

  //println(player.jumping);

  if (player.jumping) {

    player.move(gravForce);
    for (int i = 0; i < blocks.size(); i++) {
      Block b = blocks.get(i);
      if (b.bump(player)) {
        if (b instanceof WaterBlock) {
          player.decreaseHealth(0.2);
          player.pos.y = height - player.dim.y / 2;
        } else {
          if (player.vel.y >= 0) {
            if (b instanceof DisintegrateBlock) {
              if (((DisintegrateBlock)b).solid == true) {
                player.landOn(b);
              }
            } else {
              player.landOn(b);
            }
          } else {
            if (!(b instanceof SpringBlock) && !(b instanceof MovingBlock)) {
              player.pos.y = b.pos.y + b.dim.y / 2 + player.dim.y / 2;
              player.fall();
            }
          }
        }
      }
    }
  }


  if (player.pos.x > width) player.pos.x = 20;  //if player is going off screen make it start from the begining to keep scrolling
  if (player.pos.x - player.imgs[0].width / 2 <= 0) player.pos.x = player.imgs[0].width / 2;  //if player is going off screen make it start from the begining to keep scrolling

  for (int i = 0; i < enemies.size(); i++) {
    Character e = enemies.get(i);
    e.drawMe(player);
    e.update();
    if (e.deadCountdown == 0) {
      enemies.remove(e);
      continue;
    }

    if (e.collision(player)) {
      if (player.hitCountdown == 0) {
        player.hitCountdown = 60;
        hurtSound.play(0);
      }
      player.decreaseHealth(1);
    }
  }

  for (int i = 0; i < blocks.size(); i++) {
    Block b = blocks.get(i);
    b.drawMe(player);
    b.update();
    if (b instanceof MovingBlock) {
      ((MovingBlock)b).move();
    }
  }


  for (int i = 0; i < tokens.size(); i++) {
    Token t = tokens.get(i);
    t.drawMe(player);
    t.update();

    if (t.displayCountdown == 0) {
      tokens.remove(t);
      continue;
    }
    if (t.collision(player)) {
      if (t instanceof Switch ) {
        //switchSound.play(0)
        if (keyPressed && key == 's') {
          if (((Switch)t).countdown == -1) {
            ((Switch)t).open();
            for (int j = 0; j < blocks.size(); j++) {
              Block b = blocks.get(j);
              if (b instanceof DisintegrateBlock) {
                ((DisintegrateBlock)b).unlock();
              }
            }
          }
        }
      } else {
        hitTokenSound.play(0);
        if (t instanceof Heart) {
          playerLifeNum += 1;
        }
        if (t instanceof Key) {
          player.amountOfKey += 1;
        }
        if (t instanceof Coin) {
          player.amountOfCoin += 1;
        }
        tokens.remove(t);
        explosion = new Explosion(new PVector(t.block.pos.x + t.relPos.x - player.pos.x * repeatX, t.block.pos.y + t.relPos.y));
      }
    }
  }

  if (explosion != null) explosion.update();



  player.update();
  if (player.block instanceof MovingBlock) {
    MovingBlock b = (MovingBlock)player.block;
    if (b.direction == 2 && player.block.isOn(player)) {
      player.drawMe2();
    } else {
      player.drawMe();
    }
  } else {
    player.drawMe();
  }

  if (player.amountOfCoin == 15) {
    player.amountOfCoin -= 15;
    tokens.add(new Heart(blocks.get(10), new PVector(0, -40)));
  }
  
  text(mouseX + "," + mouseY, mouseX, mouseY);
}
