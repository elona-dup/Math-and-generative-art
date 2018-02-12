//Inspired from https://www.youtube.com/watch?v=qhbuKbxJsk8
void setup() {
  size(600, 600);
  background(50);
  colorMode(HSB, 100);
  //frameRate(24);
}
int radius = 500;
float multiplier = 2.0;
int numPoints = 180;
float offset = 0.;

void draw() {
  background(0);
  pushMatrix();
  noFill();

  translate(width / 2, height / 2);
  ellipse(0, 0, radius, radius);
  offset = 0;
  for (int i = 0; i < numPoints; i++) {
    stroke(noise(offset) * 100, 100, 100, 100);
    line(radius / 2 * cos(i * TWO_PI / numPoints), radius / 2 * sin(i * TWO_PI / numPoints), radius / 2 * cos(i * TWO_PI / numPoints * multiplier), radius / 2 * sin(i * TWO_PI / numPoints * multiplier));
    offset += 0.1;
  }
  popMatrix();
  offset+=0.0001;

  multiplier += 0.01;

}
