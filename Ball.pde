class Ball extends Moveable {
  float radius = 15;

  Ball(PVector position) {
    this.position = position;
    velocity = new PVector(250.0,0,0);
  }
  
  void draw() {
    fill(50,50,50);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
  void bounce() {
    velocity.mult(-1); 
  }
}