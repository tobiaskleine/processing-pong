
Player playerA;
Player playerB;
Ball ball;

float time = millis();

boolean isKeyUp = false;
boolean isKeyDown = false;
boolean isKeyA = false;
boolean isKeyY = false;

void setup() {
  size(1024, 768);
  playerA = new Player(new PVector(0.1 * width, 0.5 * height), color(255,0,0));
  playerB = new Player(new PVector(0.9 * width, 0.5 * height), color(0,0,255));
  ball = new Ball();
}

void draw() {
  float deltaT = (millis() - time) / 1000.0;
  time = millis();
  advance(deltaT);
  
  background(255);
  playerA.draw();
  playerB.draw();
  ball.draw();
  drawScores();
}

void drawScores() {
  textSize(24);
  textAlign(CENTER, CENTER);
  fill(playerA.playerColor);
  text("Player A: "+playerA.wins, playerA.position.x, 50); 
  fill(playerB.playerColor);
  text("Player B: "+playerB.wins, playerB.position.x, 50); 
}

void advance(float deltaT) {
  playerA.processInput(deltaT, isKeyA, isKeyY);
  playerB.processInput(deltaT, isKeyUp, isKeyDown);
  playerA.advance(deltaT);
  playerB.advance(deltaT);
  ball.advance(deltaT);
  
  checkGameOver();
  
  playerA.detectBallCollision(ball);
  playerB.detectBallCollision(ball);
  ball.detectWindowCollision();
}

void checkGameOver() {
  if (ball.position.x < 0) {
    // game over playerA wins
    playerA.wins++;
    newGame();
  }
  if (ball.position.x > width) {
    // game over playerB wins
    playerB.wins++;
    newGame();
  }
}

void newGame() {
  ball.restartGame();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      isKeyUp = true;
    }
    if (keyCode == DOWN) {
      isKeyDown = true;
    } 
  }
  if (keyCode == 'A') {
    isKeyA = true;
  } 
  if (keyCode == 'Y') {
    isKeyY = true;
  } 
}
  
void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      isKeyUp = false;
    }
    if (keyCode == DOWN) {
      isKeyDown = false;
    } 
  }
  if (keyCode == 'A') {
    isKeyA = false;
  } 
  if (keyCode == 'Y') {
    isKeyY = false;
  } 
}