class SquareParticle extends Particle{
  
  SquareParticle(PVector location){
   super(location); 
  }
  
  void display(){
   stroke(0, lifespan);
   fill(50, lifespan);
   rectMode(CENTER);
   rect(l.x, l.y, 10, 10); 
  }
  
  
}
