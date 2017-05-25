

class Player extends Moveable{
  color playerColor;
  float playerWidth = 20;
  float playerHeight = 100;
  float maxVelocity = 400;
  float maxAcceleration = 3000;
  
  boolean leftPlayer;
  
  int wins = 0;

  Player(boolean leftPlayer, color playerColor) {
    this.leftPlayer = leftPlayer;
    if (leftPlayer) {
      position = new PVector(0.1*width, 0.5*height);
    } else {
      position = new PVector(0.9*width, 0.5*height);
    }      
    this.playerColor = playerColor;
  }
  
  void draw() {
    fill(playerColor);
    noStroke();
    ellipse(position.x, position.y, 
      playerWidth, playerHeight);

  }
  
  void detectBallCollision(Ball ball) {
    if (((leftPlayer == true && ball.velocity.x < 0) ||
         (leftPlayer == false && ball.velocity.x > 0)) &&
        ball.position.x - ball.radius <= position.x + playerWidth/2.0 && 
        ball.position.x + ball.radius >= position.x - playerWidth/2.0 && 
        ball.position.y + ball.radius >= position.y - playerHeight/2.0 &&
        ball.position.y - ball.radius <= position.y + playerHeight/2.0 
      ) {
      ball.bounce();
    }
  }

  void processInput(float deltaT, boolean isKeyUp, boolean isKeyDown) {
    if (isKeyUp && velocity.y > -maxVelocity) {
      velocity.y -= deltaT * maxAcceleration;
    } else if (isKeyDown && velocity.y < maxVelocity) {
      velocity.y += deltaT * maxAcceleration;
    } else {
      velocity.mult((1.0-deltaT)*0.9);
    }
  }
  
  void advance(float deltaT) {
    super.advance(deltaT);
    if (position.y < playerHeight/2.0) {
      position.y = playerHeight/2.0;
      velocity.y = 0;
    }
    if (position.y > height - playerHeight/2.0) {
      position.y = height - playerHeight/2.0;
      velocity.y = 0;
    }
  }

}