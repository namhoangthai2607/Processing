float time = 0; 

void setup() {
  size(600, 400);
}

void draw() {
  background(0);
  translate(200, 200);
  float radius = 50;
  
  stroke(255);
  noFill();
  ellipse(0, 0, radius * 2);
  
  time += 0.01;
}
