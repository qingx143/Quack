float leftx, lefty, rightx, righty; //paddles
float puckx, pucky;
int puckd, leftd, rightd; //puck
float puckvx, puckvy; //puck velocity

int leftscore, rightscore, timer;


void pong() {
  rectMode(CENTER);
  imageMode(CENTER);
  
  if (pongi) {
    lefty = player.getY();
    righty = player.getY();
    leftx = player.getX() - 500;
    rightx = player.getX() + 500;
    puckx = player.getX();
    pucky = player.getY();
    pongi = false;
  }
  
  image(pongBG, player.getX(), player.getY());
  pongBG.resize(1000, 0);
  //scoreboard
  textSize(50);
  fill(lavendar);
  text(leftscore, player.getX() - 350, player.getY() - 250);
  fill(blue);
  text(rightscore, player.getX() + 350, player.getY() - 2500);
  timer = timer - 1;

  paddle();
  puck();
  
  if (leftscore >= 1) mode = MAP1;
  if (rightscore >= 3) mode = MAP1;
  
  rectMode(CORNER);
  imageMode(CORNER);
}

void paddle() {
  fill(lavendar);
  circle(leftx, lefty, leftd);
  image(Lpad, leftx + 50, lefty);
  Lpad.resize(0, leftd);
  fill(blue);
  circle(rightx, righty, rightd);
  image(Rpad, rightx - 50, righty);
  Rpad.resize(0, leftd);

  //move paddles
  if (wkey == true) lefty = lefty - 8;
  if (skey == true) lefty = lefty + 8;

  //ai move paddles 
  if (pucky > righty) righty = righty + 3;
  if (pucky < righty) righty = righty - 3;
  println(pucky, righty);
  //border
  if (lefty >= player.getY() + 250) lefty = player.getY() + 250;
  if (lefty <= player.getY() - 250) lefty = player.getY() - 250;
  if (righty >= player.getY() + 250) righty = player.getY() + 250;
  if (righty <= player.getY() - 250) righty = player.getY() - 250;
}

void puck() {
  noStroke();
  fill(lilac);
  circle(puckx, pucky, puckd-5);
  image(lily, puckx, pucky);
  lily.resize(0, puckd);

  //move puck
  if (timer < 0) {
    puckx = puckx + puckvx;
    pucky = pucky + puckvy;
  }

  //borders
  if (pucky >= player.getY() + 663) pucky = player.getY() + 663;
  if (pucky <= player.getY() - 663) pucky = player.getY() - 663;

  //scoring
  if (puckx <= player.getX() - 500) {
    rightscore++; 
    puckx = player.getX();
    pucky = player.getY();
    timer = 100;
  }

  if (puckx >= player.getX() + 500) {
    leftscore++; 
    puckx = player.getX();
    pucky = player.getY();
    timer = 100;
  }

  //bouncing
  if (pucky <= player.getY() - 350 + puckd/2 || pucky >= player.getY() + 350 - puckd/2) {
    puckvy = puckvy * -1;
  }
  if (dist(leftx, lefty, puckx, pucky) <= leftd/2 + puckd/2) {
    puckvx = (puckx - leftx)/12;
    puckvy = (pucky - lefty)/12;
  }
  if (dist(rightx, righty, puckx, pucky) <= rightd/2 + puckd/2) {
    puckvx = (puckx - rightx)/12;
    puckvy = (pucky - righty)/12;
  }
}
