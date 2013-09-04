Lugar arr[]={
   new Lugar("p1",100,300),
  new Lugar("p2",140,300),
  new Lugar("p3",120,340),
  new Lugar("p4",120,380),
  new Lugar("p5",120,420),
  new Lugar("p6",120,460),
  new Lugar("p7",120,500),
  new Lugar("p8",120,540),
  new Lugar("p9",120,580),
  new Lugar("p10",120,620)
};
void setup() {
  size(500, 700);
}

void draw() {
  for (int i=0;i<arr.length;i++){
    arr[i].update();
  }
}

void keyPressed( ) {
  if (key=='c' || key=='C') {}
}

class Lugar{
  String texto;
  int x,y;
  Lugar(String t,int x,int y){
    texto=t;
    this.x=x;
    this.y=y;
  }
  void update(){
    fill(255,255,255);
    ellipse(x, y, 30, 30);
    fill(0,0,0);
    text(texto,x-10,y);
  }
}
