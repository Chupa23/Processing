float score = 0;

class Obstacle {
 PVector pos1,pos2;
 float speed = 8;//1;//<<<<<<<<<<<<<<<<---------------
 float obWidth= 200; //30;//<<<<<<<<<<<<<<<<<<<<-----------------------
 float obHeight =1200; //400;//<<<<<<<<<<<<<<<<<<<----------------------------
 float gap = 500;//150;//<<<<<<<<<<<----------------
 boolean passed = false;
 boolean rv = false;


  Obstacle(float y_){
    pos1 = new PVector(width, y_);
    pos2 = new PVector(width, pos1.y+obHeight+gap);
  }
  
  void update(){
    pos1.x-=speed;
    pos2.x-=speed;
    
    if (pos1.x+obWidth/2< crt.pos.x && !passed){
      score++;
      passed = true;
      if (score>BScore){
       BScore = int(score);
        setBS();
 
      }
      
    }
   
   
      if (pos1.x+obWidth< crt.pos.x && !rv){
         if(random(1)< 0.5){
       reverse();
        }
        rv=true;
    }
 
  }
  
  void show (){
    rect(pos1.x,pos1.y,obWidth,obHeight);
    rect(pos2.x,pos2.y,obWidth,obHeight);
   
    
}

}    
