 //<>// //<>// //<>//
Camera worldCamera;

Button[] bts ;
float bw,bh;

Character player; //<>// //<>// //<>//
Obstacle o1;
Obstacle[] obstacles = new Obstacle[5];

int dx, dy, dw, dh, sx, sy, sw, sh ,k , pos;

PImage charImg;
PImage bgr;
PImage back;

float m;
float f;
float s;
void setup(){
  
 // orientation(LANDSCAPE);
  size(1100,600,P2D);
  frameRate(60);
  //fullScreen(P2D);
  delay(1000);
  m = width/1100.00;
 
 //m = 0.4;
 
  worldCamera = new Camera();

  bts = new Button[4];
  bw = 100;
  bh = bw;
  bts[0] = new Button(140,400,bw,bh,1);
  bts[1] = new Button(10,400,bw,bh,2);
  bts[2] = new Button(900,400,bw,bh,3);
  bts[3] = new Button(10,10,bw,bh,4);

  player = new Character(100,100,864/8-35,420/3-30);
  obstacles[0] = new Obstacle(0,300,600,20);
  obstacles[1] = new Obstacle(250,200,200,100);
  obstacles[2] = new Obstacle(300,450,600,20);
  obstacles[3] = new Obstacle(1000, 100 , 20,300);
  obstacles[4] = new Obstacle(1200, 100 , 20,300);
  
  
 charImg = loadImage("char4.png");
 bgr = loadImage("backgroundp.png");
 back = loadImage("backp.png");
 bgr.resize(width, height);
 bgr=bgr.get(0,0,width,height);
 //bgr.loadPixels();
 //back.resize(width*, height*2);
 //back.loadPixels();
 dx=0;
 dy=0;
 dw=108;
 dh = 140;
 sx=0;
 sy=0;
 sw=108;
 sh = 140;
 k=0;
 pos = 2;

 // surface.setTitle("Character Control");
 textSize(35);
}



void draw(){
  
  worldCamera.set();
  //if (keyPressed){print(keyCode);}else{keyRelease();}
//   background(bgr);
  //  background(120);
  image(bgr,0,0);
   image(back , -player.x/3-width/2,-player.y/5-height/2,width*2,height*2);
  // image(back,0, 0);
   pushMatrix();
   translate(-worldCamera.pos.x, -worldCamera.pos.y);
   for(int i = 0 ; i< obstacles.length;i++){
      obstacles[i].cam();
        if(obstacles[i].onScreen){
         obstacles[i].show(); 
   }
}
  
  if(frameRate>40){s=1;}
  else if(frameRate<40){s=2;}
  for(int i = 0;i<s;i++){
  player.detect();
  player.update();
  player.move();
  }  
  player.show();

  popMatrix();
  
  for(int i = 0;i<bts.length;i++){
  // bts[i].show();
  }
  
  text(frameRate,400,50);
}

void keyPressed(){
 switch(keyCode){
   case 65:
   case 37: player.control("left") ;break;
   case 68:
   case 39: player.control("right") ;break;
   case 87:
   case 38: player.jump() ;break;
   case 82: player.respawn();
 }  }

void keyReleased(){
   if(keyCode==37||keyCode==39||keyCode==65||keyCode==68){player.control("none");}
}

//void mousePressed(){
// for(int i = 0; i<bts.length ;i++){
//   Button b=bts[i];
//   if(mouseX>b.x&&mouseX<b.x+b.w&&mouseY>b.y&&mouseY<b.y+b.h){
//    bts[i].run();
//   }
// }
//}
       //!!!!!!!!!ANDROID--------------------
//void touchStarted(){
//  for(int i=0;i<touches.length;i++){
//    for(int j=0;j<bts.length;j++){
//      Button b=bts[j];
//       if(touches[i].x>b.x&&touches[i].x<b.x+b.w&&touches[i].y>b.y&&touches[i].y<b.y+b.h){
//       bts[j].run();}
//  }
//  }
//}

//void touchEnded(){
//  if(touches.length<2){
//      player.control("none");
//      }
//}
    //!!!!!!!!!!ANDROID----------

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
