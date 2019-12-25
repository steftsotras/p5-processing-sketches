a=0;
b=0;


function setup() {
  createCanvas(800,800);
  shrink = 0.900;
  spin_speed = 0.1;
  R=random(255);
  G=random(255);
  B=random(255);
}

function draw() {
  
  background(R,G,B);  
  translate(400,400);
  for (diameter=1600; diameter > 1; diameter*=shrink) {
    d = norm(diameter, 0, 1600);

    strokeWeight(d * 25);
    fill(0,(1-d)*20);
    inner_radius = d*100*shrink;
    x = cos((b*d*100*(1-shrink))+a) * inner_radius;
    y = sin((d*b*100*(1-shrink))+a) * inner_radius;
    
    circle(x,y, diameter);
    b += d;
  }
  b = 0;
  a += spin_speed;
}

function mousePressed(){
  
  R=random(255);
  G=random(255);
  B=random(255);
  
}
