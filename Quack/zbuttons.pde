class Button {

  boolean clicked;
  float x, y, w, h;
  String text;
  color normal, tactile;
  PImage image;

  Button(String t, float _x, float _y, float _w, float _h, color n, color tact) {
    text = t;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    normal = n;
    tactile = tact;
    clicked = false;
  }

  Button(PImage i, String t, float _x, float _y, float _w, float _h, color n, color tact) {
    text = t;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    image = i;
    normal = n;
    tactile = tact;
    clicked = false;
  }

  Button(float _x, float _y, float _w, float _h, color n, color tact) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    normal = n;
    tactile = tact;
    clicked = false;
  }

  void showText(float x, float y) {
    noStroke();
    rectMode(CENTER);
    if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
      fill(tactile);
    } else {
      fill(normal);
    }
    rect(x, y, w, h);

    textAlign(CENTER);
    if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
      fill(tactile);
    } else {
      fill(normal);
    }
    fill(0, 0, 0);
    textSize(30);
    text(text, x, y);

    if (mouseReleased && mousePressed && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
      bkg = normal;
    }
  }

  void showImage(float x, float y) {
    image(image, x, y);
    image.resize(int(w), 0);
    
    fill(0);
    textSize(30);
    text(text, x, y);
  }

  void show(float x, float y) {
    noStroke();
    rectMode(CENTER);
    //if (mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
    //  fill(tactile);
    //} else {
    fill(normal);
    //}
    rect(x, y, w, h);

    if (mouseReleased && mousePressed && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2) {
      bkg = normal;
    }
    rectMode(CORNER);
  }
}
