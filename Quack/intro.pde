void intro() {
  imageMode(CENTER);
  background(255);
  image(intro, 0, 0);
  introButton.show(-125, 200);
  textSize(75);
  fill(0);
  text("START", -125, 190);
  imageMode(CORNER);
}

void slide() {
  background(#B0DBA4);
  imageMode(CENTER);
  if (frameCount % 40 == 0) imageNumber++;
  if (imageNumber == 0) image(slide0s[0], 0, 0, 700, 700);
  if (imageNumber == 1) image(slide0s[0], 0, 0, 700, 700);
  if (imageNumber == 2) image(slide1s[0], 0, 0, 700, 700);
  if (imageNumber == 3) image(slide1s[1], 0, 0, 700, 700);
  if (imageNumber == 4) image(slide1s[2], 0, 0, 700, 700);
  if (imageNumber == 5) image(slide2s[0], 0, 0, 700, 700);
  if (imageNumber == 6) image(slide2s[1], 0, 0, 700, 700);
  if (imageNumber == 7) image(slide2s[2], 0, 0, 700, 700);
  if (imageNumber == 8) image(slide3s[0], 0, 0, 700, 700);
  if (imageNumber == 9) image(slide3s[1], 0, 0, 700, 700);
  if (imageNumber == 10) image(slide4s[0], 0, 0, 700, 700);
  if (imageNumber == 11) image(slide4s[1], 0, 0, 700, 700);
  if (imageNumber == 12) image(slide5s[0], 0, 0, 700, 700);
  if (imageNumber == 13) image(slide5s[1], 0, 0, 700, 700);
  if (imageNumber == 14) image(slide6s[0], 0, 0, 700, 700);
  if (imageNumber == 15) image(slide6s[0], 0, 0, 700, 700);
  if (imageNumber == 16) image(slide6s[0], 0, 0, 700, 700);
  if (imageNumber == 17) image(slide6s[0], 0, 0, 700, 700);
  imageMode(CORNER);
  if (imageNumber >= 18) mode = MAP1;
}
