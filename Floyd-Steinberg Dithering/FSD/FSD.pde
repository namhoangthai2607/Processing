PImage image;

void setup () {
  size(1200, 400);
  image = loadImage("IMG_2917.jpg"); //import pictures
  //image.filter(GRAY);
  image(image, 0, 0);
}

int index (int x, int y) {
  return x + y * image.width;
}

void draw () {
  image.loadPixels();
  for (int y = 0; y < image.height-1; y++) {
    for (int x = 1; x < image.width-1; x++) {

      int index = x + y * image.width;
      color pix = image.pixels[index(x, y)];

      float oldR = red(pix);
      float oldG = green(pix);
      float oldB = blue(pix);

      int factor = 1;

      int newR = round(factor * oldR / 255) * (255/factor);
      int newG = round(factor * oldG / 255) * (255/factor);
      int newB = round(factor * oldB / 255) * (255/factor);
      image.pixels[index(x, y)] = color(newR, newG, newB);

      float errR = oldR - newR;
      float errG = oldG - newG;
      float errB = oldB - newB;

      color c = image.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      r = r + errR *7/16.0;
      g = g + errG *7/16.0;
      b = b + errB *7/16.0;
      image.pixels[index] = color(r, g, b);

      index = index(x - 1, y + 1);
      c = image.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR *3/16.0;
      g = g + errG *3/16.0;
      b = b + errB *3/16.0;
      image.pixels[index] = color(r, g, b);

      index = index(x    , y + 1);
      c = image.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR *5/16.0;
      g = g + errG *5/16.0;
      b = b + errB *5/16.0;
      image.pixels[index] = color(r, g, b);

      index = index(x + 1, y + 1);
      c = image.pixels[index];
      r = red(c);
      g = green(c);
      b = blue(c);
      r = r + errR *1/16.0;
      g = g + errG *1/16.0;
      b = b + errB *1/16.0;
      image.pixels[index] = color(r, g, b);
      
    }
  }
  image.updatePixels();
  image(image, 600, 0);
}
