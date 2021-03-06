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

boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean downMove=false,rightMove=false,leftMove=false,move=false;
int x,y;
int groundhogDownX=1000,groundhogDownY=-1000;
int groundhogLeftX=1000,groundhogLeftY=-1000;
int groundhogRightX=1000,groundhogRightY=-1000;
int distance;

void setup() {
	size(640, 480, P2D);
	
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
    image(groundhogIdle,x,y);
    image(groundhogDown,groundhogDownX,groundhogDownY);//groundhog
    image(groundhogLeft,groundhogLeftX,groundhogLeftY);
    image(groundhogRight,groundhogRightX,groundhogRightY);
    image(soldier,soldierX-80,soldierY); //soldier animation
    soldierX = (soldierX + 4) % 720;
    image(cabbage,cabbageX,cabbageY);//cabbage
    
     if(move){
        if(downPressed){        
          groundhogDownY+=5;
          groundhogDownY=min(groundhogDownY,400);
          distance+=5;
          if(distance==80){
            move = false;
            y = groundhogDownY;
            x = groundhogDownX;
            groundhogDownX = 1000;
            distance = 0;
            downPressed = false;
          }        
         }
         if(leftPressed){
          groundhogLeftX-=5;
          groundhogLeftX=max(groundhogLeftX,0);
          distance+=5;
          if(distance==80){
            move = false;
            y = groundhogLeftY;
            x= groundhogLeftX;
            groundhogLeftX = 1000;
            distance = 0;
            leftPressed = false;
          }    
         }
          if(rightPressed){
            groundhogRightX+=5;
            groundhogRightX=min(groundhogRightX,560);
            distance+=5;
            if(distance==80){
              move = false;
              y = groundhogRightY;
              x = groundhogRightX;
              groundhogRightX = 1000;
              distance = 0;
              rightPressed=false;
            }
          }
        }
    
    if(x==cabbageX && y==cabbageY){
      life3Y=10;
      gameState = GAME_LIFE3;
    }
     if(x<soldierX && x+80>soldierX-80 && y<soldierY+80 && y+80>soldierY){
       life2Y=life2Y-490;
       groundhogDownY=-1000;
        groundhogLeftY=1000;
        groundhogRightY=1000;
        x=320;
        y=80;
        move=false;
        distance = 0;
        downPressed=false;rightPressed=false;leftPressed=false;groundhogDownY=-1000;        
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
      image(groundhogIdle,x,y);
      image(groundhogDown,groundhogDownX,groundhogDownY);//groundhog
      image(groundhogLeft,groundhogLeftX,groundhogLeftY);
      image(groundhogRight,groundhogRightX,groundhogRightY);
      image(soldier,soldierX-80,soldierY); //soldier animation
      soldierX = (soldierX + 4) % 720;  
      if(move){
        if(downPressed){        
          groundhogDownY+=5;
          groundhogDownY=min(groundhogDownY,400);
          distance+=5;
          if(distance==80){
            move = false;
            y = groundhogDownY;
            x = groundhogDownX;
            groundhogDownX = 1000;
            distance = 0;
            downPressed = false;
          }        
         }
         if(leftPressed){
          groundhogLeftX-=5;
          groundhogLeftX=max(groundhogLeftX,0);
          distance+=5;
          if(distance==80){
            move = false;
            y = groundhogLeftY;
            x= groundhogLeftX;
            groundhogLeftX = 1000;
            distance = 0;
            leftPressed = false;
          }    
         }
          if(rightPressed){
            groundhogRightX+=5;
            groundhogRightX=min(groundhogRightX,560);
            distance+=5;
            if(distance==80){
              move = false;
              y = groundhogRightY;
              x = groundhogRightX;
              groundhogRightX = 1000;
              distance = 0;
              rightPressed=false;
            }
          }
        }
      
       if(x<soldierX && x+80>soldierX-80 && y<soldierY+80 && y+80>soldierY){
         life3Y=500;
        groundhogDownY=-1000;
        groundhogLeftY=1000;
        groundhogRightY=1000;
        x=320;
        y=80;
        move=false;
        distance = 0;
        downPressed=false;rightPressed=false;leftPressed=false;groundhogDownY=-1000;
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
      image(groundhogIdle,x,y);
      image(groundhogDown,groundhogDownX,groundhogDownY);//groundhog
      image(groundhogLeft,groundhogLeftX,groundhogLeftY);
      image(groundhogRight,groundhogRightX,groundhogRightY);      
      image(soldier,soldierX-80,soldierY); //soldier animation
      soldierX = (soldierX + 4) % 720;    
      image(cabbage,cabbageX,cabbageY);//cabbage
      if(move){
        if(downPressed){        
          groundhogDownY+=5;
          groundhogDownY=min(groundhogDownY,400);
          distance+=5;
          if(distance==80){
            move = false;
            y = groundhogDownY;
            x = groundhogDownX;
            groundhogDownX = 1000;
            distance = 0;
            downPressed = false;
          }        
         }
         if(leftPressed){
          groundhogLeftX-=5;
          groundhogLeftX=max(groundhogLeftX,0);
          distance+=5;
          if(distance==80){
            move = false;
            y = groundhogLeftY;
            x= groundhogLeftX;
            groundhogLeftX = 1000;
            distance = 0;
            leftPressed = false;
          }    
         }
          if(rightPressed){
            groundhogRightX+=5;
            groundhogRightX=min(groundhogRightX,560);
            distance+=5;
            if(distance==80){
              move = false;
              y = groundhogRightY;
              x = groundhogRightX;
              groundhogRightX = 1000;
              distance = 0;
              rightPressed=false;
            }
          }
        }
      
       if(x<soldierX && x+80>soldierX-80 && y<soldierY+80 && y+80>soldierY){
        groundhogDownY=-1000;
        groundhogLeftY=1000;
        groundhogRightY=1000;
        x=320;
        y=80;
        move=false;
        distance = 0;
        downPressed=false;rightPressed=false;leftPressed=false;groundhogDownY=-1000;
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
      image(groundhogIdle,x,y);
      image(groundhogDown,groundhogDownX,groundhogDownY);//groundhog
      image(groundhogLeft,groundhogLeftX,groundhogLeftY);
      image(groundhogRight,groundhogRightX,groundhogRightY);      
      image(soldier,soldierX-80,soldierY); //soldier animation
      soldierX = (soldierX + 4) % 720; 
      if(move){
        if(downPressed){        
          groundhogDownY+=5;
          groundhogDownY=min(groundhogDownY,400);
          distance+=5;
          if(distance==80){
            move = false;
            y = groundhogDownY;
            x = groundhogDownX;
            groundhogDownX = 1000;
            distance = 0;
            downPressed = false;
          }        
         }
         if(leftPressed){
          groundhogLeftX-=5;
          groundhogLeftX=max(groundhogLeftX,0);
          distance+=5;
          if(distance==80){
            move = false;
            y = groundhogLeftY;
            x= groundhogLeftX;
            groundhogLeftX = 1000;
            distance = 0;
            leftPressed = false;
          }    
         }
          if(rightPressed){
            groundhogRightX+=5;
            groundhogRightX=min(groundhogRightX,560);
            distance+=5;
            if(distance==80){
              move = false;
              y = groundhogRightY;
              x = groundhogRightX;
              groundhogRightX = 1000;
              distance = 0;
              rightPressed=false;
            }
          }
        }
      
       if(x<soldierX && x+80>soldierX-80 && y<soldierY+80 && y+80>soldierY){
         life2Y=life2Y-490;
        groundhogDownY=-1000;
        groundhogLeftY=1000;
        groundhogRightY=1000;
        x=320;
        y=80;
        move=false;
        distance = 0;
        downPressed=false;rightPressed=false;leftPressed=false;groundhogDownY=-1000;
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
        image(groundhogIdle,x,y);image(groundhogIdle,x,y);
        image(groundhogDown,groundhogDownX,groundhogDownY);//groundhog
        image(groundhogLeft,groundhogLeftX,groundhogLeftY);
        image(groundhogRight,groundhogRightX,groundhogRightY);  
        image(soldier,soldierX-80,soldierY); //soldier animation
        soldierX = (soldierX + 4) % 720;  
        if(move){
        if(downPressed){        
          groundhogDownY+=5;
          groundhogDownY=min(groundhogDownY,400);
          distance+=5;
          if(distance==80){
            move = false;
            y = groundhogDownY;
            x = groundhogDownX;
            groundhogDownX = 1000;
            distance = 0;
            downPressed = false;
          }        
         }
         if(leftPressed){
          groundhogLeftX-=5;
          groundhogLeftX=max(groundhogLeftX,0);
          distance+=5;
          if(distance==80){
            move = false;
            y = groundhogLeftY;
            x= groundhogLeftX;
            groundhogLeftX = 1000;
            distance = 0;
            leftPressed = false;
          }    
         }
          if(rightPressed){
            groundhogRightX+=5;
            groundhogRightX=min(groundhogRightX,560);
            distance+=5;
            if(distance==80){
              move = false;
              y = groundhogRightY;
              x = groundhogRightX;
              groundhogRightX = 1000;
              distance = 0;
              rightPressed=false;
            }
          }
        }
         if(x<soldierX && x+80>soldierX-80 && y<soldierY+80 && y+80>soldierY){
          groundhogDownY=-1000;
          groundhogLeftY=1000;
          groundhogRightY=1000;
          x=320;
          y=80;
          move=false;
          distance = 0;
          downPressed=false;rightPressed=false;leftPressed=false;groundhogDownY=-1000;
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
            x=320;//groundhog
            y=80;
            soldierY=80*floor(random(2,6));
            cabbageX = 80*floor(random(0,8));
            cabbageY = 80*floor(random(2,6));
            groundhogDownY=-1000;groundhogRightY=1000;groundhogLeftY=1000;
            distance=0;
            move=false;
            downPressed=false;rightPressed=false;leftPressed=false;
            gameState = GAME_RUN;
            }
          }
          break;

	}
}

void keyPressed(){
  if(key==CODED){
    switch(keyCode){
      case DOWN:
        if(move==false){
          groundhogDownY = y;
          groundhogDownX = x;
          x=1000;
          downPressed=true;
          move = true;
        }
      break;
      case RIGHT:
        if(move==false){
          groundhogRightY = y;
          groundhogRightX = x;
          x=1000;
          rightPressed=true;
          move = true;
        }
      break;
      case LEFT:
        if(move==false){
          groundhogLeftY = y;
          groundhogLeftX = x;
          x=1000;
          leftPressed=true;
          move = true;
        }
      break;
    }
  }
}
