 
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
  //translate(width/2, height/2);
  
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
  
  //color of stroke and fill
  stroke(150, 0, 180);
  fill(170, 170, 0);
  
  //draw objects
  drawIcosa(width/3-50, 150);
  drawCube(width/2+50, 150);
  drawCylinder(0, 130, 190, 4, width/3-50, 380);
  
  drawTwiceCylinder(0,125,125,5, width/2+50, 390);
  drawTwiceCylinder(0,125,125,6, width/2+250, 210);
  
 }
 
void drawIcosa(float cox, float coy){
  pushMatrix();
  translate(cox, coy);
  rotateX(-ymag); 
  rotateY(-xmag); 
  strokeWeight(1);
  
  //stroke(170, 0, 0);
  //noFill();
  
  ico1.create();
  popMatrix(); 
}
 
 
void drawCube(float cox, float coy){
  pushMatrix();
  translate(cox, coy);
  
  rotateX(-ymag); 
  rotateY(-xmag); 
  
  scale(50);
  strokeWeight(0.06);
  
  beginShape(QUAD);
  
  //stroke(150,0,180);
  
  
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
 
 void drawCylinder(float topRadius, float bottomRadius, float tall, int sides, float cox, float coy) {
  
  pushMatrix();
  
  translate(cox,coy);
  scale(0.6);
  rotateY(map(mouseX, 0, width, 0, TWO_PI));
  rotateZ(map(mouseY, 0, height, 0, -TWO_PI));
  
  strokeWeight(3); 
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; ++i) {
    vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
    vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
    angle += angleIncrement;
  }
  endShape();
  
  // If it is not a cone, draw the circular top cap
  if (topRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    
    // Center point
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
  
  // If it is not a cone, draw the circular bottom cap
  if (bottomRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);

    // Center point
    vertex(0, tall, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
  
  popMatrix();
}

 void drawTwiceCylinder(float topRadius, float bottomRadius, float tall, int sides, float cox, float coy) {
  pushMatrix();
  translate(cox, coy);
  scale(0.75);
  rotateY(map(mouseX, 0, width, 0, TWO_PI));
  rotateZ(map(mouseY, 0, height, 0, -TWO_PI));
  
  //rotateX(-ymag); 
  //rotateY(-xmag); 
  strokeWeight(3);
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; ++i) {
    vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
    vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
    angle += angleIncrement;
  }
  endShape();
  // If it is not a cone, draw the circular top cap
  if (topRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    
    // Center point
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }

  // If it is not a cone, draw the circular bottom cap
  if (bottomRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);

    // Center point
    vertex(0, tall, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
  
  //SECOND
  translate(0,2*tall);
  //rotateY(radians(360));
  //rotateZ(radians(360));
  beginShape(QUAD_STRIP);
  
  angle = 0;
  
   for (int i = 0; i < sides + 1; ++i) {
    vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
    vertex(bottomRadius*cos(angle), -tall, bottomRadius*sin(angle));
    angle += angleIncrement;
  }
  endShape();
  
  
  //translate(0,tall/2);
  
  
  
  // If it is not a cone, draw the circular top cap
  //if (topRadius != 0) {
  //  angle = 0;
  //  beginShape(TRIANGLE_FAN);
    
  //  // Center point
  //  vertex(0, 0, 0);
  //  for (int i = 0; i < sides + 1; i++) {
  //    vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
  //    angle += angleIncrement;
  //  }
  //  endShape();
  //}

  // If it is not a cone, draw the circular bottom cap
  //if (bottomRadius != 0) {
  //  angle = 0;
  //  beginShape(TRIANGLE_FAN);

  //  // Center point
  //  vertex(0, tall, 0);
  //  for (int i = 0; i < sides + 1; i++) {
  //    vertex(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
  //    angle += angleIncrement;
  //  }
  //  endShape();
  //}
  
  
  popMatrix();
}
 
