// inspired from http://eldar.mathstat.uoguelph.ca/dashlock/ftax/Julia.html
// https://en.wikipedia.org/wiki/Julia_set

float theta = 0;
float a = 0.7885;
float b = 0;
float radius = 2;
float radiusSquared = radius*radius;
int n = 0;
int iterations = 20;
float bound = 1.5;

void setup() {
  size(600, 600);
  colorMode(HSB, 255);
  //noLoop();
}




void draw() {
  background(255);

  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      n = 0;
      float y = map(i, 0, height, -bound, bound);
      float x = map(j, 0, width, -bound, bound);
      float modz = mod(x, y);
      while (n < iterations && modz < radiusSquared) {
        float xtemp = x * x - y * y + a;
        y = 2 * x * y + b;
        x = xtemp;
        modz = mod(x, y);
        n++;
      }
      
      
      if (n == iterations) {
        stroke(0);
      } else {
      float modu = sqrt(modz);
      float mu = n - log(log(modu))/log(radius);
      stroke((mu%iterations)/iterations*255,255,255);
      }
      point(j, i);
    }
  }

  theta += 0.01;
  a = 0.7885 * cos(theta);
  b = 0.7885 * sin(theta);

  
}

float mod(float x, float y) {
  return x * x + y * y;
}
