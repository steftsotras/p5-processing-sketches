var x=0;
var y=0;
var R=255;
var G=255;
var B=255;

function setup() {
  createCanvas(600, 600);
}

function draw() {
  background(0);
  
  for (let i = 0; i < 500; i++) {
    drawPoint();
    nextPoint();
  }
}

function drawPoint(){
  stroke(R,G,B);
  strokeWeight(3);
  
  //var px = map(x, -4, 4, 0 ,width);
  //var py = map(y, 0, 8, height, 0);
  
  var px = map(x, -2.182, 2.6558, 0, width);
  var py = map(y, 0, 9.9983, height, 0);
  
  point(px, py);
  
}

function nextPoint(){
  var nextX;
  var nextY;
  
  var r = random(1);
  
  if(r < 0.01){
     nextX = 0;
     nextY = 0.16*y;
  }
  else if(r < 0.86){
     nextX = 0.85*x + 0.04*y;
     nextY = -0.04*x + 0.85*y + 1.6;
  }
  else if (r < 0.93) {
    nextX = 0.2 * x + -0.26 * y;
    nextY = 0.23 * x + 0.22 * y + 1.6;
  } 
  else {
    nextX = -0.15 * x + 0.28 * y;
    nextY = 0.26 * x + 0.24 * y + 0.44;
  }
  
  x = nextX;
  y = nextY;

}

function mousePressed(){
  
  R=random(255);
  G=random(255);
  B=random(255);
  
}
