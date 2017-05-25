

class Player extends Moveable{
  color playerColor;
  float playerWidth = 20;
  float playerHeight = 100;
  float maxVelocity = 400;
  float maxAcceleration = 3000;
  
  int wins = 0;

  Player(PVector position, color playerColor) {
    this.position = position;
    this.playerColor = playerColor;
  }
  
  void draw() {
    fill(playerColor);
    noStroke();
    ellipse(position.x, position.y, 
      playerWidth, playerHeight);

  }
  
  void detectBallCollision(Ball ball) {
    if (ball.position.x >= position.x - playerWidth/2.0 - ball.radius &&
        ball.position.x <= position.x + playerWidth/2.0 + ball.radius && 
        ball.position.y >= position.y - playerHeight/2.0 - ball.radius &&
        ball.position.y <= position.y + playerHeight/2.0 + ball.radius
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