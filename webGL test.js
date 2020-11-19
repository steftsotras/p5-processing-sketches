angle = 0;
r = 0;
g = 0;
b = 0;
h = 60;
x = 20;
f=800;

function setup() {
	//createCanvas(windowWidth, windowHeight);
	createCanvas(900, 800, WEBGL);
	//background(100);
	//colorMode(RGB, 200);
	frameRate(30);
	angle = PI/2;
	rotateX(angle);
}

function draw() {
	rotateX(angle);
	//translate(0,0,150);
	background(50);
	//translate(width/2, height/2);
	//rectMode(CENTER);
	
	//ambientLight(255, 0, 0);
	pointLight(r, g, b, 0, -200, 0);
	//let h = map(sin(angle), -1, 1, 0, 100);
	
	
	for(x =0; x<f; x+=10){
		//translate(10, 0);
		push();
		translate(x, 0);
		
		//fill(r,g,b);
		//stroke(2);
		//normalMaterial();
		//rect(x-width/2 , 0, 9, h);
		
		ambientMaterial(255);
		box(10, x+ 10, h);
		pop();
		
		push();
		translate(-x, 0);
		
		//fill(r,g,b);
		//rect(x-width/2 , 0, 9, h);
		
		ambientMaterial(255);
		box(10, x+ 10, h);
		pop();
	}
	//f+=.5;
	//map(h, );
	
	angle +=.1;
	
	r +=2;
	g +=3;
	b +=1;
}
