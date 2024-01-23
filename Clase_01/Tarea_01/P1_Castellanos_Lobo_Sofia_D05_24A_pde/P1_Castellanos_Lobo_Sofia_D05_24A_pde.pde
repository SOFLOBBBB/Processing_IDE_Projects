void setup() {
  size(800, 600);
  background(#00FF00); // Fondo verde RGB hexadecimal
}

float amplitude = 100; // Amplitud del gráfico senoidal
float frequency = 0.02; // Frecuencia del gráfico senoidal
float phase = 0; // Fase inicial

void draw() {
  strokeWeight(2);
  float y = height / 2 + sin(phase) * amplitude;

  if (phase < TWO_PI) {
    line(width / 2, y, width / 2 + 1, y);
    phase += frequency;
  } else {
    noLoop(); // Detener el bucle de dibujo cuando se haya completado el gráfico
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    save("P1_Paterno_Materno_Nombres_D05_24A.pde");
  }
}
