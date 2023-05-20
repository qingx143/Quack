ArrayList<String> code = new ArrayList<String>();

//String[] code = {"0", "0", "0", "0"};

String password = "2023";
String num1, num2, num3, num4;
String codeNum = "";

void code() {
  rectMode(CENTER);
  strokeWeight(3);
  fill(150);
  rect(player.getX(), player.getY(), 600, 300);
  fill(0);
  textSize(50);
  text("ENTER THE CODE", player.getX(), player.getY() - 100);
  strokeWeight(3);
  fill(200);
  rect(player.getX(), player.getY() + 75, 300, 75);
  
  fill(0);
  textSize(40);
  text(codeNum, player.getX(), player.getY() + 75);
  rectMode(CORNER);
  
  if (codeNum.length() >= 4) {
    if (code.get(0).equals(password.substring(0, 1)) && code.get(1).equals(password.substring(1, 2)) && code.get(2).equals(password.substring(2, 3))&& code.get(3).equals(password.substring(3, 4))) {
      endTrue = true;
      mode = MAP3;
    }
    else {
      endTrue = false;
      mode = MAP3;
    }
  }
  
  if (onekey) {
    codeNum += "1";
    code.add("1");
    onekey = false;
  }
  if (twokey) {
    codeNum += "2";
    code.add("2");
    twokey = false;
  }
  if (threekey) {
    codeNum += "3";
    code.add("3");
    threekey = false;
  }
  if (fourkey) {
    codeNum += "4";
    code.add("4");
    fourkey = false;
  }
  if (fivekey) {
    codeNum += "5";
    code.add("5");
    fivekey = false;
  }
  if (sixkey) {
    codeNum += "6";
    code.add("6");
    sixkey = false;
  }
  if (sevenkey) {
    codeNum += "7";
    code.add("7");
    sevenkey = false;
  }
  if (eightkey) {
    codeNum += "8";
    code.add("8");
    eightkey = false;
  }
  if (ninekey) {
    codeNum += "9";
    code.add("9");
    ninekey = false;
  }
  if (zerokey) {
    codeNum += "0";
    code.add("0");
    zerokey = false;
  }
}
