void setup (){
  size(600, 600);
  background(255);
}

void draw(){
  strokeWeight(10);
  
  // CUADRADO ROJO
  fill(255, 0, 0);
  rect(70, 60, 300, 300);
  rect(575, 439, 30, 170);
  
  // RECT AMARILLO
  fill(255, 245, 46);
  rect(370, -8, 205, 220);
  rect(-5, 435, 75, 200);
  
  // CUADRADO NEGRO
  fill(0);
  rect(70, 362, 150, 150);
  rect(225, 515, 145, 40);
  
  // RECT AZUL
  fill(22, 103, 167);
  rect(370, 439, 205, 116);
  
  // LINEAS
  line(370, 0, 370, 440);
  line(20, 60, 570, 60);
  line(225, 441, 370, 441);
  line(225, 361, 225, 608);
  line(575, 0, 575, 600);
  line(375, 360, 575, 360);
  line(145, 60, 145, 10);
  line(474, 216, 474, 360);
  line(20, 216, 68, 216);
}
