void map1() {
  background(255);
  image(map, -350, -800);
  image(mossMan, 660, -300);
  image(koi, 1440, -305);
  image(frog, 700, 160);
}

void map2() {
  background(255);
  image(map3, -300, -1500);
  image(mush, 510, -720);
}

void map3() {
  background(255);
  image(map2, 1000, 0);
  image(bunny, 1700, 950);
  if (qkey)
    mode = END;
}

void end() {
  imageMode(CENTER);
  background(255);
  image(outro, player.getX(), player.getY());
  imageMode(CORNER);
}
