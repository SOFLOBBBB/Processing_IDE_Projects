PImage fondo;
PImage pelota;
PImage boton;
float x, y; // Coordenadas de la pelota
float xbutton, ybutton; 
float velocidad = 3; 
float coordenadaVelocidad2 = 2;

void setup() {
  size(700, 500); // Lienzo rectangular
  fondo = loadImage("fondo.jpeg");
  pelota = loadImage("pelota.png");
  boton = loadImage("boton.png");
  x = width / 2; // Posición inicial en el centro del lienzo
  y = height / 2;
  xbutton = 305;
  ybutton = 400 ;
  
  
}

void draw() {
  // Mueve la pelota
  x += velocidad;
  y += coordenadaVelocidad2;

  // Cambia de dirección en ángulo de 45 grados al chocar con los bordes
  if (x > width - 100 || x < 0) {
    velocidad *= -1;
  }

  if (y > height - 100 || y < 0) {
    velocidad *= -1;
  }

  // Dibuja la imagen de fondo en la posición (0, 0)
  image(fondo, 0, 0, width, height);

  // Dibuja la pelota en la posición actual
  image(pelota, x, y, 100, 100);
  image(boton, xbutton,ybutton,100,90);
}
void mousePressed(){
  noLoop(); 
}
void mouseReleased(){
  loop(); // Continua 
}
void mouseClicked(){

}
