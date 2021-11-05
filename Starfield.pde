Particle[] arr = new Particle[250];

void setup() {
  background(0);
  size(1000, 1000);
  frameRate(30);
  translate(500,500);
  for(int i = 0; i < arr.length; i++) {
    if(Math.random() < 0.1)
      arr[i] = new oddBall();
    else
      arr[i] = new Particle();
  }
}

void draw() {

  fill(0,0,0,100);
  rect(-100,-100,1200,1200);
  for(int i = 0; i < arr.length; i++) {
    arr[i].move();
    arr[i].run();
    arr[i].show(); 
  }
}


class Particle {
  double myX, myY, mySize, myAngle, mySpeed, originalX, originalY;
  float myTan;
  boolean ran;
  color myColor;
  Particle() {
    myX = 500;
    myY = 500;
    mySize = ((myX + myY)/2)/100.;
    myAngle = Math.random()*2*PI; 
    mySpeed = Math.random()*3+3;
    myColor = (int)(Math.random()*100)+100;
    ran = false;
  }
  
  void move() {
    myX+=Math.cos(myAngle)*mySpeed;
    myY+=Math.sin(myAngle)*mySpeed;
    mySize+=0.4;
    myAngle += PI/400;
    if(myX >= 1100 || myX <= -100) {
      myX = (float)(500 + Math.cos(myAngle)*7);
      myY = (float)(500  + Math.sin(myAngle)*7);
      mySize = ((myX + myY)/2)/100.;
      myAngle = Math.random()*2*PI;
      if(ran == true)
        mySpeed -= Math.random()*3;
      ran = false;
    }
    if(myY >= 1100 || myY <= -100) {
      myX = (float)(500 + Math.cos(myAngle)*7);
      myY = (float)(500  + Math.sin(myAngle)*7);
      mySize = ((myX + myY)/2)/100.;
      myAngle = Math.random()*82*PI;
      if(ran == true)
        mySpeed -= Math.random()*3;
      ran = false;
    }
  }
  
  void run() {
    if( dist(mouseX, mouseY, (float)myX, (float)myY) < 40+mySize ) {
      if((mouseY >= mouseX && mouseX >= 500 && mouseY >=500) || (mouseY >= -mouseX + 1000 && mouseX <= 500 && mouseY >= 500)) {
        if(mouseX > myX && mouseY > myY)
          myAngle += (PI/300)*mySpeed;
        if(mouseX > myX && mouseY < myY)
          myAngle += (PI/300)*mySpeed;
        if(mouseX < myX && mouseY > myY)
          myAngle -= (PI/300)*mySpeed;
        if(mouseX <= myX && mouseY <= myY)
          myAngle -= (PI/300)*mySpeed;
      }
      if((mouseY >= mouseX && mouseX <= 500 && mouseY <=500) || (mouseY <= -mouseX + 1000 && mouseX <= 500 && mouseY >= 500)) {
        if(mouseX > myX && mouseY > myY)
          myAngle += (PI/300)*mySpeed;
        if(mouseX > myX && mouseY < myY)
          myAngle -= (PI/300)*mySpeed;
        if(mouseX < myX && mouseY > myY)
          myAngle += (PI/300)*mySpeed;
        if(mouseX <= myX && mouseY <= myY)
          myAngle -= (PI/300)*mySpeed;
      } 
      if((mouseY <= mouseX && mouseX >= 500 && mouseY >=500) || (mouseY >= -mouseX + 1000 && mouseX >= 500 && mouseY <= 500)) {
        if(mouseX > myX && mouseY > myY)
          myAngle -= (PI/300)*mySpeed;
        if(mouseX > myX && mouseY < myY)
          myAngle += (PI/300)*mySpeed;
        if(mouseX < myX && mouseY > myY)
          myAngle -= (PI/300)*mySpeed;
        if(mouseX <= myX && mouseY <= myY)
          myAngle += (PI/300)*mySpeed;
      } 
      if((mouseY <= mouseX && mouseX <= 500 && mouseY <=500) || (mouseY <= -mouseX + 1000 && mouseX >= 500 && mouseY <= 500)) {
        if(mouseX > myX && mouseY > myY)
          myAngle -= (PI/300)*mySpeed;
        if(mouseX > myX && mouseY < myY)
          myAngle -= (PI/300)*mySpeed;
        if(mouseX < myX && mouseY > myY)
          myAngle += (PI/300)*mySpeed;
        if(mouseX <= myX && mouseY <= myY)
          myAngle += (PI/300)*mySpeed;
      }
      mySpeed+= 0.5;
    }
  }    
  void show() {
    noStroke();
    fill(myColor);
    ellipse((float)(myX + Math.cos(myAngle)*7), (float)(myY  + Math.sin(myAngle)*7), (float)mySize, (float)mySize);
  }
}

class oddBall extends Particle {
  oddBall() {
    myX = 500;
    myY = 500;
    mySize = ((myX + myY)/2)/100.;
    myAngle = Math.random()*8; 
    mySpeed = Math.random()*3+8;
    myColor = color(255, 0, 0);    
  }

  oddBall(double x, double y) {
    myX = x;
    myY = y;
    mySize = ((myX + myY)/2)/100.;
    myAngle = Math.random()*8; 
    mySpeed = Math.random()*3+8;
    myColor = color(255, 0, 0);   
  }
}
