class ParticleSystem {

  ArrayList<Particle> plist;
  float x, y;

  ParticleSystem(float x1, float y1) {
    x = x1;
    y = y1;
    plist = new ArrayList<Particle>();
  }

  void addParticle() {
    float r = random(1);
    if (r < 0.1) {
      plist.add(new CrazyParticle(new PVector(x, y)));
    } else if (r < 0.3) {
      plist.add(new Particle(new PVector(x, y)));
    } else if (r < 0.6){
      plist.add(new SquareParticle(new PVector(x, y)));
    } else if (r < 0.8) {
     plist.add(new SmallParticle(new PVector(x, y))); 
    } else {
      plist.add(new ColorParticle(new PVector(x, y))); 
    }
  }
  
  void applyForce(PVector force){
   for(Particle p : plist){
    p.applyForce(force); 
   }
    
  }

  void run() {


    for (int i = plist.size() - 1; i > 0; i--) {
      Particle p = plist.get(i);

      p.update();
      p.display();

      if (p.isDead()) {
        plist.remove(i);
      }
    }
  }
}
