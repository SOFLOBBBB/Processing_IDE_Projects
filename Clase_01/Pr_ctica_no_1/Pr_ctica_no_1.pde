void setup(){
  size(800, 600);
  background(#00FF00); // RGB Hexadecimal
}
int x=0;
void draw(){
  strokeWeight(4); // Le añade peso al trazo 
  if(x<400)
    point(x++, 300); //punto en el centro de la ventana 
}
