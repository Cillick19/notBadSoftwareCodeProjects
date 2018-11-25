class SmallParticle extends Particle{
  
  SmallParticle(PVector location){
   super(location); 
  }
  
  void display(){
   stroke(0, lifespan);
   fill(100, lifespan);
   ellipse(l.x, l.y, 4, 4);
  }
  
  
}
