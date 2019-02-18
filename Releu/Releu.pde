PImage back , relay;
float w,h,x,y,x2,y2;
float camSpeed;
float openSpeed;
boolean move ,open =false;
PFont font ;
int stage = 0;
float targetPos = 0;
 
void setup(){
  size(800,500,P2D);
back =loadImage("placaReleu.png");
relay = loadImage("placaReleu1.png");
w = width;
h= height;
x=-w/2;
y=-h/2;
x2=x;
y2=y;
camSpeed= 10;
openSpeed= 2; 

font = createFont("AvenirNextLTPro-Demi.otf" , 80);
textFont(font);
fill(245);
strokeWeight(10);
stroke(10);
}

void draw(){
  background(51);
  
  switch(stage){
    case 0 :
      targetPos = -300;
      break;
    case 1: 
      targetPos = -800;
      x2=x;
      y2=y;
      open = false;
      break;
    case 2 :
      open = true;
      x2+=openSpeed;
      y2-=openSpeed;
      break;
    case 4 :
      if(x2>x){
        x2-=openSpeed;
        y2+=openSpeed;
      }
      break;
  }
  setPos(targetPos);
 pushMatrix();
translate(width/2,height/2);
image(back , x,y,w,h);
if(!open){
  x2=x;
  y2=y;
}
  
 image(relay , x2 ,y2 ,w ,h);

//else{

//}
textSize(80);
text("Relee Electronice", -width/2+10,-height/2+100);
popMatrix();

textSize(40);
text(x , 10 ,200);
text(stage, width-100, 200);
}

void setPos(float trg){
  float target = trg;
 
  if(x > target ){
    w+=camSpeed;
    h+=camSpeed;
    x-=camSpeed/2;
    y-=camSpeed/2;
  }
  else if(x < target){
    w-=camSpeed;
    h-=camSpeed;
    x+=camSpeed/2;
    y+=camSpeed/2;
  }

}

void mousePressed(){
 
 if(mouseButton == LEFT){
   //camSpeed   = -camSpeed;
   stage++;
 }
 else if(mouseButton == RIGHT){
   stage--;
 }
 
}

void keyPressed(){
   switch(keyCode){
   case 32: open = !open;
   break;
   case 87 : move = !move;
   break;
   
   }
}
