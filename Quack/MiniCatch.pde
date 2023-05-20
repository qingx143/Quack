int basketW = 200;
int basketL = 75;
float basketX, basketY;
int point = 0;

void basketCatch() {
  imageMode(CENTER);
  rectMode(CENTER);
  background(ocean);
  image(catchBG, player.getX(), player.getY() + 150);
  if (appli) {
    basketX = player.getX();
    basketY = player.getY() + 200;
    appli = false;
  }
  catchBG.resize(1000, 0);
  text("apples caught: " + point, player.getX() + 300, player.getY() - 250);

  for (int i = 0; i < apples.size(); i++) {
    apples.get(i).show();
    apples.get(i).act();
  }
  basket();
  
  if (point >= 10) mode = MAP1;
  
  imageMode(CORNER);
  rectMode(CORNER);
}

void basket() {
  if (akey == true) basketX = basketX - 7;
  if (dkey == true) basketX = basketX + 7;
  fill(255);
  rectMode(CENTER);
  // rect(basketX, basketY, basketW, basketL);
  image(basket, basketX, basketY - 20);
  basket.resize(basketW, 0);

  for (int i = 0; i < apples.size(); i++) {
    Apple obj = apples.get(i);
    if (obj.appleY > basketY ) {
      apples.remove(obj);
      apples.add(new Apple(random(player.getX() - 500, player.getX() + 500), player.getY() - 500));
      if ((obj.appleX <= basketX + basketW/2) && (obj.appleX >= basketX - basketW/2)) point++;
    }
  }
  textSize(50);
  //text(point, 800, 100);
}

class Apple {
  int appleD;
  float appleX; 
  float appleY;
  float appleS;

  Apple(float x, float y) {
    appleD = 75;
    appleX = x;
    appleY = y;
    appleS = random(0.05, 0.1);
  }

  void act() {
    for (int timer = 60; timer > 0; timer--) {
      appleY += appleS;
      //println(appleY);
    }
  }

  void show() {
    fill(255, 0, 0);
    //  circle(location.x, location.y, appleD);
    image(app, appleX, appleY);
    app.resize(0, appleD);
  }
}
