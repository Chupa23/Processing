Character player; //<>//
Obstacle o1;
Obstacle[] obstacles = new Obstacle[3];
void setup(){
  size(800,600,P2D);
  //fullScreen(P2D);

  player = new Character(100,100,40,100);
  obstacles[0] = new Obstacle(50,300,200,20);
  obstacles[1] = new Obstacle(300,200,200,20);
  obstacles[2] = new Obstacle(550,400,200,20);
 
  surface.setTitle("Character Control Test");
}

void draw(){
  background(120);
 for(int i = 0 ; i< obstacles.length;i++){
  obstacles[i].show();}
  player.show();
  player.detect();
  player.update();
  player.move();
}

void keyPressed(){
 switch(keyCode){
  case 37: player.control("left") ;break;
  case 39: player.control("right") ;break;
  case 38: player.jump() ;break;
 }  }

void keyReleased(){
   if(keyCode==37||keyCode==39){player.control("none");}
}

void mousePressed(){
 obstacles[0].prnt();
}
