

class Player extends Moveable{
  color playerColor;
  float playerWidth = 20;
  float playerHeight = 100;
  float maxVelocity = 200;
  float maxAcceleration = 200;

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
        ball.position.x <= position.x + playerWidth/2.0 + ball.radius&& 
        ball.position.y >= position.y - playerHeight/2.0 - ball.radius&&
        ball.position.y  <= position.y + playerHeight/2.0 + ball.radius
      ) {
      ball.bounce();
    }
  }

  void processInput(float deltaT, boolean isKeyUp, boolean isKeyDown) {
    if (isKeyUp && velocity.y > -maxVelocity) {
      velocity.y -= deltaT * maxAcceleration;
    }
    if (isKeyDown && velocity.y < maxVelocity) {
      velocity.y += deltaT * maxAcceleration;
    }
  }
}