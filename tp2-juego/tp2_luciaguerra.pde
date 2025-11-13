int TOTAL_VIDAS = 3;

int POSICION_INICIAL_CORAZON_IZQ = 552;
int POSICION_INICIAL_CORAZON_DER = 570;
int POSICION_INICIAL_CORAZON_ABA = 561;

int posXActual = 300;
int posYActual = 260;

boolean dibujarControles = true;
boolean NoDibujarPersonaje = false;
boolean NoDibujarPantalla = true;


void setup() {
  size(600, 600);
  background(0);
  dibujarFondo();
  dibujarPersonaje(300, 260);
}

void draw() {
  dibujarVidas();
  botones();
}

void dibujarPersonajeYVidasActualizado() {
  dibujarFondo();
  dibujarPersonaje(posXActual, posYActual);
}

void botones() {
  if (dibujarControles == true) {
    tecla(110, 420, "W");
    tecla(110, 480, "S");
    tecla(50, 480, "A");
    tecla(170, 480, "D");
  } else {
    tecla(510, 480, "R");
  }
}

void reiniciarJuego() {
  posXActual = 300;
  posYActual = 260;
  TOTAL_VIDAS = 3;

  dibujarControles = true;
  NoDibujarPersonaje = false;
  dibujarFondo();
  dibujarPersonaje(300, 260);
}

void tecla(int mx, int my, String t1) {
  textAlign(CENTER);
  stroke(162);
  strokeWeight(3);
  fill(224);
  rect(mx, my, 50, 50);
  fill(0);
  textSize(18);
  text(t1, mx + 25, my + 25);
}

void dibujarFondo() {
  background(152, 233, 255);
  noStroke();
  fill(19, 158, 19);
  rect(0, 380, 600, 220);

  if (TOTAL_VIDAS == 0) {
    dibujarPerdiste();
  }
}

void dibujarPerdiste() {
  background(255, 0, 0);
  fill(0);
  textSize(32);
  text("Perdiste", 300, 300);
  dibujarControles = false;
  NoDibujarPersonaje = true;
}

void dibujarVidas() {
  int posIzq = POSICION_INICIAL_CORAZON_IZQ;
  int posDer = POSICION_INICIAL_CORAZON_DER;
  int posAba = POSICION_INICIAL_CORAZON_ABA;

  for (int i = 0; i < TOTAL_VIDAS; i++) {
    dibujarCorazon(posIzq, posDer, posAba);
    posIzq -= 30;
    posDer -= 30;
    posAba -= 30;
  }
}

void dibujarCorazon(int posIzq, int posDer, int posAba) {
  noStroke();
  fill(237, 28, 36);
  triangle(
    posIzq, 35, 
    posDer, 35, 
    posAba, 45); // izq - der - aba
  ellipse(posIzq+5, 33, 10, 10);
  ellipse(posDer-5, 33, 10, 10);
}

void dibujarBrazos(int posX, int posY) {
  stroke(173, 18, 9);
  strokeWeight(5);
  line(posX-10, posY-50, posX-65, posY+30);
  line(posX+10, posY-50, posX+70, posY+30);
  noStroke();
  fill(242, 231, 220);
  ellipse(posX-65, posY+30, 15, 15);
  ellipse(posX+70, posY+30, 15, 15);
}

void dibujarCuerpo(int posX, int posY) {
  noStroke();
  fill(136, 0, 21);
  triangle(posX, posY-78, posX+70, posY+60, posX-60, posY+60);
}

void dibujarCabeza(int posX, int posY) {
  fill(242, 231, 220);
  ellipse(posX, posY-95, 80, 80);
  stroke(5);
  point(posX-15, posY-100);
  point(posX+15, posY-100);
  stroke(5);
  noStroke();
  fill(255);
  ellipse(posX, posY-80, 22, 22);
  fill(242, 231, 220);
  rect(posX-15, posY-95, 30, 15);
}

void dibujarPiernas(int posX, int posY) {
  fill(173, 18, 9);
  rect(posX-35, posY+60, 14, 60);
  rect(posX+25, posY+60, 14, 60);
  fill(0);
  rect(posX-46, posY+114, 25, 8);
  rect(posX+25, posY+114, 25, 8);
}


void dibujarPersonaje(int posX, int posY) {
  if (NoDibujarPersonaje == false) {
    dibujarBrazos(posX, posY);
    dibujarCuerpo(posX, posY);
    dibujarCabeza(posX, posY);
    dibujarPiernas(posX, posY);
  }
}

void calcularMovimiento(int nuevaPosX, int nuevaPosY) {
  boolean posicionValida = false;

  if (nuevaPosX > 70 && nuevaPosX < 525 &&
    nuevaPosY > 129 && nuevaPosY < 482) {
    posXActual = nuevaPosX;
    posYActual = nuevaPosY;
    posicionValida = true;
  }

  if (posicionValida == false) {
    TOTAL_VIDAS -= 1;
  }
}

void mouseClicked() {
  println("Posición X:" + mouseX, "Posición Y:" + mouseY);
  println("pos x act:", posXActual, "pos y act:", posYActual);
}

void mousePressed() {
  //TECLA W
  if ((mouseX > 110 && mouseX < 160) && (mouseY > 420 && mouseY < 470)) {
    calcularMovimiento(posXActual, posYActual - 10);
    dibujarPersonajeYVidasActualizado();
  };

  //TECLA S
  if ((mouseX > 110 && mouseX < 160) && (mouseY > 480 && mouseY < 530)) {
    calcularMovimiento(posXActual, posYActual + 10);
    dibujarPersonajeYVidasActualizado();
  };

  //TECLA A
  if ((mouseX > 50 && mouseX < 100) && (mouseY > 480 && mouseY < 530)) {
    calcularMovimiento(posXActual - 10, posYActual);
    dibujarPersonajeYVidasActualizado();
  };

  //TECLA D
  if ((mouseX > 170 && mouseX < 220) && (mouseY > 480 && mouseY < 530)) {
    calcularMovimiento(posXActual + 10, posYActual);
    dibujarPersonajeYVidasActualizado();
  };

  //TECLA R
  if ((mouseX > 510 && mouseX < 550) && (mouseY > 480 && mouseY < 530)) {
    reiniciarJuego();
  };
}

void keyPressed() {
  //TECLA W
  if (keyCode == 87) {
    calcularMovimiento(posXActual, posYActual - 10);
    dibujarPersonajeYVidasActualizado();
  }

  //TECLA S
  if (keyCode == 83) {
    calcularMovimiento(posXActual, posYActual + 10);
    dibujarPersonajeYVidasActualizado();
  }

  //TECLA A
  if (keyCode == 65) {
    calcularMovimiento(posXActual - 10, posYActual);
    dibujarPersonajeYVidasActualizado();
  }

  //TECLA D
  if (keyCode == 68) {
    calcularMovimiento(posXActual + 10, posYActual);
    dibujarPersonajeYVidasActualizado();
  }

  //TECLA R
  if (keyCode == 82) {
    reiniciarJuego();
  }
}
