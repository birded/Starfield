Particle [] particles;
int xPos, yPos;

void setup()
{
	background(0);
	noStroke();
	size(800,800);
	xPos = width/2;
	yPos = height/2;
	particles = new Particle[300];
	for(int i = 0; i < particles.length; i++){
		particles[i] = new NormalParticle(width/2,height/2);
	}

	for(int i = 0; i <= 2 ; i++){
	particles[i] = new OddballParticle();
	}
	particles[3] = new JumboParticle(width/2,height/2);
}
void draw()
{
	fill(0,0,0,70);
	rect(0,0,width,height);
	for(int i = 0; i < particles.length; i++){
		particles[i].move();
		particles[i].show();
	}
	fill(0);
	ellipse(xPos,yPos,50,50);
	fill(0, 0, 0, 80);
	ellipse(xPos,yPos,80,80);
}

void mousePressed(){
	xPos = mouseX;
	yPos = mouseY;
	particles = new Particle[200];
	for(int i = 0; i < particles.length; i++){
		particles[i] = new NormalParticle(mouseX,mouseY);
	}

	for(int i = 0; i <= 2 ; i++){
	particles[i] = new OddballParticle(mouseX,mouseY);
	}
	particles[3] = new JumboParticle(mouseX,mouseY);
}

interface Particle
{
	public void move();
	public void show();
}

class NormalParticle implements Particle
{
	double x, y, speed, angle;
	int aColor;

	NormalParticle(){
		x = width/2;
		y = height/2;
		speed = Math.random() * 5;
		angle = Math.random() * 2 * PI;
		aColor = color( (int)(Math.random() * 200) + 55  , (int)(Math.random() * 200) + 55 , (int)(Math.random() * 200) + 55 );
	}

	NormalParticle(int xPos, int yPos){
		x = xPos;
		y = yPos;
		speed = Math.random() * 8;
		angle = Math.random() * 2 * PI;
		aColor = color( (int) (mouseX/150* (Math.random() * 200)) + 55  , (int)(mouseY/150 *(Math.random() * 200)) + 55 , (int)(Math.random() * 200) + 55 );
	}

	public void move(){
		x = Math.cos(angle) * speed + x;
		y = Math.sin(angle) * speed + y;
			angle = angle + PI/144;
		

	}

	public void show(){
		fill(aColor);
		ellipse((float)x, (float)y, 7, 7);
	}
}
class OddballParticle implements Particle
{
	double myX, myY, speed, angle;
	int aColor;

	OddballParticle(){
		myX = width/2;
		myY = height/2;
		speed = 20 ;
		angle = Math.random() * 2 * PI;
		aColor = color(255,0,0);
	}

	OddballParticle(int x, int y){
		myX = x;
		myY = y;
		speed = 20 ;
		angle = Math.random() * 2 * PI;
		aColor = color(255,0,0);
	}

	public void move(){
		myX = Math.sin(angle) * speed + myX;
		myY = Math.cos(angle) * speed + myY;
		angle = angle + PI/60;
	}

	public void show(){
		fill(aColor);
		ellipse( (float)myX, (float)myY, 13, 13);
	}
}

class JumboParticle extends NormalParticle
{
	JumboParticle(int xPos, int yPos){
	super(xPos,yPos);
}

	public void show(){
		fill(aColor);
		ellipse((float)x, (float)y, 45, 45);

	}
}

