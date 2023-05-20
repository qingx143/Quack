class FCharac extends FBox {
  float x, y;
  
  FCharac(float x, float y) {
    super(30, 30);
    setPosition(x, y);
    setName("player");
    setRotatable(false);
    setStatic(true);
    setSensor(true);
    setNoFill();
    setNoStroke();
  }
  
  void act() { 
    if (mode == MAP1 && (dist(mossifer.getX(), mossifer.getY(), player.getX(), player.getY()) <= 150)) {
      fill(255);
      textSize(20);
      text("talk [E]", player.getX(), player.getY() - 50);
      if (ekey) {
        charac = 1;
        mode = DIA;
        diaMoss++;
      }
    }
    
    if (mode == MAP1 && (dist(koifish.getX(), koifish.getY(), player.getX(), player.getY()) <= 150)) {
      fill(255);
      textSize(20);
      text("talk [E]", player.getX(), player.getY() - 50);
      if (ekey) {
        charac = 2;
        mode = DIA;
        diaKoi++;
      }
    }
    
    if (mode == MAP3 && (dist(bunnifer.getX(), bunnifer.getY(), player.getX(), player.getY()) <= 150)) {
      fill(255);
      textSize(20);
      text("talk [E]", player.getX(), player.getY() - 50);
      if (ekey) {
        charac = 3;
        mode = DIA;
        diaBunny++;
      }
    }
    
    if (mode == MAP1 && (dist(frogster.getX(), frogster.getY(), player.getX(), player.getY()) <= 150)) {
      fill(255);
      textSize(20);
      text("talk [E]", player.getX(), player.getY() - 50);
      if (ekey) {
        charac = 4;
        mode = DIA;
        diaFrog++;
      }
    }
    
    if (mode == MAP2 && (dist(mushmush.getX(), mushmush.getY(), player.getX(), player.getY()) <= 150)) {
      fill(255);
      textSize(20);
      text("talk [E]", player.getX(), player.getY() - 50);
      if (ekey) {
        charac = 5;
        mode = DIA;
        diaMush++;
      }
    }
  }
}

void dialogueBox() {
  imageMode(CENTER);
  textAlign(LEFT);
  if (charac == 1 && !(diaMoss > 6)) { //mossifer
  image(dialogue, player.getX(), player.getY() + 200, 900, 900);
    if (diaMoss == 1) 
      text("Mossifer: Hello.", player.getX() - 400, player.getY() + 150);
    else if (diaMoss == 2) 
      text("Mossifer: You will have to beat my mini game if you want to access wizard's portal.", player.getX() - 400, player.getY() + 150);
    else if (diaMoss == 3) 
      text("Mossifer: Let's rock paper scissors it out.", player.getX() - 400, player.getY() + 150);
    else if (diaMoss == 4)
      mode = MINIRPS;
    else if (diaMoss == 5 && awin >= 1) 
      text("Mossifer: A moss-merizing play. You have my respect youngling. \nGood luck with finding your family. The first digit of the code is 2.", player.getX() - 400, player.getY() + 150);
    else if (diaMoss == 5 && aloss >= 1) 
      text("Mossifer: AHA! Looks like you have mossed, and I have won, just as I predicted! \nYou are welcome to try again... if you dare >:)", player.getX() - 400, player.getY() + 150); 
    else if (diaMoss == 5 && atie >= 1) 
      text("Mossifer: A tie. If you would like, we could try again.", player.getX() - 400, player.getY() + 150);
    else if (diaMoss == 6 && (aloss >= 1 || atie >= 1)) 
      diaMoss = 3;
  }
  
  if (charac == 2 && !(diaKoi > 6)) {
    image(dialogue, player.getX(), player.getY() + 200, 900, 900);
    if (diaKoi == 1) 
      text("Trent: YO C'MERE! I BETCHA CAN'T BEAT ME IN PONG!", player.getX() - 400, player.getY() + 150);
    else if (diaKoi == 2) 
      text("Trent: IF YOU DO (highly unlikely), I WILL TELL YA A PART OF THE WIZARD'S CODE.", player.getX() - 400, player.getY() + 150);
    else if (diaKoi == 3) 
      text("Trent: JUST PRESS 'W' AND 'S' TO MOVE YOUR PADDLE UP AND DOWN \nAND TRY TO SCORE AGAINST ME TO WIN.", player.getX() - 400, player.getY() + 150);
    else if (diaKoi == 4)
      mode = MINIPONG;
    else if (diaKoi == 5 && leftscore > 0) 
      text("Trent: Well, I suppose it's o-fish-al. Ya bet me in this game. \nBut don't get too cocky. This was just a fluke. The third digit for the code is 0.", player.getX() - 400, player.getY() + 150);
    else if (diaKoi == 5 && rightscore > 0) 
      text("Trent: AHA- I BET YA. YOU ARE WELCOME TO TRY AGAIN, BUT I HIGHLY DOUBT YOU'LL EVER WIN AGAINST ME.", player.getX() - 400, player.getY() + 150); 
    else if (diaKoi == 6 && rightscore > 0 && leftscore == 0) 
      diaKoi = 3;
  }
  
  if (charac == 3 && !(diaBunny > 6)) {
    image(dialogue, player.getX(), player.getY() + 200, 900, 900);
    if (diaBunny == 1) 
      text("Solobun: Hello young one, you have been on a long journey. Good job.", player.getX() - 400, player.getY() + 150);
    else if (diaBunny == 2) 
      text("Solobun: You must be tired. So let's get to it. You will need to use the knowlege \nyou have gained on this journey and input it into this keypad.", player.getX() - 400, player.getY() + 150);
    else if (diaBunny == 3) 
      text("Solobun: When you are ready, just type the code onto your keypad.", player.getX() - 400, player.getY() + 150);
    else if (diaBunny == 4)
      mode = MINICODE;
    else if (diaBunny == 5 && endTrue) 
      text("Solobun: Excellent work! You have done it! I am impressed. Off into the portal you go. \nYou will now finally be able to see your family. Press 'Q' to enter the portal. \nI wish you the best of luck in your future.", player.getX() - 400, player.getY() + 150);
    else if (diaBunny == 5 && !endTrue) 
      text("Solobun: Ah.. that's not quite it. You can look for the code within the forest.", player.getX() - 400, player.getY() + 150); 
    else if (diaBunny == 6 && !endTrue) {
      codeNum = "";
      diaBunny = 3;
    }
  }
  
  if (charac == 4 && !(diaFrog > 6)) {
    image(dialogue, player.getX(), player.getY() + 200, 900, 900);
    if (diaFrog == 1) 
      text("Frogcois: HEY!!! Wanna help me catch some apples?", player.getX() - 400, player.getY() + 150);
    else if (diaFrog == 2) 
      text("Frogcois: Please help me. If you do, I'll give you a hint to the Wizard's code!", player.getX() - 400, player.getY() + 150);
    else if (diaFrog == 3) 
      text("Frogcois: You just have to move the basket using your 'A' and 'D' keys to catch 10 apples.", player.getX() - 400, player.getY() + 150);
    else if (diaFrog == 4)
      mode = MINICATCH;
    else if (diaFrog == 5) 
      text("Frogcois: Awww man, that was a good game! Thanks for helping me. I am a lot hoppier! \nThe second number of the code is 0. Good luck on your journey!!", player.getX() - 400, player.getY() + 150);
  }
  
  if (charac == 5 && !(diaMush > 7)) {
    image(dialogue, player.getX(), player.getY() + 200, 900, 900);
    if (diaMush == 1) 
      text("Morelle: Hello there!", player.getX() - 400, player.getY() + 150);
    else if (diaMush == 2) 
      text("Morelle: You seem lost little one. Here, if you help me gather some mushrooms \nI can help you with the Wizard's code.", player.getX() - 400, player.getY() + 150);
    else if (diaMush == 3) 
      text("Morelle: I just need 25 mushrooms. You can use your 'A' and 'D' keys to help \naim the ball at them to collect them.", player.getX() - 400, player.getY() + 150);
    else if (diaMush == 4)
      text("Morelle: Be careful though. I only have three balls you can use.", player.getX() - 400, player.getY() + 150);
    else if (diaMush == 5)
      mode = MINIBREAKOUT;
    else if (diaMush == 6 && score > 25) 
      text("Morelle: Thank you kindly. You have helped out me \ntremedously, the last number of the code is 3.", player.getX() - 400, player.getY() + 150);
    else if (diaMush == 6 && lives <= 0) 
      text("Trent: Ah... Thank you for trying. Here, let me gather some more balls if you want to try again.", player.getX() - 400, player.getY() + 150); 
    else if (diaMush == 7 && lives <= 0) { 
      score = 0;
      lives = 3;
      diaMush = 3;
    }
  }
  textAlign(CENTER, CENTER);
  imageMode(CORNER);
  if (charac == 1 && (spacebar || diaMoss > 6)) mode = MAP1;
  if (charac == 2 && (spacebar || diaKoi > 6)) mode = MAP1;
  if (charac == 3 && (spacebar || diaBunny > 6)) mode = MAP3;
  if (charac == 4 && (spacebar || diaFrog > 6)) mode = MAP1;
  if (charac == 5 && (spacebar || diaMush > 7)) mode = MAP2;
}
