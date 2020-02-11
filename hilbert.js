var order = 5;
var N = pow(2, order);
var total = N * N;
var path = [];

function setup() {
  createCanvas(512, 512);
  colorMode(HSB,360,255,255);
  background(0);
  
  for(var i=0;i<total;i++){
    path[i] = createVector(hilbert(i));
    var len = width / N;
    path[i].mult(len);
    path[i].add(len/2, len/2);
  }
}

var counter=0;
function draw() {
  background(255);
  stroke(255);
  strokeWeight(3);
  noFill();
  
  for(var i=1; i<counter; i++){
    var h  = map(i,0,path.length,0,360);
    //stroke(h,255,255);
    line(path[i].x, path[i].y,path[i-1].x, path[i-1].y);
  }
  
  counter++;
  
  if(counter == path.length){
    //save("hilbertbw.gif");
    counter = 0;
  }
}

function hilbert(i){
  
  var points = (
    createVector(0,0),
    createVector(0,1),
    createVector(1,1),
    createVector(1,0)
  );
  
  var index = i & 3;
   //v = points[index];
  var v = createVector(points[index]);
  for(var j=1;j<order;j++){
    i = i >>>2;
    index = i & 3;
    
    var len = pow(2,j);
    var temp;
    
    if(index == 0){
      temp = v.x;
      v.x = v.y;
      v.y = temp;
    }
    else if(index == 1){
      v.y+=len;
    }
    else if(index == 2){
      v.x+=len;
      v.y+=len;
    }
    else if(index == 3){
      temp = len - 1- v.x;
      v.x = len - 1-v.y;
      v.y = temp;
      v.x += len;
    }
  }
  return v;

}
