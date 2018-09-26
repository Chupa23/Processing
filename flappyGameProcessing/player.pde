  float grav = 1;//0.4;//<<<<<<<<<<<<<<<<-----------------
  float jumpForce = 23;//8;//<<<<<<<<<<--------------

class Player{
  PVector pos,vel,accel;
  color col = color(255);
  float r = 100;//  30;//<<<<<<<<<<<<<<<<<<<<<<<<<--------------------------

  Player(float x_, float y_){
   pos = new PVector(x_,y_);
   vel = new PVector(0,0);
   accel = new PVector(0,grav);
    
  }
  
 void detect(){
 
    for (int i = 0; i<obs.size();i++){
      Obstacle o = obs.get(i);
      if (pos.y - vel.y - r/2 < o.pos1.y + o.obHeight || pos.y + r/2  + vel.y/2 > o.pos2.y){
        if( pos.x+r/2 > o.pos1.x && pos.x - r/2 < o.pos1.x+o.obWidth){
        game = false;
        gameOver=true;
      }
      }

    }
  } 
   

 void jump(){
   vel.y = -jumpForce ;
  // accel.y=0;
 }

 void update(){
   accel.y=grav;
   pos.add(vel);
   vel.add(accel);
  // accel.add(grav);
  

 }  
 
float rotateSpeed = 5;
float a = 0;

 void show (){
   //fill(col);
   // ellipse(pos.x,pos.y,r,r);
     pushMatrix();
       translate(pos.x,pos.y);
      if( game && rotated&& a<180){
       a+=rotateSpeed;
     }
    else if (game && !rotated && a<=180 && a >0){
       a-=rotateSpeed;
     }
         rotate(radians(a));

  image(char_img ,0-r/2-r/4,0-r/2-r/4,r+r/4,r+r/4);
  popMatrix();
  
}
} 
