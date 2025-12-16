// VARIABLES //
String 脑子 = "not found";

int prayAmt = 0;

PImage light_forest;
PImage scaffolding;
PImage governor_house;
PImage dark_forest;

boolean prolouge = true; //background: light forest
boolean hester_on_scaffolding = false; //please make this a better name. background: scaffolding
boolean roger_cutscene = false; //this needs a background
boolean governor = false;
boolean guilt = false; //this needs a background
boolean night_walk = false; //this needs a background - the old pic was too low-quality
boolean angel_cutscene = false; //this is the a in the sky. needs a background - can be the scaffolding but just dark
boolean woods = false; //background: dark_forest
boolean election = false; //background: scaffolding

void setup(){
  size(800,800);
  pixelDensity(1); //needed to make sure the images work correctly
  
  light_forest = loadImage("light_forest.png");
  scaffolding = loadImage("scaffolding.png");
  governor_house = loadImage("governor_house.png");
  dark_forest = loadImage("dark_forest.jpg");
  
  background(light_forest);
}

boolean buttonPressed(int x, int y, int w, int h) {
  return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h && mousePressed;
}

void textDisplay(String Text, int x, int _y,int boxWidth, int size){
  fill(0);
  textSize(size);
  
  int y = _y + 20; /////////////JOZA: I CHANGED THE OLD 'Y' to 'y' and the old 'y' to '_y' cuz it's sus
  String text_length = "";

  for(int i = 0; i<Text.length();i++){
    if(x+5+textWidth(text_length) <= x+boxWidth-5){
      text(Text.charAt(i),x+5+textWidth(text_length),y);
    } 
    else{
      y+=15;
      text_length = "";
      text(Text.charAt(i),x+5+textWidth(text_length),y);
    }
    text_length+=Text.charAt(i);
  }
}

int button(String ChoiceOne, String ChoiceTwo, String ChoiceThree){
  //draw the button
  fill(255, 70);
  rect(10,440,250,50);
  textDisplay(ChoiceOne,15,445,240,18);
  
  fill(255, 70);
  rect(270,440,250,50);
  textDisplay(ChoiceTwo,270,445,240,18);

  fill(255, 70);
  rect(530,440,250,50);
  textDisplay(ChoiceThree,535,445,240,18);

  //text s
  if(buttonPressed(10,440,250,50)){
    return 1;
  }
  if(buttonPressed(265,440,250,50)){
    return 2;
  }
  if(buttonPressed(530,440,250,50)){
    return 3;
  }
  else{
    return 0;
  }
}

void dialouge(String Dialouge){
  fill(255, 200);
  rect(10,500,780,290);

  textDisplay(Dialouge,15,505,780,20);

  fill(255);
  triangle(765,760,775,770,765,780);
}

void drawScene (int choiceOne, int choiceTwo, int choiceThree, boolean scene, boolean nextScene1, boolean nextScene2,boolean nextScene3){
  if(scene){
    if(button("choiceOne","choiceTwo","choiceThree")==1){
      scene = false;
      nextScene1 = true;
    } 
    else if(button("choiceOne","choiceTwo","choiceThree")==2){
      scene = false;
      nextScene2 = true;
    } 
    else if(button("choiceOne","choiceTwo","choiceThree")==3){
      scene = false;
      nextScene3 = true;
    }
  }
}
void draw(){
  //asfgdawlehfgauwheifohawiufhuiawehfuiwhaleifhaiwlhfuailwehfueiwlahf

  // transition to next scene
  // create a boolen for each scene, when one of the options is true, then set own bool to false and one of the other ones to true. 

  // TO: JOZAAAAAAAAAA //

  // Here's how to syntax:
  if(prolouge){
    prolouge(); //make a function for the boolean. That way the code is clean and easy to traverse
  }
  //now go to line 152

  if(button("Oneuykfgkyufghkuygfhkuygljkluigy","Two","Three")==1){
    
  } 
  else if (button("Oneuykfgkyufghkuygfhkuygljkluigy","Two","Three")==2){

  } 
  else if (button("Oneuykfgkyufghkuygfhkuygljkluigy","Two","Three")==3){
    
  }

  //pray button
  fill(255);
  circle(750,50,40);

  fill(0);
  textSize(17);
  text("pray", 735,54);
  println(prayAmt);
}

void mouseClicked(){
  if(dist(mouseX,mouseY,750,50)<=25){
      prayAmt++;
    }
}

void prolouge(){
  background(light_forest); //the background is the image. the image MUST be 800x800 aka the same dimensions of the canvas or else it won't work
  
  dialouge("aabsdfasjdfasdnf");
  println(button("One","Two","Three"));

  //image(); //please put images of roger and the person he is talking to/looking at on the left and right of the screen respectively.
  //syntax: image(imagevariable, x-top-left-corner, y-top-left-corner);
}




/* PLANNING

- prolouge(backstory) - cutscene
You meet a nice young woman. Her name is Hester. There's something special between you. But no, you must not! You are an esteemed priest, while she is a married seamstress.

- scaffolding
Hester is convicted on the scaffolding. The crowd goes wild. Guilt naws at your heart. Little do the townspeople know, YOU are the one who sinned...
Options:
1. Condemn Hester in front of the people (the crowd is happy, Hester is shocked and hates you)
2. Admit your crimes. Preach in front of the crowd. (crowd is shocked and is wary of you. You are temporarily stripped of your duties.)
3. Canon

- meet roger - cutscene
DOESN'T HAPPEN IF YOU ADMIT YOUR CRIMES
'An ominous presence approaches you'. Hello, I'm Roger Chillingworth, and I'm a physician. Nice to meet your aquaintance. 'Per the town's wishes, you and Roger start living together to preserve your failing health'.
*PRAY BUTTON APPEARS HERE*

- governor's hall (meeting pearl and hester)
IF: you admitted your crimes, here you are asking for forgiveness AND asking for custody for Pearl
Governor: Sees Pearl (canon)
Governor: *sees you and hester* The fallen angel and the bearer of the scarlet letter, what are you doing in my abode?
Options:
1. Ask for forgiveness (governor - why would I? Roger smirks in the background) 
2. Preach how you punished yourself for your sins - Governor is happier, and will allow you to keep Pearl happily (Roger stares at you)
3. Ask for Pearl with Hester (canon hester) - BUT if you did option one and didn't do option 2, he'll be mad, and you need hester to help you

IF: You didn't admit your crimes (options 1 or 3)
Governor: sees Pearl and Hester (canon)
Options:
1. Canon
2. Apologize to Hester (Roger SUS)
3. Try to take Pearl away (doesn't work but Hester is MAD)

- guilt(flogging)
IF: You admitted your crimes
Guilt continues to knaw at your heart. It's slowly becoming unbearable
Options:
1. talk with Hester. She comforts you
2. Punish yourself
3. Pray to god (+10 prays)

IF: You didn't admit your crimes
Options:
1. Talk to Roger. He makes you more guilty
2. Punish yourself (canon)
3. Pray to god (+10 prays)

- nighttime walk (scarlet letter in the sky)
only if you didn't admit your crimes
Options:
- walk onto the scaffolding
- go home (more suffering)
- Pray to god (+10 prays)

IF: walk onto scaffolding - cutscene (A in the sky) - "the townspeople said it meant 'Angel'" 

- Arthur in the woods
IF: admitted crime
talk to hester; you reveal you've been given a chance to redeem yourself by giving a small speech at the election
Options:
Hester proposes we escape.
1. decide you don't need to escape, because you can kill roger
2. decide to ESCAPE (canon)
3. decide to NOT escape and NOT do anything about roger. Leads to BAD ending where roger kills you

IF: not admitted crime 
IF: hester mad - she ignores you 
ELSE: 
Options:
Hester reveals Roger; Hester proposes escape
1. disagree
2. agree (canon)
3. kill roger

- election sermon
IF: you admitted crime
ESCAPE:
- you deliver a holy sermon, everyone likes you, you leave the next day to live with hester (roger isn't there cuz he was never there)
NO ESCAPE:
- you deliver a holy sermon, everyone loves you, but you get killed by roger
KILL ROGER:
- you deliver a holy sermon, everyone loves you, roger is found dead the next day. 

IF: not admitted crime
ESCAPE: canon
NO ESCAPE: canon but you don't admit your crimes; roger kills you
KILL ROGER: Good ending. You deliver a holy sermon, everyone loves you more, roger is found dead the next day. You lives a slightly better life, occasionally meeting with Hester
HESTER MAD: you deliver a holy sermon, (canon), but you don't see hester. Later, you find out she left with pearl. You get killed by Roger


Scarlet Letter:

Endings:
Good Ending:
- Stay in New England with Pearl and Hester 
- no roger

Bad Ending:
- Roger Kills you
- Pearl and Hester Leave without you


Canon Ending:
- You die on the scaffold


Runaway Ending: TWO OPTIONS
Option 1:
You, Pearl, and Hester run from the town together

Option 2:
Hester and Pearl runaway by themselves cuz they're MAD


Secret Ending (Ascension):
 - You pray to god to forgive you, and ascend to heaven

 Requirements:
 - pray to god 100 times - enters cutscene where god grants you mercy
 - option to ascend or not - if yes, nice. if not, continue
 
 


Amie: 
- art
- UI (user interface)
- Story planning
- balancing, what leads to what ending
- Options (3 per scene, like 50-100 words), 30 total

Joza:
- stock images of backgrounds
- Coding buttons, text animations, flow of events (which screen/button leads to what), basically the framework of the code
- pray button

*/
