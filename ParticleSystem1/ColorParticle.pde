class ColorParticle extends Particle{
  color c = color(random(0, 255), random(255), random(255));
  ColorParticle(PVector location){
   super(location); 
   
  }
  
  void display(){
   stroke(c, lifespan);
   fill(c, lifespan);
   ellipse(l.x, l.y, 15, 15);
  }
  
  
}
