PImage destination;
PImage kai;
color color1, color2, color3, color4, color5;
float level1, level2, level3, level4;

void setup() {
  //size(600, 676);
  size(600, 600);
  //kai = loadImage("kai2.jpg");
  kai = loadImage("pritchard.jpg");
  destination = createImage(kai.width, kai.height, RGB);
  color1 = color(random(255), random(255), random(255)); 
  color2 = color(random(255), random(255), random(255)); 
  color3 = color(random(255), random(255), random(255)); 
  color4 = color(random(255), random(255), random(255)); 
  color5 = color(random(255), random(255), random(255));
  
  
   level1 = random(0, 60);
 level2 = random(61, 120);
  level3 = random(121, 192);
   level4 = random(193, 250);
}
void draw() {



  float thresh = 150;


  //loadPixels();
  kai.loadPixels();
  destination.loadPixels();

  for (int y = 0; y < kai.height; y++) {
    for (int x = 0; x < kai.width; x++) {


      int loc = x + y * kai.width;





      //if (brightness(kai.pixels[loc]) < thresh){
      //  destination.pixels[loc] = color(128, 0, 0);
      //} else {
      // destination.pixels[loc] = color(brightness(kai.pixels[loc])); 
      //}
      float bK = brightness(kai.pixels[loc]);
      if (bK > level1 && bK < level2) {
        destination.pixels[loc] = color1;
      } else if (bK > level2 && bK < level3) {
        destination.pixels[loc] = color2;
      } else if (bK > level3 && bK < level4) {
        destination.pixels[loc] = color3;
      } else if (bK > level4) {
        destination.pixels[loc] = color4;
      } else {
        destination.pixels[loc] = color5;
      }

      //float r = red (kai.pixels[loc]);
      //float g = green (kai.pixels[loc]);
      //float b = blue (kai.pixels[loc]);


      //color c = color(b, r, g);
      //destination.pixels[loc] = c;
    }
  }

  destination.updatePixels();
  image(destination, 0, 0);
}

void keyPressed(){
  if (key == 'c') {
    color1 = color(random(255), random(255), random(255)); 
  color2 = color(random(255), random(255), random(255)); 
  color3 = color(random(255), random(255), random(255)); 
  color4 = color(random(255), random(255), random(255)); 
  color5 = color(random(255), random(255), random(255));
  
   level1 = random(0, 60);
  level2 = random(61, 120);
  level3 = random(121, 192);
 level4 = random(193, 250);
  }
}
