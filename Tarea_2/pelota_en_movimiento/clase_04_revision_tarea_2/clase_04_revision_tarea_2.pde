PImage fondo, pelota, botonMenos, botonMas;
float beginX = 20.0;  // Coordenada Inicial de x
float beginY = 10.0;  // Coordenada inicial de y
float endX = 570.0;   // Final de la coordenada x 
float endY = 320.0;   // Final de la coordenada y 
float distX;          // X-axis distancia para moverse
float distY;          // Y-axis distancia para moverse
float exponent = 4;   // Determina la curva
float x = 0.0;        // Coordenada actual de la x 
float y = 0.0;        // Coordenada actual de la y 
float step = 0.01;    // Size of each step along the path
float porcentaje_recorrido = 0.0;      // Percentage traveled (0.0 to 1.0)

// Controlar por el usuario la fuerza del impulso mediante dos botones
// Escala del 0 al 9 (1_10)
// Si el usuario no hace nada la pelota cae en el medio del lienzo 
// Si el usuario le pica al botón de más la pelota cae al final de la ventana 
// Si el usuario le pica al botón de menos la pelota cae más cerca 
// Es un loop donde siempre cae la pelota desde el mismo punto inicial 
// text ("Distancia: " + distancia.width-100.20);
// Botones: "image(bMenos, width-270,10,60,60);
// if (y>=height) {x=0; y=0;}
// textSize(18); modificar el tamaño del texto 


void setup() {
  size(640, 360);
  noStroke();
  distX = endX - beginX;
  distY = endY - beginY;
}

void draw() {
  fill(0, 2);
  rect(0, 0, width, height);
  porcentaje_recorrido += step;
  if (porcentaje_recorrido < 1.0) {
    x = beginX + (porcentaje_recorrido * distX);
    y = beginY + (pow(porcentaje_recorrido, exponent) * distY);
  }
  fill(255);
  ellipse(x, y, 20, 20);
}

void mousePressed() {
  porcentaje_recorrido = 0.0;
  beginX = x;
  beginY = y;
  endX = mouseX;
  endY = mouseY;
  distX = endX - beginX;
  distY = endY - beginY;
}
