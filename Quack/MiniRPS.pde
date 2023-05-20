int rpsScore;
String computer, user;
int comp;
Button rock, paper, scissor;
int win, loss, tie;
int awin, aloss, atie;

void rps() {
  imageMode(CENTER);
  image(rpsBG, player.getX(), player.getY());
  imageMode(CORNER);
  rpsBG.resize(1000, 0);
  
  rock.show(player.getX() - 300, player.getY() + 250);
  paper.show(player.getX(), player.getY() + 250);
  scissor.show(player.getX() + 300, player.getY() + 250);

  if (comp == 0)computer = "rock";
  else if (comp == 1) computer = "paper";
  else computer = "scissor";

  compute();
  images();
  awin = win;
  aloss = loss;
  atie = tie;
  if (win >= 1 || loss >= 1 ||tie >= 1) rpsReset();
}    

void images() {
  imageMode(CENTER);
  image(rocky, player.getX() - 300, player.getY() + 250);
  rocky.resize(250, 0);
  image(papery, player.getX(), player.getY() + 250);
  papery.resize(155, 0);
  image(scissory, player.getX() + 300, player.getY() + 250);
  scissory.resize(200, 0);
  imageMode(CORNER);
}

void compute() {
  textSize(100);
  fill(0);
  if (computer.equals(user)) {
    text("Tie!", player.getX(), player.getY());
    tie++;
  } else if (computer.equals("rock")) {
    if (user.equals("scissor")) {
      text("You lose!", player.getX(), player.getY());
      loss++;
    } else if (user.equals("paper")) {
      text("You Win!! :D", player.getX(), player.getY());
      win++;
    }
  } else if (computer.equals("scissor")) {
    if (user.equals("rock")) {
      text("You Win!! :D", player.getX(), player.getY());
      win++;
    } else if (user.equals("paper")) {
      text("You lose!", player.getX(), player.getY());
      loss++;
    }
  } else if (computer.equals("paper")) {
    if (user.equals("rock")) {
      text("You lose!", player.getX(), player.getY());
      loss++;
    } else if (user.equals("scissor")) {
      text("you win!! :D", player.getX(), player.getY());
      win++;
    }
  }
}

void rpsClicks() {
  if (mouseX >= 100 && mouseX <= 300 && mouseY >= 500 && mouseY <= 650) user = "rock";
  if (mouseX >= 400 && mouseX <= 600 && mouseY >= 500 && mouseY <= 650) user = "paper";
  if (mouseX >= 700 && mouseX <= 900 && mouseY >= 500 && mouseY <= 650) user = "scissor";
}

void rpsReset() {
  win = loss = tie = 0;
  mode = MAP1;

  if (comp == 0)computer = "rock";
  else if (comp == 1) computer = "paper";
  else computer = "scissor";
  user = "";
}
