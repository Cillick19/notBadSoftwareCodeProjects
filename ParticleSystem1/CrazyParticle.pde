class CrazyParticle extends Particle{
 
  CrazyParticle(PVector location){
      super(location);
      l = location.get();
      v = new PVector(random(-6, 6), random(-6, 6));
      a = new PVector(0, 0.1);
      lifespan = 255;
  }
  

  
  
  
}
