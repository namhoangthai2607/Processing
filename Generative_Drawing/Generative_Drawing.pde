//Bezier moves up and down randomly, renew everytime
float changer = random(-150, height - 100);

//Random color pick
float randcolor1 = random(255);
float randcolor2 = random(255);

//Loop hue
int loopcolor = 0;
float wave;

float ampheight = random(0.5, 1.5);
void main() {
   float operator = random(1, 2);
   if (operator > 1.5) {
     for (float y = 0; y < height; y += 3) {
       stroke(loopcolor * 3, randcolor1, randcolor2);
       bezier(0, y, (sin(y / 62.5) + ampheight) * 150, 100 + changer,((sin(y / 62.5) + ampheight) * 150) + 50, 200 + changer, 400, y);
       loopcolor += 1;
     }
   }
   else {
     for(float y = 0; y <height; y+=3) {
       stroke(loopcolor * 3, randcolor1, randcolor2);
      bezier(0, y, (cos(y / 62.5) + ampheight) * 150, 100 + changer,((cos(y / 62.5) + ampheight) * 150) +50, 200 + changer, 400, y);
      loopcolor += 1;
     }
   }
}

void draw() {
  size(400, 400);
  background(255);
  noFill();
}
