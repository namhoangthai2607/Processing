import peasy.*;

float angle;
float r = 200;
Table table;

PImage earth;
PShape globe;

PeasyCam cam;

void setup() {
  size(800, 800, P3D);
  earth = loadImage("world.200412.3x5400x2700.jpg");
  table = loadTable("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv", "header");
  
  noStroke();
  globe = createShape(SPHERE,r);
  globe.setTexture(earth);
  
  cam = new PeasyCam(this, 250);
}

void draw() {
  background(51);
  //image(earth, 0, 0);
  translate(width * 0.5, height * 0.5);
  rotateY(angle);
  angle += 0.01;

  lights();
  fill(200);
  noStroke();
  //sphere(r);
  shape(globe);

  for (TableRow row : table.rows()) {
    float lat = row.getFloat("latitude");
    float lon = row.getFloat("longitude");
    float mag = row.getFloat("mag");

    float theta = radians(lat) + PI/2;
    float phi = radians(lon) + PI;
    float x = r * sin(theta) * cos(phi);
    float y = -r * sin(theta) * sin(phi);
    float z = r * cos(theta);
    PVector pos = new PVector(x, y, z);

    float h = pow(10, mag);
    float maxh = pow(10, 7);
    h = map(h, 0, maxh, 10, 100);

    PVector xaxis = new PVector(1, 0, 0);
    float angleb = PVector.angleBetween(xaxis, pos);
    PVector raxis = xaxis.cross(pos);


    pushMatrix();
    translate(x, y, z);
    rotate(angleb, raxis.x, raxis.y, raxis.z);
    box(h, 5, 5);
    popMatrix();
  }
}
