PImage mapa;
Boolean cargado; 

int R[]= {
  53, 45, 57, 91, 55, 196, 66, 237, 124, 67, 164, 95, 28, 2, 23, 128, 154, 45, 77, 223
};
int G[]= {
  122, 36, 251, 68, 105, 105, 15, 225, 202, 174, 36, 138, 251, 119, 140, 187, 199, 163, 59, 182
};
int B[]= {
  149, 95, 46, 175, 81, 194, 184, 121, 4, 225, 26, 241, 25, 125, 222, 180, 124, 171, 89, 216
};
int Y[]= {
  135, 133, 140, 147, 153, 163, 97, 105, 125, 149, 162, 170, 190, 208, 220, 225, 230, 240, 253, 261
};
int X[]= {
  140, 140,140, 140,140, 140,140, 140,140, 140,140, 140,130, 120,120, 120,120, 120,120, 120
};
String ciudades[]= {
  "Valparaiso", "Juan Fernandez", "algarrobo", "San Antonio", "Pichilemu", "Talcahuano", "San Vicente", "Coronel", "Lota", "Lebu", "Constitucion", "Lirquen", "Carahue", "Villarrica", "Panguipulli", "Valdivia", "Corral", "Lago Ranco", "Puerto Varas", "Puerto Montt"
};
int carga[]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
//http://www.ctrl.cinvestav.mx/~yuw/pdf/MaTesCCJ.pdf
//matriz de incidencia donde las filas representan lugares y las columnas representan transiciones
int incidenciaEntrada[][]={
{1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, //Valparaiso
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, //Juan Fernandez
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
};
//matrices de incidencia donde las filas representan transiciones y las columnas representan lugares
int incidenciaSalida[][]={
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1}, //t1
{0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}, //t2
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
};

int pos=0, x=50;
barco b;
void setup() {
  size(500, 510);
  mapa = loadImage("mapachile.png");
  background(255);
  cargado = false;
  textSize(12);
  /*for (int i =0; i<= 190 ; i=i+10) {
    fill(R[i/10], G[i/10], B[i/10]);
    ellipse(290, i+10, 10, 10);
    ellipse(50, Y[i/10], 10, 10);
    text(ciudades[i/10], 301, i+15);
  }*/
  b = new barco("descargado", 0);
}



void draw() {
  image(mapa, 0, 0);
  textSize(20);
  fill(0, 0, 0);
  text("Teclas W= arriba , S= abajo, C = carga/descarga", 10, 500);
  textSize(12);
  for (int i =0; i<= 190 ; i=i+10) {
    fill(R[i/10], G[i/10], B[i/10]);
    //ellipse(290, i+10, 10, 10);
    ellipse(320, i+10, 10, 10);
    //ellipse(130, Y[i/10], 10, 10);
    ellipse(X[i/10], Y[i/10], 10, 10);
    text(ciudades[i/10], 331, i+15);
  }
  ////dibuja barco
  b.draw();
}

void keyPressed( ) {
  if (key=='0') {
    int veces =(b.getCarga()/10);
    for (int i=0;i<veces;i++) {
      println(i);
      b.setCarga(b.getCarga()-10);
      b.draw();
      delay(500);
    }
  }
  if (key=='c' || key=='C') {
    cargado=!cargado;
    if (cargado) {
      b.setState("Cargado");
      b.setCarga(100);
    }
    else {
      b.setState("DesCargado");
      b.setCarga(0);
    }
  }
  if (pos>0  && (key=='w'||key=='W')) {
    pos--;
  }
  if (pos<(ciudades.length-1) && (key=='s'||key=='S')) {
    pos++;
  }
  if ( b.getState()=="Cargado" && (key=='s' || key=='S' || key=='w' || key=='W' )) {
    b.setCarga(b.getCarga()-10);
    if (b.getCarga()==0) {
      b.setState("DesCargado");
      cargado = false;
    }
  }
}
//CLASES 
class barco {
  String estado;
  int lugar;
  int carga;
  barco(String estado, int lugar) {
    this.estado=estado;
    this.lugar=lugar;
    this.carga=100;
  }
  void setCarga(int c) {
    this.carga=c;
  }
  int getCarga() {
    return this.carga;
  }
  void setState(String estado) {
    this.estado=estado;
  } 
  String getState() {
    return this.estado;
  }
  void draw() {
    fill(0, 0, 0);
    rect(150, Y[pos], 30, 10);
    triangle(165, Y[pos]-20, 185, Y[pos]-10, 165, Y[pos]-5);
    rect(165, Y[pos]-20, 5, 20);
    triangle(150, Y[pos], 140, Y[pos], 150, Y[pos]+10);
    if (cargado) {
      fill(255, 0, 0);
      rect(180, Y[pos], this.carga/10, 10);
      fill(255, 0, 0);
    }
    else {
      fill(0, 0, 255);
      carga=0;
    }
    text(this.estado+" ["+this.carga+"%]", 190, Y[pos]);
  }
}

