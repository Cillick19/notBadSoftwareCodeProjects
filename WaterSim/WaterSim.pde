//Cyrus Illick
//I learned Box2d from Daniel Shiffman so A lot of code that is used in this project is based on what he has taught me in Nature of Code.
//Thanks Nature of Code, I could not do this without you.

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;


Box2DProcessing box2d;


ArrayList<Boundary> boundaries;

ArrayList<Box> boxes;
boolean on = false;

Surface surface;

void setup() {
  size(640,360);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  box2d.setGravity(0, -10);
  

  


  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();
  
  surface = new Surface();


  //boundaries.add(new Boundary(width * 0.55, 50, 60, 3, 10));
  //boundaries.add(new Boundary(width * 0.45, 50, 60, 3, -10));
}

void draw() {
  background(255);



  box2d.step();




    Box[] bs = new Box[5];
    
    if(keyPressed){
     if(on){
      on = false; 
     }else{
      on = true; 
     }
    }
    
    if(on){
    for(int i = 0; i < bs.length; i++){
      bs[i] = new Box(width/2, 0);
      boxes.add(bs[i]);
    }
    }

 

  for (Boundary wall: boundaries) {
    wall.display();
  }
  surface.display();

  for (Box b: boxes) {
    b.display();
  }


  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }
}
