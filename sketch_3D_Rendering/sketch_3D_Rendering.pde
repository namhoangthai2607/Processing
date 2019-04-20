float angle = 0;

PVector[] points = new PVector(4);

void setup() {
  size(600, 400);
  //ortho();

  points[0] = new PVector(-50, -50);
  points[1] = new PVector(50, -50);
  points[2] = new PVector(50, 50);
  points[3] = new PVector(-50, 50);
}

void draw() {
  background(0);
  translate(width / 2, height / 2);
  stroke(255);
  strokeWeight(4);
  noFill();
  
  for (PVector v : points) {
    point
  }
  //rotateX(angle);
  //rotateY(angle * 2);
  //rotateZ(angle * 3);
  //box(200);
}
