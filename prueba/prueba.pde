PImage mapa;
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
  27, 97, 190, 187, 170, 96, 48, 236, 149, 173, 40, 233, 162, 171, 28, 251, 105, 125, 16, 183
};
String ciudades[]= {
  "Valparaiso", "Juan Fernandez", "algarrobo", "San Antonio", "Pichilemu", "Talcahuano", "San Vicente", "Coronel", "Lota", "Lebu", "Constitucion", "Lirquen", "Carahue", "Villarrica", "Panguipulli", "Valdivia", "Corral", "Lago Ranco", "Puerto Varas", "Puerto Montt"
};
int pos=0, x=50;
void setup() {
  size(500, 600);
  mapa = loadImage("mapachile.png");
  background(255);
  //image(mapa,0,0);
  textSize(12);
  for (int i =0; i<= 190 ; i=i+10) {
    fill(R[i/10], G[i/10], B[i/10]);
    ellipse(290, i+10, 10, 10);
    ellipse(50, Y[i/10], 10, 10);
    text(ciudades[i/10], 301, i+15);
  }
}



void draw() {
  image(mapa, 0, 0);
  textSize(12);
  for (int i =0; i<= 190 ; i=i+10) {
    fill(R[i/10], G[i/10], B[i/10]);
    ellipse(290, i+10, 10, 10);
    ellipse(150, Y[i/10], 10, 10);
    text(ciudades[i/10], 301, i+15);
  }
  if (pos>=0 && pos <Y.length) {
    rect(150, Y[pos], 30, 10);
  }
}

void keyPressed( ) {
  if ( pos >= 0 &&(key=='w'||key=='W')) {
    pos--;
  }
  else if (pos<=18 && (key=='s'||key=='S')) {
    pos++;
  }
}

