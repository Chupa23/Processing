String direction;
int jmp=0;

class Character{
  float x,y,w,h,distance,speed=2,accel=1,dirSpeed=5;
  boolean colision,right;
  
  Character(int cx,int cy, int cw, int ch){
  x= cx;  y=cy;  w=cw;  h=ch;  }
  
  void show(){
    fill(80);
    rect(x,y,w,h);
  }
  
  void detect (){

    for(int i=0; i< obstacles.length; i++){
      if (dist(x,y+h,obstacles[i].middleX,obstacles[i].middleY) <= obstacles[i].ip ||
      dist(x+w,y+h,obstacles[i].middleX,obstacles[i].middleY) <= obstacles[i].ip) {
   if (y+h+speed>=obstacles[i].y&&x+w>obstacles[i].x&&x<obstacles[i].x+obstacles[i].w&&y+h<obstacles[i].y+obstacles[i].h)
      { colision=true;y=obstacles[i].y-h;speed=2;jmp=0;}
   else{colision=false;}   
   
   //if (y+h>obstacles[i].y&&x+w>obstacles[i].x){
   //  right=true;
   //}else{right=false;}
   
  }   
  else {colision=false;}
    }
 }
 

 
 void update(){
  if(!colision){y+=speed; speed+=accel;}
 }
 
 void control( String dir){
   if (dir=="right"){direction="r";}
   else if (dir=="left"){direction="l";}
   else if(dir == "none"){direction="none";}
 }
 
 void move(){
   if (direction=="l"){ x-=dirSpeed;}
   else if (direction=="r"&&!right){ x+=dirSpeed;}
 }
 
 void jump(){
  if(jmp<2){
   speed =-13;y+=speed;
   jmp++;
 }  }
 
 
}
