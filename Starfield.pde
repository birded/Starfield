Particle [] particles;

void setup()
{
	noStroke();
	size(500,500);
	particles = new Particle[300];
	for(int i = 0; i < particles.length; i++){
		particles[i] = new NormalParticle(250,250);
	}


	particles[0] = new OddballParticle();
	particles[1] = new OddballParticle();
	particles[2] = new OddballParticle();
	particles[3] = new JumboParticle();
}
void draw()
{
	background(10);
	for(int i = 0; i < particles.length; i++){
		particles[i].move();
		particles[i].show();
	}
}

void mousePressed(){

	particles = new Particle[200];
	for(int i = 0; i < particles.length; i++){
		particles[i] = new NormalParticle(mouseX,mouseY);
	}

	particles[0] = new OddballParticle();
	particles[1] = new OddballParticle();
	particles[2] = new OddballParticle();
	particles[3] = new JumboParticle();
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
		x = 250;
		y = 250;
		speed = Math.random() * 5;
		angle = Math.random() * 2 * PI;
		aColor = color( (int)(Math.random() * 200) + 55  , (int)(Math.random() * 200) + 55 , (int)(Math.random() * 200) + 55 );
	}

	NormalParticle(int xPos, int yPos){
		x = xPos;
		y = yPos;
		speed = Math.random() * 8;
		angle = Math.random() * 2 * PI;
		aColor = color( (int)(Math.random() * 200) + 55  , (int)(Math.random() * 200) + 55 , (int)(Math.random() * 200) + 55 );
	}

	public void move(){
		x = Math.cos(angle) * speed + x;
		y = Math.sin(angle) * speed + y;
		angle = angle + PI/144;

	}

	public void show(){
		fill(aColor);
		ellipse((float)x, (float)y, 8, 8);
	}
}
class OddballParticle implements Particle
{
	double myX, myY, speed, angle;
	int aColor;

	OddballParticle(){
		myX = 250;
		myY = 250;
		speed = 20 ;
		angle = Math.random() * 2 * PI;
		aColor = color(255,0,0);
	}

	public void move(){
		myX = Math.sin(angle) * speed + myX;
		myY = Math.cos(angle) * speed + myY;
		angle = angle + PI/36;
	}

	public void show(){
		fill(aColor);
		ellipse( (float)myX, (float)myY, 13, 13);
	}
}

class JumboParticle extends NormalParticle
{
	public void show(){
		fill(aColor);
		ellipse((float)x, (float)y, 45, 45);

	}
}

