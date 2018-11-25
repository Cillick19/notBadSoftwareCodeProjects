ArrayList<ParticleSystem> slist;
ParticleSystem ps;
PVector g = new PVector(0, 0.1);

void setup() {
  size(600, 600);
  background(255);
  //ps = new ParticleSystem(width / 2, 40);
  slist = new ArrayList<ParticleSystem>();

}


void draw() {
  //ParticleSystem ps = slist.get(0);
  background(255);
  for(int i = 0; i < slist.size(); i++){
    ParticleSystem ps = slist.get(i);
    ParticleSystem ps2 = slist.get(i);
    if (keyPressed){
      if(key == 'd'){
        PVector wind = new PVector(0.1, 0);
        ps.applyForce(wind);
        ps2.applyForce(wind);
      }
    }

    ps.applyForce(g);
    ps2.applyForce(g);
    ps.addParticle();
    ps2.addParticle();
    ps.run();
    
    
  }
  
  
  
}

void mousePressed(){
  slist.add(new ParticleSystem(mouseX, mouseY));
  
}

void keyPressed(){
 if(key == 'w'){
   g.add(0, 0.1);
 } 
 if(key == 's'){
   g.add(0, -0.1);
 }
  
}
