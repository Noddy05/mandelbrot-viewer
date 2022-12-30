double size = 3;
double offsetX = -0.5;
double offsetY = 0;

int iterations = 20;

void setup() {
  size(800, 800);
}

PVector mousePos;
void draw() {
  background(5);

  for (int y = 0; y < height; y++)
  {
    for (int x = 0; x < width; x++)
    {
      double mappedX = offsetX + (x / (double)width  - 0.5) * size;
      double mappedY = offsetY + (y / (double)height - 0.5) * size;

      double a = mappedX;
      double b = mappedY;
      int n = 0;
      for (int i = 0; i < iterations; i++)
      {
        n++;
        double tempA = a;
        a = a * a - b * b + mappedX;
        b = 2 * tempA * b + mappedY;
        if (a * a + b * b > 4)
          break;
      }
      if (n == iterations) {
        set(x, y, color(0));
      } else if (n != 1){
        set(x, y, color(map(n, iterations / 3 * 2, iterations, 5, 220), 
          map(n, iterations / 3, iterations / 3 * 2, 5, 220), 
          map(n, 2, iterations / 3, 5, 220)));
      }
    }
  }

  if (mousePressed) {
    offsetX -= (mouseX - mousePos.x) / width * size;
    offsetY -= (mouseY - mousePos.y) / width * size;
  }

  mousePos = new PVector(mouseX, mouseY);
}

void mouseWheel(MouseEvent event) {
  if(event.getCount() < 0){
    size /= 1.5;
  } else{
    size *= 1.5;
  }
}
