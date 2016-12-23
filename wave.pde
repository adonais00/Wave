int x=width/2;
int y=height/2;

Mover[][] movers=new Mover[32][32];

void setup(){
 size(1000,1000);
 background(255);
 for(int i=0; i<32; i++){
   for(int j=0;j<32;j++){
   movers[i][j]=new Mover();
   movers[i][j].degree=j*5+i*5;
   }
 }
}

void draw(){
  background(255);

  for(int i=0;i<32;i++){
    for(int j=0; j<32;j++){
      pushMatrix();
      translate(i*30+25,j*30+25);
      noFill();
      strokeWeight(0.4);
      ellipse(0,0,60,60);
      movers[i][j].change(7);
      movers[i][j].update();
      movers[i][j].display();
      popMatrix();
    }
  }
  saveFrame("frames/####.png");
}
  
class Mover{
  PVector location;
  int degree=0;
  PVector center;
  
  void change(int i){
    degree+=i;
  }
    

  void update(){
    degree++;
    center=new PVector(0,0);
    location=new PVector((int)(center.x-30*Math.sin(PI*degree/180)),(int)(center.y+30*Math.cos(PI*degree/180)));
    }

  
  void display(){
    stroke(0);
    fill(0);
    ellipse( location.x,location.y,8,8);
  }
 }