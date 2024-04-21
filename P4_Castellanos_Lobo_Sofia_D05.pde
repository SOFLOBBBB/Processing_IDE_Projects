PImage fondo, pelota, botones;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim fondo_sound,ball_sound;
AudioPlayer player1,player2;

void setup() {
  size(1440, 792);
  fondo_sound = new Minim(this);
  ball_sound = new Minim(this);
  player1 = fondo_sound.loadFile("fondo.mp3");
  player2 = ball_sound.loadFile("bouncing.mp3");
  fondo = loadImage("fondo.jpeg");
  pelota = loadImage("pelota.png");
  botones = loadImage("botones.png");
  frameRate(60);
  v = 1; // velocidad 
}

float v, x = 0, y = 0, z = 0, i = 0, distancia = 0.5;
boolean band = true, pause = false, bounce = false;
int cont = 0, lap = 0, pause_time = 1000; 

void draw() {
  if (!player1.isPlaying()) {
     player1 = fondo_sound.loadFile("fondo.mp3");
    player1.play();
    
  }
  if (cont >= 8 || x > width) {
    //x = x + v; // Continuar moviendo hacia la derecha hasta salir de la pantalla
    println("Cont: " + cont + "\nWidth: " + width+ "\nHeight: "+ height + "\nX: "+x+"\nY: "+y+"\nDist: "+distancia);
      delay(1000);
      x = 0;
      y = 0;
      z = 0;
      i = 0;
      cont = 0;
      noLoop();
      lap = 1;
  } else {
    x++;
    i = ((height - 200) * x * x) / ((width - 200) * (width - 200));
    z = (band == true) ? z + 1 : z - 1;
    y = ((z * z) / (40 * distancia)) + i;

    if (z == 0) {
      if(cont != 7 && distancia == 0.5)
      {
      save("captura.jpg");
      cap(1);
      }
      cont++;
      bounce = false;
    }
    y = constrain(y, 0, height - 123);
    if (y >= height - 200) {  // Si la pelota llega al borde inferior, cambiar la dirección y contar el rebote
      if(!bounce)
      {
        player2.play();
        player2 = ball_sound.loadFile("bouncing.mp3");
        bounce = true;
      }
      
    }
    if (y >= height - 123) {  // Si la pelota llega al borde inferior, cambiar la dirección y contar el rebote
      band = !band; 
    }
  }
  image(fondo, 0, 0, width, height);
  image(pelota, x, y, 141, 128);
  image(botones, 673, 650, 93, 45);
}
void cap(int a) {
  fondo = (a == 1) ? loadImage("captura.jpg") : loadImage("fondo.jpeg");
}
void mouseClicked() {
  if (mouseX >= 673 && mouseX <= 859 && mouseY >= 650 && mouseY <= 695) {
    distancia = distancia + 0.1;
  }
  else if (mouseX >= 959 && mouseX <= 1145 && mouseY >= 650 && mouseY <= 695) {
    distancia = distancia - 0.1;
  }
  else if(lap == 1)
  {
    loop();
    lap = 0;
  }
   
  
}
