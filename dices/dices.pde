 
 Icosahedron ico1;
 
 float xmag, ymag = 0;
float newXmag, newYmag = 0; 
 
 void setup(){
   
  size(940, 660, P3D);
  ico1 = new Icosahedron(75);
  //colorMode(RGB, 1); 
  
 }
 
 void draw(){
   
  background(54);
  lights();
  translate(width/2, height/2);
  
  //ROTATION
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { 
    xmag -= diff/4.0; 
  }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0; 
  }
  
  //draw objects
  drawIcosa(-width/3.5, 0);
  drawCube(width/5.5, 0);
  
 }
 
void drawIcosa(float cox, float coy){
  pushMatrix();
  translate(cox, coy);
  rotateX(-ymag); 
  rotateY(-xmag); 
  strokeWeight(1);
  stroke(170, 0, 0);
  noFill();
  
  stroke(150, 0, 180);
  fill(170, 170, 0);
  
  ico1.create();
  popMatrix(); 
}
 
 
void drawCube(float cox, float coy){
  pushMatrix();
  translate(cox, coy);
  
  rotateX(-ymag); 
  rotateY(-xmag); 
  
  scale(50);
  strokeWeight(0.1);
  
  beginShape(QUAD);
  fill(170);
  vertex(-1,  1,  1);
  vertex( 1,  1,  1);
  vertex( 1, -1,  1);
  vertex(-1, -1,  1);

  vertex( 1,  1,  1);
  vertex( 1,  1, -1);
  vertex( 1, -1, -1);
  vertex( 1, -1,  1);

  vertex( 1,  1, -1);
  vertex(-1,  1, -1);
  vertex(-1, -1, -1);
  vertex( 1, -1, -1);

  vertex(-1,  1, -1);
  vertex(-1,  1,  1);
  vertex(-1, -1,  1);
  vertex(-1, -1, -1);

  vertex(-1,  1, -1);
  vertex( 1,  1, -1);
  vertex( 1,  1,  1);
  vertex(-1,  1,  1);

  vertex(-1, -1, -1);
  vertex( 1, -1, -1);
  vertex( 1, -1,  1);
  vertex(-1, -1,  1);

  endShape();
  popMatrix();
}
 
 
