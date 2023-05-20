void keyPressed() {
  if (key == 'a' || key == 'A') akey = true;
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'e' || key == 'E') ekey = true;
  if (key == 'q' || key == 'Q') qkey = true;
  if (key == ' ') spacebar = true;
  
  if (key == '1') onekey = true;
  if (key == '2') twokey = true;
  if (key == '3') threekey = true;
  if (key == '4') fourkey = true;
  if (key == '5') fivekey = true;
  if (key == '6') sixkey = true;
  if (key == '7') sevenkey = true;
  if (key == '8') eightkey = true;
  if (key == '9') ninekey = true;
  if (key == '0') zerokey = true;
}

void keyReleased() {
  if (key == 'a' || key == 'A') akey = false;
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'e' || key == 'E') ekey = false;
  if (key == 'q' || key == 'Q') qkey = false;
  if (key == ' ') spacebar = false;
  
  if (key == '1') onekey = false;
  if (key == '2') twokey = false;
  if (key == '3') threekey = false;
  if (key == '4') fourkey = false;
  if (key == '5') fivekey = false;
  if (key == '6') sixkey = false;
  if (key == '7') sevenkey = false;
  if (key == '8') eightkey = false;
  if (key == '9') ninekey = false;
  if (key == '0') zerokey = false;
}

void clicks() {
  mouseReleased = false; //resets
  if (mousePressed)
    wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}

void mouseReleased() {
  if (mode == MINIRPS) 
    rpsClicks();
  if (mode == INTRO) {
    if (mouseX >= 237.5 && mouseX <= 512.5 && mouseY >= 460 && mouseY <= 626)
      mode = SLIDE;
  }
}

PImage reverseImage(PImage image) {
  PImage reverse;
  reverse = createImage(image.width, image.height, ARGB);
  for (int i = 0; i < image.width; i++) {
    for (int j = 0; j < image.height; j++) {
      int xPixel, yPixel;
      xPixel = image.width - 1 - i;
      yPixel = j;
      reverse.pixels[yPixel*image.width+xPixel]=image.pixels[j*image.width+i] ;
    }
  }
  return reverse;
}

//void cleanUp() {
//  for (int i = 0; i < myObjects.size(); i++) {
//    GameObject obj = myObjects.get(i);
//    if (obj instanceof Apple || obj instanceof Dialogue) {
//      myObjects.remove(i);
//      i--;
//    }
//  }
//}
