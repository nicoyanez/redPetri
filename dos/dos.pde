Lugar arr[]={
  new Lugar("p1",100,30),
  new Lugar("p2",140,30),
  new Lugar("p3",120,100),
  new Lugar("p4",120,140),
  new Lugar("p5",120,180),
  new Lugar("p6",120,220)
};
Transicion arr2[]={
  new Transicion(110,65,20),
  new Transicion(150,120,20),
  new Transicion(150,160,20),
  new Transicion(150,200,20)
};
Arco arr3[]={
  new Arco(arr[0].getDown(),arr2[0].getUp()),
  new Arco(arr[1].getDown(),arr2[0].getUp()),
  new Arco(arr2[0].getDown(),arr[2].getUp()),
  new Arco(arr[2].getUp(),arr2[1].getUp()),
  new Arco(arr2[1].getDown(),arr[3].getUp()),
  new Arco(arr[3].getDown(),arr2[2].getUp())
};
void setup() {
  size(500, 400);
}

void draw() {
  for (int i=0;i<arr.length;i++){
    arr[i].update();
  }
  for (int i=0;i<arr2.length;i++){
    arr2[i].update();
  }
  for (int i=0;i<arr3.length;i++){
    arr3[i].update();
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
    float angulo1 = as-20;
    float angulo2 = as+20;
    float l1x = 5*cos(angulo1);
    float l1y = 5*sin(angulo1);
    float l2x = 5*cos(angulo2);
    float l2y = 5*sin(angulo2);
    if(beg[1]<end[1]){
      line(end[0],end[1],end[0]-l1x,end[1]-l1y);
      line(end[0],end[1],end[0]-l2x,end[1]-l2y);
    }else{
      line(end[0],end[1],end[0]-l1x,end[1]+l1y);
      line(end[0],end[1],end[0]-l2x,end[1]+l2y);
    }    
  }
}

