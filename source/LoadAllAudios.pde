AudioPlayer bgMusic;
AudioPlayer jumpSound;
AudioPlayer fireSound;
AudioPlayer hitSound;
AudioPlayer hurtSound;
AudioPlayer hitTokenSound;
Minim minim;

void loadAllAudios(){
   minim = new Minim (this);
  bgMusic = minim.loadFile("audio/bgMusic.mp3");
  fireSound = minim.loadFile("audio/laser-gun.mp3");
  jumpSound = minim.loadFile("audio/jump.mp3"); 
  hurtSound = minim.loadFile("audio/hurt.wav"); 
  hitTokenSound = minim.loadFile("audio/hitToken.wav"); 
}
