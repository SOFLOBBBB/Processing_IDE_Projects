PImage fondo, pelota, botones;

void setup() {
  size(1440, 792);
  fondo = loadImage("fondo.jpg");
  pelota = loadImage("pelota.png");
  botones = loadImage("botones.png");
  frameRate(60);
  v = 3; // velocidad 
}

float v, x = 0, y = 0, z = 0, i = 0, distancia = 0.5;
boolean band = true;
int cont = 0; 

void draw() {
  if (cont >= 8) {
    x = x + v; // Continuar moviendo hacia la derecha hasta salir de la pantalla
    if (x > width) { // Si la pelota sale de la pantalla, reiniciar variables
      x = 0;
      y = 0;
      z = 0;
      i = 0;
      cont = 0;
    }
  } else {
    x++;
    i = ((height - 200) * x * x) / ((width - 200) * (width - 200));
    z = (band == true) ? z + 1 : z - 1;
    y = ((z * z) / (40 * distancia)) + i;

    if (z == 0) {
      save("captura.jpg");
      cap(1);
    }
    if (y >= height - 123) {  // Si la pelota llega al borde inferior, cambiar la dirección y contar el rebote
      band = !band;
      cont++;
    }
  }
  image(fondo, 0, 0, width, height);
  image(pelota, x, y, 141, 128);
  image(botones, 673, 650, 93, 45);
}
void cap(int a) {
  fondo = (a == 1) ? loadImage("captura.jpg") : loadImage("fondo.jpg");
}
void mouseClicked() {
  if (mouseX >= 673 && mouseX <= 859 && mouseY >= 650 && mouseY <= 695) {
    distancia++;
  }
  if (mouseX >= 959 && mouseX <= 1145 && mouseY >= 650 && mouseY <= 695) {
    distancia--;
  }
}
