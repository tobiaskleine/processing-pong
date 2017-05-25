class Moveable {
  PVector position;
  PVector velocity;
  float ballRadius = 15;

  Moveable() {
    position = new PVector(0,0,0);
    velocity = new PVector(0,0,0);
  }
 
  void advance(float deltaT) {
    position.add(velocity.copy().mult(deltaT));
  }
  
  void draw() {
    
  }
}