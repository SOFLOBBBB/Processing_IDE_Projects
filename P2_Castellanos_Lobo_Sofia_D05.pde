PImage fondo;
PImage pelota;
PImage cuadro;
float x1, y1; // Coordenadas de la pelota
float velocidadX = 2, velocidadY = 2; // Velocidades en las direcciones X y Y
int maxX, maxY, colTime, recovery = 600;
int BallSize = 50;
boolean col = false;
void setup() {
  size(700, 500); // Lienzo rectangular
  fondo = loadImage("fondo.png");
  pelota = loadImage("pelota.png");
  maxX = 700;
  maxY = 500;
  x1 = width / 2; // Posición inicial en el centro del lienzo
  y1 = height / 2;
}

void draw() {
  
  x1 += velocidadX;
  y1 += velocidadY;

  // Verifica colisiones con los bordes (rebote un poco antes de llegar)
  if (x1 + BallSize/2 > maxX || x1 - BallSize/2 < 0) {
    velocidadX *= -1; // Invierte la dirección en X al chocar con los bordes
  }
  if (y1 + BallSize/2 > maxY || y1 - BallSize/2 < 0) {
    velocidadY *= -1; // Invierte la dirección en Y al chocar con los bordes
  }

  // Dibuja la imagen de fondo en la posición (0, 0)
  image(fondo, 0, 0, width, height);

  // Dibuja la pelota en la posición actual
  image(pelota, x1 - BallSize/2, y1 - BallSize/2, BallSize, BallSize);

  // Dibuja el rectángulo
  if(col == false)
  {
     fill(0, 0, 255);
    rect(50, 300, 100, 50);
  }
  else
  {
    fill(139, 0, 0);
    rect(50, 300, 100, 50);
  }
  if(millis()- colTime >= recovery)
   {
      col = false;
   }
 

  // Verifica la colisión con el rectángulo
  if (x1 + BallSize/2 > 50 && x1 - BallSize/2 < 50 + 100 && y1 + BallSize/2 > 300 && y1 - BallSize/2 < 300 + 50) {
    // Invierte la dirección de la pelota al colisionar con el rectángulo
    velocidadX *= -1;
    velocidadY *= -1;
    col = true;
    colTime = millis();
  }
}
