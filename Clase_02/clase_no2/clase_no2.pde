void setup(){
  size(800,600);
  frameRate(300); // Cantidad de ejecuciones 
}
float x=0,y=0;
void draw(){
  x+=0.1;
  y=sin(x); //(Esta x se toma como valor para el cálculo)
  point(x*10, y*100+height/2); 
}
