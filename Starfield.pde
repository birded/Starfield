NormalParticle [] particles;

void setup()
{
	size(500,500);
	particles = new NormalParticle[200];
	for(int i = 0; i < particles.length; i++){
		particles[i] = new NormalParticle();
	}
}
void draw()
{
	background(50);
	for(int i = 0; i < particles.length; i++){
		particles[i].move();
		particles[i].show();
	}
}
class NormalParticle
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

	void move(){
		x = Math.cos(angle) * speed + x;
		y = Math.sin(angle) * speed + y;

	}

	void show(){
		fill(aColor);
		ellipse((float)x, (float)y, 5, 5);
	}
}
interface Particle
{
	//your code here
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

