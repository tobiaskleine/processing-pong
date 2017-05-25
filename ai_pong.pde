
Player playerA;
Player playerB;
Ball ball;

float time = millis();

boolean isKeyUp = false;
boolean isKeyDown = false;

void setup() {
  size(1024, 768);
  playerA = new Player(new PVector(0.1 * width, 0.5 * height), color(255,0,0));
  playerB = new Player(new PVector(0.9 * width, 0.5 * height), color(0,0,255));
  ball = new Ball(new PVector(0.5 * width, 0.5 * height));
}

void draw() {
  float deltaT = (millis() - time) / 1000.0;
  time = millis();
  advance(deltaT);
  
  background(255);
  playerA.draw();
  playerB.draw();
  ball.draw();
}

void advance(float deltaT) {
  playerA.processInput(deltaT, isKeyUp, isKeyDown);
  playerA.advance(deltaT);
  playerB.advance(deltaT);
  ball.advance(deltaT);
  
  playerA.detectBallCollision(ball);
  playerB.detectBallCollision(ball);
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
}