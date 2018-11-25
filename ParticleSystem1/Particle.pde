class Particle{
  float x, y, lifespan;
  PVector l, v, a;
  
  Particle(PVector location){
      l = location.get();
      v = new PVector(random(-2, 2), random(-2, 1));
      a = new PVector(0, 0.1);
      lifespan = 255;
  }
  
  void applyForce(PVector force){
   a.add(force);
    
  }
  
  void update(){
    v.add(a);
    l.add(v);
    a.mult(0);
    
    lifespan -= 2;
  }
  
  boolean isDead(){
   if(lifespan < 0){
    return true; 
   } else {
    return false; 
   }
  }
  
  void display(){
   stroke(0, lifespan);
   fill(50, lifespan);
   ellipse(l.x, l.y, 10, 10); 
  }
  
  
}
