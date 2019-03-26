PImage bg;
PImage groundhogIdle;
PImage groundhogDown;
PImage groundhogLeft;
PImage groundhogRight;
PImage cabbage;
PImage life1;
PImage life2;
PImage life3;
PImage title;
PImage soil;
PImage soldier;
PImage restartHovered;
PImage restartNormal;
PImage startHovered;
PImage startNormal;
PImage gameover;

int soldierX;
float soldierY;
float cabbageX;
float cabbageY;
float life2Y;
float life3Y;
int gameState;
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_LIFE3= 2;
final int GAME_CABBAGE= 3;
final int GAME_LIFE2= 4;
final int GAME_LIFE1= 5;
final int GAME_OVER = 6;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
float x;
float y;


void setup() {
	size(640, 480, P2D);
  frameRate(15);
	
  soldierY=80*floor(random(2,6)); //soldier
  cabbageX=80*floor(random(0,8)); //cabbage
  cabbageY=80*floor(random(2,6));
  x=320;//groundhog
  y=80;
  life2Y=10;
  life3Y=500;
  
  bg=loadImage("img/bg.jpg");
  groundhogIdle=loadImage("img/groundhogIdle.png");
  groundhogDown=loadImage("img/groundhogDown.png");
  groundhogLeft=loadImage("img/groundhogLeft.png");
  groundhogRight=loadImage("img/groundhogRight.png");
  life1=loadImage("img/life.png");
  life2=loadImage("img/life.png");
  life3=loadImage("img/life.png");
  cabbage=loadImage("img/cabbage.png");
  soil=loadImage("img/soil.png");
  soldier=loadImage("img/soldier.png");
  gameover=loadImage("img/gameover.jpg");
  restartHovered=loadImage("img/restartHovered.png");
  restartNormal=loadImage("img/restartNormal.png");
  startHovered=loadImage("img/startHovered.png");
  startNormal=loadImage("img/startNormal.png");
  title=loadImage("img/title.jpg");
  
  gameState = GAME_START;
}

void draw() {
  
   switch (gameState){
    case GAME_START:     //GAME_START
      background(title);
      image(startNormal,248,360);
      if (mouseY > 360 && mouseY < 420 && mouseX > 248 && mouseX < 392){
        image(startHovered,248,360);
        if (mousePressed){
          gameState = GAME_RUN;
        }
      }
      break;
      
    case GAME_RUN:      //GAME_RUN 
    background(bg); //background
    image(soil,0,160); //soil
    image(life1,10,10);  //life
    image(life2,80,life2Y);
    image(life3,150,life3Y);
    noStroke(); //grass
    fill(124, 204, 25);
    rect(0,145,640,15);
    stroke(255, 255, 0);//sun
    strokeWeight(5);
    fill(253, 184, 19);
    ellipse(590,50,120,120);
    image(groundhogIdle,x,y);//groundhog
    if(x<0){x=0;}
    if(x>560){x=560;}
    if(y>400){y=400;}
    image(soldier,soldierX-80,soldierY); //soldier animation
    soldierX = (soldierX + 4) % 720;
    image(cabbage,cabbageX,cabbageY);//cabbage
    
    if(x==cabbageX && y==cabbageY){
      life3Y=10;
      gameState = GAME_LIFE3;
    }
     if(x<soldierX && x+80>soldierX-80 && y<soldierY+80 && y+80>soldierY){
       life2Y=life2Y-490;
       x=320;
       y=80;
       gameState = GAME_CABBAGE;
     }
      break;
      
      case GAME_LIFE3:      //GAME_LIFE3
      background(bg); //background
      image(soil,0,160); //soil
      image(life1,10,10);  //life
      image(life2,80,life2Y);
      image(life3,150,life3Y);
      noStroke(); //grass
      fill(124, 204, 25);
      rect(0,145,640,15);
      stroke(255, 255, 0);//sun
      strokeWeight(5);
      fill(253, 184, 19);
      ellipse(590,50,120,120);
      image(groundhogIdle,x,y);//groundhog
      if(x<0){x=0;}
      if(x>560){x=560;}
      if(y>400){y=400;}
      image(soldier,soldierX-80,soldierY); //soldier animation
      soldierX = (soldierX + 4) % 720;     
      
       if(x<soldierX && x+80>soldierX-80 && y<soldierY+80 && y+80>soldierY){
         life3Y=500;
         x=320;
         y=80;
         gameState = GAME_LIFE2;
       }
        break;
      
      case GAME_CABBAGE:      //GAME_CABBAGE
      background(bg); //background
      image(soil,0,160); //soil
      image(life1,10,10);  //life
      image(life2,80,life2Y);
      noStroke(); //grass
      fill(124, 204, 25);
      rect(0,145,640,15);
      stroke(255, 255, 0);//sun
      strokeWeight(5);
      fill(253, 184, 19);
      ellipse(590,50,120,120);
      image(groundhogIdle,x,y);//groundhog
      if(x<0){x=0;}
      if(x>560){x=560;}
      if(y>400){y=400;}
      image(soldier,soldierX-80,soldierY); //soldier animation
      soldierX = (soldierX + 4) % 720;    
      image(cabbage,cabbageX,cabbageY);//cabbage
      
       if(x<soldierX && x+80>soldierX-80 && y<soldierY+80 && y+80>soldierY){
          x=320;
          y=80;
          image(life2,80,life2Y);
           life2Y=10;
           soldierY=80*floor(random(2,6));
           cabbageX=80*floor(random(0,8)); 
           cabbageY=80*floor(random(2,6));
         gameState = GAME_OVER;
       }
       if(x==cabbageX && y==cabbageY){
      life2Y=10;
      gameState = GAME_LIFE2;
      }
        break;
     
      case GAME_LIFE2:      //GAME_LIFE2
      background(bg); //background
      image(soil,0,160); //soil
      image(life1,10,10);  //life
      image(life2,80,life2Y);
      noStroke(); //grass
      fill(124, 204, 25);
      rect(0,145,640,15);
      stroke(255, 255, 0);//sun
      strokeWeight(5);
      fill(253, 184, 19);
      ellipse(590,50,120,120);
      image(groundhogIdle,x,y);//groundhog
      if(x<0){x=0;}
      if(x>560){x=560;}
      if(y>400){y=400;}
      image(soldier,soldierX-80,soldierY); //soldier animation
      soldierX = (soldierX + 4) % 720;     
      
       if(x<soldierX && x+80>soldierX-80 && y<soldierY+80 && y+80>soldierY){
         life2Y=life2Y-490;
         x=320;
         y=80;
         gameState = GAME_LIFE1;
       }
        break;
        
        case GAME_LIFE1:      //GAME_LIFE1
        background(bg); //background
        image(soil,0,160); //soil
        image(life1,10,10);  //life
        noStroke(); //grass
        fill(124, 204, 25);
        rect(0,145,640,15);
        stroke(255, 255, 0);//sun
        strokeWeight(5);
        fill(253, 184, 19);
        ellipse(590,50,120,120);
        image(groundhogIdle,x,y);//groundhog
        if(x<0){x=0;}
        if(x>560){x=560;}
        if(y>400){y=400;}
        image(soldier,soldierX-80,soldierY); //soldier animation
        soldierX = (soldierX + 4) % 720;     
        
         if(x<soldierX && x+80>soldierX-80 && y<soldierY+80 && y+80>soldierY){
            x=320;
            y=80;
            image(life2,80,life2Y);
            life2Y=10;
            soldierY=80*floor(random(2,6));
            cabbageX=80*floor(random(0,8)); 
            cabbageY=80*floor(random(2,6));
          gameState = GAME_OVER;
         }
          break;
          
          case GAME_OVER:
          background(gameover);
          image(restartNormal,248,360);
          if (mouseY > 360 && mouseY < 420 && mouseX > 248 && mouseX < 392){
          image(restartHovered,248,360);
          if (mousePressed){
            soldierY=80*floor(random(2,6));
            gameState = GAME_RUN;
            }
          }
          break;

	}
}

void keyPressed(){
 if (key == CODED) {
    switch (keyCode) {
      case DOWN:
      image(groundhogDown,x,y);
      downPressed = true;
        y += 80;
        break;
      case LEFT:
      image(groundhogLeft,x,y);
      leftPressed = true;
        x -= 80;
        break;
      case RIGHT:
      image(groundhogRight,x,y);
      rightPressed = true;
        x += 80;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        image(groundhogIdle,x,y);
        break;
      case DOWN:
        downPressed = false;
        image(groundhogIdle,x,y);
        break;
      case LEFT:
        leftPressed = false;
        image(groundhogIdle,x,y);
        break;
      case RIGHT:
        rightPressed = false;
        image(groundhogIdle,x,y);
        break;
    }
  }
}
