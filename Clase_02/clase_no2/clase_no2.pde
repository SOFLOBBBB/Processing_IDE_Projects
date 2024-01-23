void setup(){
  size(800,600);
}
float x=0,y=0;
void draw(){
  point(x++,y+=(float)height/(float)width);
  //line(0,0,width,height);
  println("Valor de y: "+y);
}
