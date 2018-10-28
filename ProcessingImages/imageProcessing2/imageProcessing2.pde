PImage kai;
int pointilize = 1;
int dist = 40;
int opacity = 75;
int amount = 1000;
void setup(){
  //size(600, 676);
  //kai = loadImage("kai2.jpg");
  
  size(600,600);
  kai = loadImage("pritchard.jpg");
  //size(600, 400);
  //kai = loadImage("matt2.jpg");
  
}
void draw() {
  
  
        kai.loadPixels();
        
        
  int[] xValues = new int[amount];
  int[] yValues = new int[amount];
  int[] loc = new int[amount];
  float[] r = new float[amount];
  float[] g = new float[amount];
  float[] b = new float[amount];
  
  
  for (int i = 0; i < xValues.length; i++){
     xValues[i] = int(random(dist, kai.width - dist));
     yValues[i] = int(random(dist, kai.height - dist));
     loc[i] = xValues[i] + yValues[i] * kai.width;
     
      r[i] = red(kai.pixels[loc[i]]);
      g[i] = green(kai.pixels[loc[i]]);
      b[i] = blue(kai.pixels[loc[i]]);
      
      
     //noStroke();
     
       int x2 = int(random(dist, kai.width - dist));
       int y2 = int(random(dist, kai.height - dist));
       
              //strokeWeight(6);
       stroke(r[i], g[i], b[i]);
       //noStroke();

      fill(r[i], g[i], b[i], opacity);
 
      rect(xValues[i], yValues[i], pointilize, pointilize);
      

      
       fill(r[i], g[i], b[i], opacity);
       //line(xValues[i], yValues[i], xValues[i] + int(random(-dist, dist)), yValues[i] + int(random(-dist, dist)));
     
  }

     

     
 
  
  

  
  
 ////int x = int(random(dist, kai.width - dist));
 ////int y = int(random(dist, kai.height - dist));
 // int x2 = int(random(dist, kai.width - dist));
 //int y2 = int(random(dist, kai.height - dist));
 //  int x3 = int(random(dist, kai.width - dist));
 //int y3 = int(random(dist, kai.height - dist));
 //int loc = x + y * kai.width;
 // int loc2 = x2 + y2 * kai.width;
 //  int loc3 = x3 + y3 * kai.width;
 
 //int x1 = x + int(random(-dist, dist));
 //int y1 = y + int(random(-dist, dist));
 
 //kai.loadPixels();
 
 
 
 //float r = red(kai.pixels[loc]);
 //float g = green(kai.pixels[loc]);
 //float b = blue(kai.pixels[loc]);
 
 // float r2 = red(kai.pixels[loc2]);
 //float g2 = green(kai.pixels[loc2]);
 //float b2 = blue(kai.pixels[loc2]);
 
 // float r3 = red(kai.pixels[loc3]);
 //float g3 = green(kai.pixels[loc3]);
 //float b3 = blue(kai.pixels[loc3]);

 ////strokeWeight(6);
 ////stroke(r, g, b, 100);
 ////noStroke();
 //fill(r, g, b, 100);
 ////line(x, y, x1, y1);
 //rect(x, y, pointilize, pointilize);
 
 //fill(r2, g2, b2, 100);
 
 // rect(x2, y2, pointilize, pointilize);
  
  
 // fill(r3, g3, b3, 100);
 //  rect(x3, y3, pointilize, pointilize);
}
