 
// coded by Rafaelle Duarte de Freitas Oliveira in January and February of 2022
// matrícula: 04091445
// Superior de Tecnologia em Coding, UNAMA
// atividade contextualizada, disciplina Introdução ao Coding (games)
// Credits: bee sprite by Robyn@OpenGameArt, website: opengameart.org
// Credits: beehive sprite from Pinclipart, website: pinclipart.com
// credits: pot of honey by cleanpng

 /* CONTEXTO: ABELHA SALTITANTE QUE PRECISA DESVIAR DA BOLA INIMIGA. APÓS CLICAR NA TELA
É NECESSARIO PRESSIONAR A TECLA DE DIREÇÃO UP (FLEXA PARA CIMA) PARA FAZER A ABELHA 
PULAR E USAR AS DEMAIS TECLAS DE DIREÇÃO PARA MOVER A ABELHA AO LONGO DA TELA. A
ABELHA TEM 100 VIDAS E PERDE 10 A CADA ENCONTRO COM A BOLA INIMIGA. APÓS PERDER AS
100 VIDAS, AS VIDAS SE RESTABELECEM.
*/

/* não copiei código alheio, usei a documentação da Processing, ajustei 
o meu código após ler perguntas e respostas no próprio forum da Processing e ler conteúdo 
e fazer perguntas no StackOverflow, o que faz o meu códico ser muito amador e sem ajustes 
estéticos. Sou fluente em inglês britânico e prefiro codificar 
em inglês, então peço compreensão.

Link para a ajuda que recebi no Stack Overflow: 
https://stackoverflow.com/questions/71258305/what-should-i-do-in-my-code-in-order-to-make-a-collision-detection-between-a-png/71260299#71260299
*/


//*********************** Setup section starts here ***************************** //

// Lives counting and restarting game

int Lives = 100;
boolean lost=false;

// keys | keyboard
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;




// bee player character 
PImage charImage;
float charSpeed = 5.5;
float charX = 0;
float charY = 450;
float gravity = 1.5;
float vy = 0;
float bounce = -0.8;


// platforms
PImage bee;// bee
float beeX = 300; 
float beeY = 490;
PImage hi; // hi
float hiX = 400;
float hiY = 300;
PImage ve; // ve
float veX = 420;
float veY = 440;

// more beehives

PImage beehive4;// beehive4
float bee4X = 120; 
float bee4Y = 90; 
PImage beehive5; // beehive5
float bee5X = 200; 
float bee5Y = 290;
PImage beehive6;  // beehive6
float bee6X = 40; 
float bee6Y = 350;
PImage beehive7; // beehive7
float bee7X = 486;
float bee7Y = 90;

// more and more behives


PImage beehive9; // beehive9
float bee9X = 500;
float bee9Y = 700;
PImage beehive10; // beehive10
float bee10X = 550;
float bee10Y = 560;
PImage beehive11; // beehive11
float bee11X = 310;
float bee11Y = 660;
PImage beehive12; // beehive12
float bee12X = 100; 
float bee12Y = 600;

// enemy ball

float ballX = 100;
float ballY = 100;
float xspeed = 80;
float yspeed = 80;





//////
public void setup() {
  size(600, 800); 
  noStroke();
  smooth();
 noFill(); // to adjust the image in the screen properly in fullscreen


//load beehives 

bee = loadImage("beehive 1.png");
bee.resize(100, 100);
hi = loadImage("beehive 2.png");
hi.resize(100,100);
ve = loadImage("beehive 3.png");
ve.resize(100, 100);

 

// load more beehives

beehive4 = loadImage("beehive 4.png");
beehive4.resize(100, 100);
beehive5 = loadImage("beehive 5.png");
beehive5.resize(100, 100);
beehive6 = loadImage("beehive 6.png");
beehive6.resize(100, 100);
beehive7 = loadImage("beehive 7.png");
beehive7.resize(100, 100);

// load more and more beehives


beehive9 =  loadImage("beehive9.png");
beehive9.resize(100, 100);
beehive10 = loadImage("beehive10.png");
beehive10.resize(100, 100);
beehive11 = loadImage("beehive11.png");
beehive11.resize(100, 100);
beehive12 = loadImage("beehive12.png");
beehive12.resize(100, 100);

}




/*********** drawing section !***********/



public void draw() {
background(244, 240, 219);
noStroke();

// render beehives 

image(bee, beeX, beeY);
image(hi, hiX, hiY);
image(ve, veX, veY);

// render more beehives

image(beehive4, bee4X, bee4Y);
image(beehive5, bee5X, bee5Y);
image(beehive6, bee6X, bee6Y);
image(beehive7, bee7X, bee7Y);
 
 // render more and more beehives
 
 
 image(beehive9, bee9X, bee9Y);
 image(beehive10, bee10X, bee10Y);
 image(beehive11, bee11X, bee11Y);
 image(beehive12, bee12X, bee12Y);
 
 
 // render bee 

 charImage = loadImage("bee walk 3.png");
 charImage.resize(200, 200);
 
vy += gravity; // it applies gravity to the bee sprite
  charY += vy;
  if(charY > height - 150 )
    vy *= bounce;  // bouncing bee
    



 // Add the current speed to the location.
  ballX = ballX + xspeed;
  ballY = ballY + yspeed;

  // Check for bouncing
  if ((ballX > width) || (ballX < 0)) {
    xspeed = xspeed * -1;
  }
  if ((ballY > height) || (ballY < 0)) {
    yspeed = yspeed * -1;
  }

// Display at x,y location
  stroke(0);
  fill(179, 98, 0);
  ellipse(ballX, ballY,80,80);
 

 
// update keys


  if (upPressed) {
    charY--;
  }

  if (downPressed) {
    charY++;
  }

  if (leftPressed) {
    charX--;
  }

  if (rightPressed) {
    charX++;
  }



  if(keyPressed){
    if(keyCode == UP && charY > 0){
      charY -= 30;
    }
    if(keyCode == DOWN && charY < height){
      charY += 10;
    }
    if(keyCode == LEFT && charX > 0){
      charX -= 30;
    }
    if(keyCode == RIGHT && charX < width){
      charX += 10;
    }
    
  
 }


 // CHECK COLLISION: CIRCLE
  if (dist(ballX, ballY, charX, charY) < charImage.width) {
    // tint red to display collision: placeholder for subtracting bee health
    tint(192, 0, 0);
  }else{
    noTint(); } 
  
     //// Lives countig and restarting game
     
     if (dist(ballX, ballY, charX, charY) < charImage.width) {
      Lives = Lives -10;
     }
     
    ////
     if (Lives <= 0) {
     noLoop();
     } 

    
    
 ////   
   if (Lives <= 0) {
   Lives = 100;
   loop();
  
   }
   
  ////
  
  
    
    
 // Lives counting and restarting game
  textSize(40);
   text("Lives = "+Lives,40,50);
fill(0,0,0);



  // render bee character on screen 
  
  image(charImage, charX, charY);
  

  }
  
  
