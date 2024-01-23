float x=0;
float y=0;

void setup(){
   size(800,400);
   background(#E1AEA3); 
   strokeWeight(12);
}

void draw(){
  stroke(#000000); 
  if (y<=width){ //Limite
      point(y, height/2 + sin(x) * height/3); // Se adapta a la dimensión del lienzo con el tercer parámetro
      x=x+0.05; 
      y=y+2.5; //Velocidad
  }
}
