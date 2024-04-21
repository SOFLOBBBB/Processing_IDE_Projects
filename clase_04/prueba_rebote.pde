PImage fondo;
PImage pelota;
PImage botonMenos;
PImage botonMas;

float beginX = 20.0;
float beginY = 10.0;
float endX = 570.0;
float endY = 320.0;
float distancia_X;
float distancia_Y;
float exponent = 4;
float x = 0.0;
float y = 0.0;
float step = 0.01;
float porcentaje_recorrido = 0.0;

boolean rebote = false;

void setup() {
  size(961, 539);
  noStroke();
  fondo = loadImage("fondo.jpeg");
  pelota = loadImage("pelota.png");
  botonMenos = loadImage("botonMenos.png");
  botonMas = loadImage("botonMas.png");
  distancia_X = endX - beginX;
  distancia_Y = endY - beginY;
}

void draw() {
  background(0);
  image(pelota, x, y);
  image(botonMenos, width-270, 10, 60, 60);
  image(botonMas, width-100, 10, 60, 60);
  porcentaje_recorrido += step;
  if (porcentaje_recorrido < 1.0) {
    x = beginX + (porcentaje_recorrido * distancia_X);
    y = beginY + (pow(porcentaje_recorrido, exponent) * distancia_Y);
  }
  if (rebote) {
    if (y >= height) {
      porcentaje_recorrido = 0.0;
      beginX = x;
      beginY = y;
      
      if (mouseX >= width-270 && mouseX <= width-210 && mouseY >= 10 && mouseY <= 70) {
        endX = 20.0;
        endY = 320.0;
      } else if (mouseX >= width-100 && mouseX <= width-40 && mouseY >= 10 && mouseY <= 70) {
        endX = 900.0;
        endY = 320.0;
      }
      distancia_X = endX - beginX;
      distancia_Y = endY - beginY;
      rebote = false;
    }
  }
}

void mousePressed() {
  if (mouseX >= width-270 && mouseX <= width-210 && mouseY >= 10 && mouseY <= 70) {
    porcentaje_recorrido = 0.0;
    beginX = x;
    beginY = y;
    endX = mouseX;
    endY = mouseY;
    distancia_X = endX - beginX;
    distancia_Y = endY - beginY;
    rebote = true;
  }
  if (mouseX >= width-100 && mouseX <= width-40 && mouseY >= 10 && mouseY <= 70) {
    porcentaje_recorrido = 0.0;
    beginX = x;
    beginY = y;
    endX = mouseX;
    endY = mouseY;
    distancia_X = endX - beginX;
    distancia_Y = endY - beginY;
    rebote = true;
  }
}
