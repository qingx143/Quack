class FPlayer extends FBox {
  float x, y;
  int frame, direction;
  
  FPlayer(float x, float y) {
    super(30, 30);
    frame = 0;
    direction = 1;
    setPosition(x, y);
    setName("player");
    setRotatable(false);
  }
  
  void act() {
    handleInput();
    animate();
  if (mode == MAP1) {
    introBGM.mute();
    main.unmute();
    main2.mute();
    main3.mute();
  } 
  if (mode == MAP2) {
    main.mute();
    main2.unmute();
    main3.mute();
  } 
  if (mode == MAP3) {
    main.mute();
    main2.mute();
    main3.unmute();
  }
    //up
    if (ekey && mode == MAP1 && (player.getX() >= 920 && player.getX() <= 1500 && player.getY() >= -500 && player.getY() <= -400)) {
      mode = MAP2;
      //main.pause();
      //main3.pause();
      //main2.loop();
      player.setVelocity(player.getVelocityX(), -100);
      ekey = false;
    }
    if (ekey && mode == MAP2 && (player.getX() >= 920 && player.getX() <= 1500 && player.getY() >= -500 && player.getY() <= -400)) {
      mode = MAP1;
      //main.loop();
      //main3.pause();
      //main2.pause();
      player.setVelocity(player.getVelocityX(), 100);
      ekey = false;
    }
    
    //down
    if (ekey && mode == MAP1 && (player.getX() >= 1300 && player.getX() <= 1600 && player.getY() >= 250 && player.getY() <= 350)) {
      mode = MAP3;
      //main.pause();
      //main3.loop();
      //main2.pause();
      player.setVelocity(player.getVelocityX(), 100);
      ekey = false;
    }
    if (ekey && mode == MAP3 && (player.getX() >= 1300 && player.getX() <= 1600 && player.getY() >= 250 && player.getY() <= 350)) {
      mode = MAP1;
      //main.loop();
      //main3.pause();
      //main2.pause();
      player.setVelocity(player.getVelocityX(), -100);
      ekey = false;
    }
    
    if (player.getX() >= 920 && player.getX() <= 1500 && player.getY() >= -500 && player.getY() <= -400) {
      fill(255);
      textSize(20);
      text("enter cave [E]", player.getX(), player.getY() - 50);
    }
    if (player.getX() >= 1300 && player.getX() <= 1600 && player.getY() >= 250 && player.getY() <= 350) {
      fill(255);
      textSize(20);
      text("enter cave [E]", player.getX(), player.getY() - 50);
    }
  }
  
  void handleInput() {
    float left_vy = player.getVelocityY();
    if (mode == MINIBREAKOUT || mode == MINICATCH || mode == MINIPONG || mode == MINIRPS || mode == DIA)
      left_vy = 0;
    if (mode != INTRO && mode != MAZE && mode != SLIDE && mode != END && mode != MINIBREAKOUT && mode != MINICATCH && mode != MINIPONG && mode != DIA && mode != MINIRPS && akey) {
      player.setVelocity(-75, left_vy);
      action = duckS;
      direction = 1;
    }
    if (mode != INTRO && mode != MAZE && mode != SLIDE && mode != END && mode != MINIBREAKOUT && mode != MINICATCH && mode != MINIPONG && mode != DIA && mode != MINIRPS && dkey) {
      player.setVelocity(75, left_vy);
      action = duckS;
      direction = 2;
    }
    
    float left_vx = player.getVelocityX();
    if (mode == MINIBREAKOUT || mode == MINICATCH || mode == MINIPONG || mode == MINIRPS || mode == DIA)
      left_vx = 0;
    if ((mode != MINIBREAKOUT || mode != MINICATCH ||mode != MINIPONG || mode != DIA || mode != MINIRPS) && (abs(left_vy) < 0.1) && (abs(left_vx) < 0.1)) 
      action = duckI;
      
    if (mode != INTRO && mode != MAZE && mode != SLIDE && mode != END && mode != MINIBREAKOUT && mode != MINICATCH && mode != MINIPONG && mode != DIA && mode != MINIRPS && wkey) {
      player.setVelocity(left_vx, -75);
      action = duckB;
    }
    if (mode != INTRO && mode != MAZE && mode != SLIDE && mode != END && mode != MINIBREAKOUT && mode != MINICATCH && mode != MINIPONG && mode != DIA && mode != MINIRPS && skey) {
      player.setVelocity(left_vx, 75);
      action = duckF;
    }
  } 
  
  void animate() {
    if (frame >= action.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == 1) attachImage(reverseImage(action[frame]));
      if (direction == 2) attachImage(action[frame]);
      frame++;
    }
  }
}
