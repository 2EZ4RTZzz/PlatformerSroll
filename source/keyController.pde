void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      player.imgState = 2;
      up = true;
      jumpSound.play(0);
    } else if (keyCode == LEFT) {
      player.imgState = 1;
      left = true;
    } else if (keyCode == RIGHT) {
      player.imgState = 1;
      right = true;
    }
  }

  if (key == ' ') {
    player.fire();
  }

  if (key == 'k' || key == 'K') {
    if (player.amountOfKey > 0) {
      player.amountOfKey--;
      for (int i = 0; i < blocks.size(); i++) {
        Block b = blocks.get(i);
        if (b instanceof DisintegrateBlock) {
          ((DisintegrateBlock)b).solid = true;
          ((DisintegrateBlock)b).countdown = 180;
        }
      }
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      player.imgState = 0;
      up = false;
    } else if (keyCode == LEFT) {
      player.imgState = 0;
      left = false;
    } else if (keyCode == RIGHT) {
      player.imgState = 0;
      right = false;
    }
  }

  if (!player.fire) {
    player.fire = true;
    fireSound.play(0);
  }
}
