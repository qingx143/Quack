import fisica.*;
FWorld world;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer main, main2, main3, introBGM, pong, breakout;

color whiteish = #FFFCCD;
color creamish = #E4F090;
color cyan = #188266;
color lilac = #6727F2;
color lavendar = #4F26A6;
color dark = #151226;
color blue = #3552F2;
color red = #FF5039;
color orange = #FF9439;
color green = #3FD869;//rps
color dgreen = #0B9B32;//rps
color pink = #F43779;
color purple = #AD2BAD;
color ocean = #2F2BAD;
color brown = #935028;
color bkg;

PImage[] slide0s = new PImage[1];
PImage[] slide1s = new PImage[3];
PImage[] slide2s = new PImage[3];
PImage[] slide3s = new PImage[2];
PImage[] slide4s = new PImage[2];
PImage[] slide5s = new PImage[2];
PImage[] slide6s = new PImage[1];
int imageSpeed = 0;
int imageNumber = 0;

boolean akey, skey, wkey, dkey, ekey, spacebar, qkey;
boolean onekey, twokey, threekey, fourkey, fivekey, sixkey, sevenkey, eightkey, ninekey, zerokey;
PImage map, map2, map3;
PImage app, basket, catchBG;//catch
PImage mushroom, breakoutBG;//breakout
PImage mossMan, koi, frog, bunny, mush; //trent, frogcois, solobun, morelle
PImage lily, Lpad, Rpad, pongBG;//pong
PImage rpsBG, rocky, papery, scissory;
float zoom = 1;
PImage intro, outro;

ArrayList<Apple> apples = new ArrayList<>();

PImage dialogue;

boolean mouseReleased;
boolean wasPressed;

PImage[] duckF = new PImage[4];
PImage[] duckB = new PImage[4];
PImage[] duckS = new PImage[3];
PImage[] duckI = new PImage[1];
PImage[] action;

int mode = 0;
final int MAP1 = 1;
final int MAP2 = 2;
final int MAP3 = 3;
final int MINIRPS = 4;
final int DIA = 5;
final int MINIPONG = 6;
final int MINICATCH = 7;
final int MINIBREAKOUT = 8;
final int MINICODE = 9;
final int END = 10;
final int INTRO = 11;
final int MAZE = 12;
final int SLIDE = 13;

FPlayer player;
FCharac mossifer, koifish, frogster, bunnifer, mushmush;

int charac = 1;
int diaMoss = 0;
int diaKoi = 0;
int diaBunny = 0;
int diaFrog = 0;
int diaMush = 0;
boolean pongi = true;
boolean appli = true;
boolean breaki = true;

boolean endTrue = false;

Button introButton;

//setup -------------------------------------------------------------------------------------------------------------------------------------------------
void setup() {
  textAlign(CENTER, CENTER);
  //imageMode(CENTER);
  //rectMode(CENTER);
  Fisica.init(this);
  imageSetup();
  buttonSetup();

  size(1000, 700);
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 0);
  pushMatrix();
  translate(350, 15);

  player = new FPlayer(0, 0);
  world.add(player);
  mossifer = new FCharac(695, -265);
  world.add(mossifer);
  koifish = new FCharac(1475, -270);
  world.add(koifish);
  frogster = new FCharac(735, 195);
  world.add(frogster);
  bunnifer = new FCharac(1750, 1000);
  world.add(bunnifer);
  mushmush = new FCharac(510, -720);
  world.add(mushmush);

  popMatrix();
  mode = INTRO;

  main = minim.loadFile("RPReplay_Final1683437642.mp3");
  pong = minim.loadFile("RPReplay_Final1683437365.mp3");
  breakout = minim.loadFile("RPReplay_Final1683437348.mp3");
  main2 = minim.loadFile("RPReplay_Final1683437331.mp3");
  main3 = minim.loadFile("RPReplay_Final1683437265.mp3");
  introBGM = minim.loadFile("RPReplay_Final1683437642.mp3");

  main.loop();
  main.setGain(50);
  main2.setGain(50);
  main3.setGain(50);

  main2.loop();
  main3.loop();
  introBGM.loop();
  main.mute();
  main2.mute();
  main3.mute();
}

void buttonSetup() {
  rock = new Button(200, 575, 250, 150, green, dgreen);
  paper = new Button(500, 575, 250, 150, green, dgreen);
  scissor = new Button(800, 575, 250, 150, green, dgreen);
}
void imageSetup() {

  minim = new Minim(this);
  slide0s[0] = loadImage("IntroSlideImages/Slide0Image0.PNG");

  slide1s[0] = loadImage("IntroSlideImages/Slide1Image0.PNG");
  slide1s[1] = loadImage("IntroSlideImages/Slide1Image1.PNG");
  slide1s[2] = loadImage("IntroSlideImages/Slide1Image2.PNG");

  slide2s[0] = loadImage("IntroSlideImages/Slide2Image0.PNG");
  slide2s[1] = loadImage("IntroSlideImages/Slide2Image1.PNG");
  slide2s[2] = loadImage("IntroSlideImages/Slide2Image2.PNG");

  slide3s[0] = loadImage("IntroSlideImages/Slide3Image0.PNG");
  slide3s[1] = loadImage("IntroSlideImages/Slide3Image1.PNG");

  slide4s[0] = loadImage("IntroSlideImages/Slide4Image0.PNG");
  slide4s[1] = loadImage("IntroSlideImages/Slide4Image1.PNG");

  slide5s[0] = loadImage("IntroSlideImages/Slide5Image0.PNG");
  slide5s[1] = loadImage("IntroSlideImages/Slide5Image1.PNG");

  slide6s[0] = loadImage("IntroSlideImages/Slide6Image0.PNG");
  dialogue = loadImage("dialogue.PNG");

  map = loadImage("map.jpg");
  map.resize(0, 1200);
  map2 = loadImage("map2.jpg");
  map2.resize(0, 1200);
  map3 = loadImage("map3.png");
  map3.resize(0, 1200);

  intro = loadImage("intro.jpeg");
  outro = loadImage("outro.jpeg");

  //Catch=========================================================================================================
  app = loadImage("catch/apple.png");
  basket = loadImage("catch/basket.png");
  catchBG = loadImage("catch/catchBG.png");
  apples.add(new Apple(random(1000), 0));

  //PONG===================================================================================================
  //initialize paddles
  leftd = 200;
  rightd = 200;

  //initialize puck
  puckd = 75;
  puckvx = 2;
  puckvy = -2;

  //initialize scores
  rightscore = leftscore = 0;
  timer = 100;

  lily = loadImage("pong/lily.png");//puck
  Rpad = loadImage("pong/Lpad.png");//right paddle
  Lpad = loadImage("pong/Rpad.png");//left paddle
  pongBG = loadImage("pong/pongBG.png");

  //RPS=======================================================================================================================
  rock = new Button(200, 575, 250, 150, green, dgreen);
  paper = new Button(500, 575, 250, 150, green, dgreen);
  scissor = new Button(800, 575, 250, 150, green, dgreen);
  introButton = new Button(400, 500, 275, 150, 255, dgreen);

  comp = int (random(3));
  user = "";
  win = loss = tie = 0;

  rocky = loadImage("rps/rock.png");
  papery = loadImage("rps/paper.png");
  scissory = loadImage("rps/scissor.png");
  rpsBG = loadImage("rps/rpsBG.png");

  mossMan = loadImage("mossMan.PNG");
  mossMan.resize(0, 70);
  koi = loadImage("koi.PNG");
  koi.resize(0, 70);
  frog = loadImage("frog.PNG");
  frog.resize(0, 70);
  bunny = loadImage("bunny.PNG");
  bunny.resize(0, 100);
  mush = loadImage("mush.png");
  mush.resize(0, 70);

  duckI[0] = loadImage("duckF0.PNG");
  duckI[0].resize(0, 50);
  for (int i = 0; i < duckF.length; i++) {
    duckF[i] = loadImage("duckF" + i + ".PNG");
    duckF[i].resize(0, 50);
  }
  for (int i = 0; i < duckS.length; i++) {
    duckS[i] = loadImage("duckS" + i + ".PNG");
    duckS[i].resize(0, 50);
  }
  for (int i = 0; i < duckB.length; i++) {
    duckB[i] = loadImage("duckB" + i + ".PNG");
    duckB[i].resize(0, 50);
  }
  action = duckF;
}

void drawWorld() {
  world.step();
  world.draw();
}

void actWorld() {
  player.act();
  mossifer.act();
  frogster.act();
  koifish.act();
  bunnifer.act();
  mushmush.act();
}

//draw --------------------------------------------------------------------------------------------------------------------------------------------------
void draw() {
  pushMatrix();
  translate(-player.getX() * zoom + width/2, -player.getY() * zoom + height/2);
  scale(zoom);
  if (mode == MAP1)
    map1();
  else if (mode == MAP2)
    map2();
  else if (mode == MAP3)
    map3();
  else if (mode == MINIRPS)
    rps();
  else if (mode == DIA)
    dialogueBox();
  else if (mode == MINIPONG)
    pong();
  else if (mode == MINICATCH)
    basketCatch();
  else if (mode == MINIBREAKOUT)
    breakout();
  else if (mode == MINICODE)
    code();
  else if (mode == END)
    end();
  else if (mode == INTRO)
    intro();
  else if (mode == SLIDE)
    slide();

  drawWorld();
  actWorld();
  world.step();
  world.draw();
  popMatrix();
  //println(player.getX(), player.getY());
}
