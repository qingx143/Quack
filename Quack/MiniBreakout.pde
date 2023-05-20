//entities
float paddlex, paddley, paddled;//paddle
float ballx, bally, balld;//ball
float ballvx, ballvy;//velocity

//score
int score, atari_timer, lives;

//brick variables
int[] x;//x array
int[] y;//y array
int n;// pages
int brickd;//brick diameter
int tempx, tempy;
boolean[] alive;

void breakout() {
  rectMode(CENTER);
  imageMode(CENTER);
  if (breaki) {
    //BERAKOUT======================================================================================================
    mushroom = loadImage("breakout/mushroom.png");
    breakoutBG = loadImage("breakout/breakoutBG.png");
  
    //initialze entites
    paddlex = player.getX();
    paddley = player.getY() + 250;
    paddled = 80;
  
    //initialize ball
    ballx = player.getX();
    bally = player.getY() + 100;
    balld = 10; 
    ballvx = random(3, -3);
    ballvy = random(-3, 3);
  
    //initialize score
    score = 0;
    atari_timer = 100;
    lives = 3;
  
    //brick array setup
    n = 60;
    x = new int[n];
    y = new int[n];
    alive = new boolean[n];
  
    brickd = 35;
    tempx = int(player.getX() - 450);
    tempy = int(player.getY() - 275);
  
    int i = 0;
    while (i < n) {
      x[i] = tempx;
      y[i] = tempy;
      alive[i] = true;

      tempy = tempy + 75;
      if (tempy > player.getY() + 50) {
        tempx = tempx + 100;
        tempy = int(player.getY() - 275);
      }
      i++;
    }
    breaki = false;
  }
  
  //background(ocean);175
  image(breakoutBG, player.getX(), player.getY() - 150);
  breakoutBG.resize(1000, 0);
  fill(255);
  atari_timer--;

  //bricks
  for (int i = 0; i < n; i++) {
    if (alive[i] == true) management(i);
  }

  //text
  fill(255);
  textSize(30);
  text("mushrooms saved: " + score, player.getX() - 350, player.getY() + 250);
  text("lives: " + lives, player.getX() + 400, player.getY() + 250);

  breakoutPaddle();
  ball();

  //gameover 
  if (bally >= player.getY() + 370) {
    timer = 100;
    ballx = player.getX();
    bally = player.getY();
    lives = lives - 1;
  }

  if (score >= 25 || lives <= 0) {
    mode = MAP2;
    print(mode);
  }
  rectMode(CORNER);
  imageMode(CORNER);
}

void breakoutPaddle() {
  //paddle
  fill(brown);
  rect(paddlex, paddley, paddled, 20);

  //move paddles
  if (akey == true) paddlex = paddlex - 7;
  if (dkey == true) paddlex = paddlex + 7;
  //border
  if (paddlex <= player.getX() - 460) paddlex = player.getX() - 460;
  if (paddlex > player.getX() + 460) paddlex = player.getX() + 460;
}

void ball() {
  //ball
  fill(brown);
  circle(ballx, bally, balld);

  //move ball
  if (atari_timer < 0) {
    ballx = ballx + ballvx;
    bally = bally + ballvy;
  }

  //if (ballx >= width - balld/2) ballx = width - balld/2;
  //if (ballx <= balld/2) ballx = balld/2;

  //ball bouncing 
  if (bally <= player.getY() - 345) ballvy = ballvy * -1;
  if (ballx <= player.getX() - 495 || ballx >= player.getX() + 495) ballvx = ballvx * -1;

  if (dist(paddlex, paddley, ballx, bally) <= 20 + balld/2) {
    ballvx = (ballx - paddlex)/10;
    ballvy = (bally - paddley)/10;
  }
}

void reset() {
  for (int i = 0; i < n; i++) {
    alive[i] = true;
  }

  timer = 100;
  score = 0;
  lives = 3;
  paddlex = player.getX();
  ballx = player.getX();
  bally = player.getY() + 100;
  ballvx = random(3, -3);
  ballvy = random(-3, 3);
}

void management(int i) {
  if (y[i] == 75) fill(red);
  if (y[i] == 150) fill(orange);
  if (y[i] == 225) fill(green);
  if (y[i] == 300) fill(blue);
  if (y[i] == 375) fill(pink);
  noStroke();
 // circle(x[i], y[i], brickd);
  image(mushroom, x[i], y[i]);
  mushroom.resize(brickd, 0);
  if (dist(ballx, bally, x[i], y[i]) <= brickd/2 + balld/2) {
    breakout.setGain(250);
    breakout.rewind();
    breakout.play();
    ballvx = (ballx - x[i])/8;
    ballvy = (bally - y[i])/8;
    alive[i] = false;
    score++;
  }
}
