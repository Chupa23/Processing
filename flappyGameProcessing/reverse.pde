boolean rotated = false;

void reverse(){
  rotated = !rotated;
  grav = -grav;
  jumpForce= -jumpForce;
  crt.vel.y=0;
}

void getBackground(){
 if(rotated && backgroundZone<=1920) {
   
   backgroundZone+=55;
   
 }
 
 
 if (!rotated && backgroundZone<=2000&&backgroundZone>=55){
  backgroundZone-=55;
  
 }
  
}   
