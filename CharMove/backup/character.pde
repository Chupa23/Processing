String direction;
int jmp=0;

class Character{
  float x,y,w,h,distance,speed=2*m,accel=1*m,dirSpeed=5*m;
  boolean colision,right=false,left=false,dirCol;
  
  Character(float cx,float cy, float cw, float ch){
  x= cx*m;  y=cy*m;  w=cw*m;  h=ch*m;  }
  
  void show(){
   // rect(x,y,w,h);
    image(charImg.get(sw*k,pos*sh,105,120), x-15*m,y+5*m, w*1.3,h);
    if(frameCount%5 == 0) {   k++;}
    if (k>7){k=0;}
  }
  
  void detect (){

    for(int i=0; i< obstacles.length; i++){
     if(x+w+dirSpeed >= obstacles[i].x && x-dirSpeed <= obstacles[i].x + obstacles[i].w &&
       y+h+speed >= obstacles[i].y && y< obstacles[i].y+ obstacles[i].h)   
      {   
         if(y+h+speed - obstacles[i].y > speed){
           if( y+speed - obstacles[i].y > speed ){speed = 2*m;}
           jmp=0;}
         else{
         colision=true;

      speed=2*m;
      jmp=0;}
       break;
        }
   else{colision=false;
   obstacles[i].clr = 0;}   

    }
      dirDetect();
    }
 
void dirDetect(){
   for(int i=0; i< obstacles.length; i++){
 if (y+h>=obstacles[i].y&&x+w+dirSpeed>=obstacles[i].x&&x+dirSpeed<=obstacles[i].x+(obstacles[i].w/2)
 
 && y< obstacles[i].y +obstacles[i].h ){
        right=true;
        break;
    }
    else{
      right=false;
    }
   

   if (y+h>obstacles[i].y&&x-dirSpeed < obstacles[i].x+obstacles[i].w&&x+w>obstacles[i].x+(obstacles[i].w/2)
    && y< obstacles[i].y +obstacles[i].h){
     left=true;
     break;
   }
   else if(x>obstacles[i].x+1){
    left=false;
   }

}}
 
 void update(){
  //  print(colision);
   if(!colision){y+=speed; speed+=accel;}
 }
 
 void control( String dir){
   if (dir=="right"){direction="r"; pos = 0;}
   else if (dir=="left"){direction="l"; pos = 1;}
   else if(dir == "none"){direction="none"; pos = 2;}
 }
 
 void move(){
   if (direction=="l"&&!left){ x-=dirSpeed; }
   else if (direction=="r"&&!right){ x+=dirSpeed;}
 }
 
 void jump(){
  if(jmp<2){
   speed =-13*m;y+=speed;
   jmp++;
 }  }
 
 void respawn(){
   x=100*m;
   y=100*m;
   speed=2*m;
 }
}
