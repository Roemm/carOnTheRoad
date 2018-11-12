boolean debug = false;

// A path object (series of connected points)
Path path1;
Path path2;
Path path3;

Vehicle car1;
Vehicle car2;
Vehicle car3;
PImage car;
PImage block;


void setup() {
  fullScreen();
  // Call a function to generate new Path object
  newPath();
  car = loadImage("car.png");
  block = loadImage("block.png");

  // Each vehicle has different maxspeed and maxforce for demo purposes
  car1 = new Vehicle(new PVector(0, height*2/3), 2, 0.4);
  car2 = new Vehicle(new PVector(20, height/3), 1, 0.04);
  car3 = new Vehicle(new PVector(-300, height/3), 1, 0.04);
}

void draw() {
  background(255);

  // Display the path and blocks
  pushMatrix();
  stroke(0);
  strokeWeight(5);
  line(-10, height/3-80, width-20, height/3-80);
  line(width-20, height/3-80, width-20, height*2/3+80);
  line(-10, height*2/3+80, width-20, height*2/3+80);
  for (int a = -10; a<width-20; a+=width/20) {
    line(a, height/2, a+40, height/2);
  }
  popMatrix();

  pushMatrix();
  noStroke();
  fill(255, 0, 0);
  rect(width-18, height/3-83, 20, height/3+165);
  popMatrix();

  for (int b = width-150; b>width/2+100; b-=130) {
    image(block, b, height/2+80);
  }
  
  path1.display();
  path2.display();
  //follow the path
  if (car1.readyToArrive==false && car1.arrived == false) {
    car1.follow(path1);
  }
  if (car2.readyToArrive==false && car2.arrived == false) {
    car2.follow(path2);
  }
  if (car3.readyToArrive==false && car3.arrived == false) {
    car3.follow(path2);
  }

  // Call the generic run method (update, borders, display, etc.)
  car1.run();
  car2.run();
  car3.run();

  //car arrive
  PVector spot1 = new PVector(width-150, height/3);
  car1.arrive(spot1);
  PVector spot2 = new PVector(width*3/4+30, height/3);
  car2.arrive(spot2);
  PVector spot3 = new PVector(width/2+200, height/3);
  car3.arrive(spot3);
}

void newPath() {
  // A path is a series of connected points
  // A more sophisticated path might be a curve
  path1 = new Path();
  path1.addPoint(-10, height*2/3);
  path1.addPoint(width/2, height*2/3);
  path1.addPoint(width*2/3, height/3);
  path1.addPoint(width-180, height/3);
  //path.addPoint(width*3/4, height*3/4);
  //path.addPoint(width*3/4-50, height*3/4);
  path2 = new Path();
  path2.addPoint(-10, height/3);
  path2.addPoint(width, height/3);
}
