void setup(){
  size(800,600);
}
int x=0, y=0;

void draw(){
  point(x++,y++);
} 
void mousePressed(){
  noLoop(); // Recibe una bandera y decirle al draw que pare
}
