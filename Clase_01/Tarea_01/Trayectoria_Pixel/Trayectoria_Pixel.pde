int x = 0;  // Coordenada x del pixel

void setup() {
  size(400, 400);
}

void draw() {
  background(255);  // Fondo blanco en cada iteración
  
  // Dibuja una línea desde la esquina superior izquierda hasta la posición actual de x
  stroke(0);  // Color de la línea negro
  line(0, height/2, x, height/2);
  
  // Dibuja el pixel en la posición actual de x
  stroke(0);  // Color del pixel negro
  point(x, height/2);
  
  // Incrementa la posición x para mover el pixel hacia la derecha
  x++;
  
  // Si el pixel llega a la mitad de la ventana, reinicia su posición a 0
  if (x > width) {
    x = 0;
  }
}
