class Ball extends Moveable {
  float radius = 15;
  float initialVelocity = 250;
  Ball() {
    reset();
  }
  
  void draw() {
    fill(50,50,50);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
  void bounce() {
    velocity.x *= -1; 
  }
    
  void advance(float deltaT) {
    super.advance(deltaT);
    if (position.y < 0 || position.y > height) {
      velocity.y *= -1;
    }
  }
  
  void reset() {  
    position = new PVector(0.5 * width, 0.5 * height);
    float angle = random(PI*0.8, PI*1.2);
    if (random(0.0, 1.0) > 0.5) {
      angle += PI;
    }
    velocity = PVector.fromAngle(angle).mult(initialVelocity);
  }
}