angle = 0;
r = 0;
g = 0;
b = 0;
h = 20;
x = 20;
f=800;

x1 = 0;
x2 = 1;
xn = 0;

function setup() {
	
	createCanvas(900, 800, WEBGL);
	frameRate(20);
	angle = TWO_PI/2;
	
}

function draw() {
	
	for(i=0;i<150;i++){
		rotateX(angle);
		rotateY(-angle);
	}
	
	
	background(250);
	
	//translate(0 , 0, 0);
	rectMode(CENTER);
	
	//ambientLight(255, 0, 0);
	pointLight(r, g, b, 0, -200, 0);
	//let h = map(sin(angle), -1, 1, 0, 100);
	
	xn = fibo(x1,x2);
		
	push();
	//translate(x + 5, 0, 0);
	ambientMaterial(255);
	box(x + 10, xn + 10, h +xn);
	pop();

	
	angle +=.01;
	
	r +=2;
	g +=3;
	b +=1;
	
	x += 10
	
	temp = x2;
	x2 = xn;
	x1 = temp;
	
	print(xn);
	
	if(xn > 10000){
		 noLoop();
	}
}

function fibo(x1, x2){
	return x1 + x2;
}
