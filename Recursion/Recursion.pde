void setup() {
  size(600, 400);
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(1);
  noFill();
  
  drawCircle(300, 200, 300);
}

void drawCircle(float x, float y, float d) {
  ellipse(x, y, d, d);
  if (d > 2) {
    float newD = d * 0.25;
    drawCircle(x + newD, y, newD);
    drawCircle(x - newD, y, newD);
    //drawCircle(x, y + d * 0.5, d * 0.5);
  }
}
