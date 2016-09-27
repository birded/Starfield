Particle [] particles;

void setup()
{
	noStroke();
	size(500,500);
	particles = new Particle[200];
	for(int i = 0; i < particles.length; i++){
		particles[i] = new NormalParticle();
	}

	particles[0] = new OddballParticle();
	particles[1] = new JumboParticle();
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
	particles[1] = new JumboParticle();
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
		aColor = color( (int)(Math.random() * 255) , (int)(Math.random() * 255) , (int)(Math.random() * 255) );
	}

	NormalParticle(int x, int y){
		x = x;
		y = y;
		speed = Math.random() * 5;
		angle = Math.random() * 2 * PI;
		aColor = color( (int)(Math.random() * 255) , (int)(Math.random() * 255) , (int)(Math.random() * 255) );
	}

	public void move(){
		x = Math.cos(angle) * speed + x;
		y = Math.sin(angle) * speed + y;

	}

	public void show(){
		fill(aColor);
		ellipse((float)x, (float)y, 5, 5);
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
		myX = Math.cos(angle) * speed + myX;
		myY = Math.sin(angle) * speed + myY;
		angle = angle + PI/24;
	}

	public void show(){
		fill(aColor);
		triangle( (float) myX - 10, (float) myY + 10, (float)myX, (float)myY - 10,(float) myX +10,(float) myY + 10);
	}
	//your code here
}
class JumboParticle extends NormalParticle
{
	void show(){
		fill(aColor);
		ellipse((float)x, (float)y, 45, 45);

	}
}

