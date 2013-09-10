/*Lugar Lugares[]={
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
int[] defaultp={0,0};
Arco[] Arcos={
  new Arco(Lugares[0].getDown(),Transiciones[0].getUp()),
  new Arco(Lugares[1].getDown(),Transiciones[0].getUp()),
  new Arco(Transiciones[0].getDown(),Lugares[2].getUp()),
  new Arco(Lugares[2].getDown(),Transiciones[1].getUp()),
  new Arco(Transiciones[1].getDown(),Lugares[3].getUp()),
  new Arco(Lugares[3].getDown(),Transiciones[2].getUp()),
  new Arco(Transiciones[2].getDown(),Lugares[4].getUp()),
  new Arco(Lugares[4].getDown(),Transiciones[3].getUp()),
  new Arco(Transiciones[3].getDown(),Lugares[5].getUp()),
  new Arco(Lugares[5].getDown(),Transiciones[4].getUp()),
  new Arco(Transiciones[4].getDown(),Lugares[6].getUp()),
  new Arco(Lugares[6].getDown(),Transiciones[5].getUp()),
  new Arco(Transiciones[5].getDown(),Lugares[7].getUp()),
  new Arco(Lugares[7].getDown(),Transiciones[6].getUp()),
  new Arco(Transiciones[6].getDown(),Lugares[8].getUp()),
  new Arco(Lugares[8].getDown(),Transiciones[7].getUp()),
  new Arco(Transiciones[7].getDown(),Lugares[9].getUp()),
  new Arco(Lugares[9].getDown(),Transiciones[8].getUp()),
  new Arco(Transiciones[8].getDown(),Lugares[10].getDown()),
  new Arco(Lugares[10].getUp(),Transiciones[9].getDown()),
  new Arco(Transiciones[9].getUp(),Lugares[11].getDown()),
  new Arco(Lugares[11].getUp(),Transiciones[10].getDown()),
  new Arco(Transiciones[10].getUp(),Lugares[12].getDown()),
  new Arco(Lugares[12].getUp(),Transiciones[11].getDown()),
  new Arco(Transiciones[11].getUp(),Lugares[13].getDown()),
  new Arco(Lugares[13].getUp(),Transiciones[12].getDown()),
  new Arco(Transiciones[12].getUp(),Lugares[14].getDown()),
  new Arco(Lugares[14].getUp(),Transiciones[13].getDown()),
  new Arco(Transiciones[13].getUp(),Lugares[15].getDown()),
  new Arco(Lugares[15].getUp(),Transiciones[14].getDown()),
  new Arco(Transiciones[14].getUp(),Lugares[16].getDown())  
};*/
Lugar[] Lugares;
Transicion[] Transiciones;
Arco[] Arcos;
void setup() {
  size(500, 500);
  int cantidad = 10;
  Lugares = new Lugar[cantidad];
  Transiciones = new Transicion[cantidad];
  Arcos = new Arco[cantidad*4];
  int arcount=0;
  for (int i=0;i<cantidad/2;i++){
    Lugares[i]= new Lugar("p"+i,100,(i+1)*40);
    Transiciones[i]= new Transicion(125,20+(i+1)*40,20);
  }
  for (int i=cantidad/2;i<cantidad;i++){
    Lugares[i]= new Lugar("p"+i,200,(cantidad+1)*40-(i+1)*40);
    Transiciones[i]= new Transicion(225,20+(cantidad+1)*40-(20+(i+1)*40),20);
  }
  for (int i=1;i<=cantidad/2;i++){
    Arcos[arcount++] = new Arco(Lugares[i-1].getDown(),Transiciones[i-1].getUp());
    Arcos[arcount++] = new Arco(Transiciones[i-1].getDown(),Lugares[i].getUp());
  }
  for (int i=cantidad/2+1;i<cantidad;i++){
    Arcos[arcount++] = new Arco(Lugares[i-1].getUp(),Transiciones[i-1].getDown());
    Arcos[arcount++] = new Arco(Transiciones[i-1].getUp(),Lugares[i].getDown());
  }
}

void draw() {
  for (int i=0;i<Lugares.length;i++){
    Lugares[i].update();
  }
  for (int i=0;i<Transiciones.length;i++){
    Transiciones[i].update();
  }
  for (int i=0;i<Arcos.length;i++){
    if (Arcos[i]!=null){
      Arcos[i].update();
    }else{
      break;
    }
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
    strokeWeight(6);
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
  void set(int[] beg,int[] end){
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

