Lugar Lugares[]={
  new Lugar("p1",100,30),
  new Lugar("p2",140,30),
  new Lugar("p3",110,100),
  new Lugar("p4",120,150),
  new Lugar("p5",110,190),
  new Lugar("p6",120,230),
  new Lugar("p7",110,270),
  new Lugar("p8",120,310),
  new Lugar("p9",110,350),
  new Lugar("p10",120,390),
  new Lugar("p11",320,350),
  new Lugar("p12",320,310),
  new Lugar("p13",320,270),
  new Lugar("p14",320,230),
  new Lugar("p15",320,190),
  new Lugar("p16",320,150),
  new Lugar("p17",320,110),
  new Lugar("p18",320,80),
  new Lugar("p19",320,30),
  new Lugar("p20",420,30)
  
};

Transicion Transiciones[]={
  new Transicion(150,65,20),
  new Transicion(150,120,20),
  new Transicion(150,160,20),
  new Transicion(150,200,20),
  
  new Transicion(150,240,20),
  new Transicion(150,280,20),
  new Transicion(150,320,20),
  new Transicion(150,360,20),
  
  new Transicion(250,370,20),
  new Transicion(250,330,20),
  new Transicion(250,290,20),
  new Transicion(250,250,20),
  new Transicion(250,210,20),
  new Transicion(250,170,20),
  new Transicion(250,130,20),
  new Transicion(250,90,20),
  new Transicion(250,50,20),
  
  new Transicion(360,20,20)
};
Arco Arcos[]={
  new Arco(Lugares[0].getDown(),Transiciones[0].getUp()),
  new Arco(Lugares[1].getDown(),Transiciones[0].getUp()),
  new Arco(Transiciones[0].getDown(),Lugares[2].getUp()),
  new Arco(Lugares[2].getDown(),Transiciones[1].getUp()),
  new Arco(Transiciones[1].getDown(),Lugares[3].getUp()),
  new Arco(Lugares[3].getDown(),Transiciones[2].getUp())
};
void setup() {
  size(500, 400);
}

void draw() {
  for (int i=0;i<Lugares.length;i++){
    Lugares[i].update();
  }
  for (int i=0;i<Transiciones.length;i++){
    Transiciones[i].update();
  }
  for (int i=0;i<Arcos.length;i++){
    Arcos[i].update();
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
    strokeWeight(1);
    fill(255,255,255);
    stroke(0,0,0);
    ellipse(x, y, 30, 30);
    fill(0,0,0);
    stroke(255,5,5);
    text(texto,x-10,y);
  }
  int[] getUp(){
    int [] var = {x,y-15};
    return var;
  }
  int[] getDown(){
    int [] var = {x,y+15};
    return var;
  }
}
class Transicion{
  int x,y,ancho;
  Transicion(int x,int y,int ancho){
    this.ancho = ancho;
    this.x=x;
    this.y=y;
  }
  void update(){
    stroke(0,0,0);
    strokeWeight(3);
    //fill(255,0,0);
    line(x, y, x+ancho, y);
  }
  int[] getUp(){
    int [] var = {x+ancho/2,y-1};
    return var;
  }
  int[] getDown(){
    int [] var = {x+ancho/2,y+1};
    return var;
  }
}

class Arco{
  int[] beg;
  int[] end;
  float as;
  Arco(int[] beg,int[] end){
    this.beg = beg;
    this.end=end;
    float dx = beg[0]-end[0];
    float dy = beg[1]-end[1];
    float h = sqrt(dx*dx + dy*dy);
    as = acos(dx/h);
    println("el angulo es "+as*180/PI);
  }
  void update(){
    stroke(255,0,0);
    strokeWeight(1);
    //fill(255,1,1);
    line(beg[0], beg[1], end[0],end[1]);
    //strokeWeight(2);
    stroke(200,0,0);
    float angulo1 = as-10;
    float angulo2 = as+10;
    float l1x = 5*cos(angulo1);
    float l1y = 5*sin(angulo1);
    float l2x = 5*cos(angulo2);
    float l2y = 5*sin(angulo2);
    if(beg[1]<=end[1]){
      line(end[0],end[1],end[0]-l1x,end[1]-l1y);
      line(end[0],end[1],end[0]-l2x,end[1]-l2y);
    }else{
      line(end[0],end[1],end[0]-l1x,end[1]+l1y);
      line(end[0],end[1],end[0]-l2x,end[1]+l2y);
    }    
  }
}

