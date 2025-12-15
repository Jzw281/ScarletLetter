// me when i do scarlet letter 
// me when i don't know how to code.
// me when scarlet letter is stupid
// me when 
String 脑子 = "not found";
int prayAmt = 0;
boolean buttonPressed(int x, int y, int w, int h) {
  return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h && mousePressed;
}

void textDisplay(String Text, int x, int y,int boxWidth, int size){
  fill(0);
  textSize(size);
  int Y = y + 15;
  String text_length = "";
  for(int i = 0; i<Text.length();i++){
    if(i>0){
      if(x+5+textWidth(text_length)<=x+boxWidth){
        text(Text.charAt(i),x+5+textWidth(text_length),Y);
      } else{
        Y+=10;
        text_length = "";
        text(Text.charAt(i),x+5+textWidth(text_length)-boxWidth,Y);
      }
    } else if(i==0){
      text(Text.charAt(i),x+5,y+15);
    }
    text_length+=Text.charAt(i);
  }
}

int button(String ChoiceOne, String ChoiceTwo, String ChoiceThree){
  //draw the button
  fill(255);
  rect(10,440,250,50);
  textDisplay(ChoiceOne,15,445,240,12);
  fill(255);
  rect(270,440,250,50);
  textDisplay(ChoiceTwo,270,445,240,12);
  fill(255);
  rect(530,440,250,50);
  textDisplay(ChoiceThree,535,445,240,12);
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
fill(255);
  rect(10,500,780,290);
  textDisplay(Dialouge,15,505,780,12);
}

void setup(){
  size(800,800);
  background(255);
  
  
}
void drawScene (int choiceOne, int choiceTwo, int choiceThree, boolean scene, boolean nextScene1, boolean nextScene2,boolean nextScene3){}
  if(scene){
  if(button("choiceOne","choiceTwo","choiceThree")==1){
    scene = false;
    newScene1 = true;
  } else if (button("choiceOne","choiceTwo","choiceThree")==2){
    scene = false;
    newScene2 = true;
  } else if (button("choiceOne","choiceTwo","choiceThree")==3){
        scene = false;
        newScene3 = true;
  }
  }
void draw(){
  dialouge("aabsdfasjdfasdnf");
  textSize(24);
  textDisplay("asdfasdfa",500,500,20,12);
  println(button("Oneewhfqfgqekhfqjiewjhfliqwehflqewhflqweehlkfqewh","Two","Three"));
  // transition to next scene
  // create a boolen for each scene, when one of the options is true, then set own bool to false and one of the other ones to true. 
  if ()
  if(button("Oneewhfqfgqekhfqjiewjhfliqwehflqewhflqweehlkfqewh","Two","Three")==1){
    
  } else if (button("Oneewhfqfgqekhfqjiewjhfliqwehflqewhflqweehlkfqewh","Two","Three")){

  } else if (button("Oneewhfqfgqekhfqjiewjhfliqwehflqewhflqweehlkfqewh","Two","Three")){
    
  }
  circle(750,50,25);
  
}
void mouseClicked(){
  if(dist(mouseX,mouseY,750,50)<=25){
      prayAmt++;
    }
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

- mirror scene - cutscene
DOESN'T HAPPEN IF YOU TALKED TO HESTER

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
3. pray to god (+10 prays);

- election sermon
IF: you admitted crime
ESCAPE:
- canon but without death
NO ESCAPE:
- you deliver a holy sermon, everyone loves you, but you get killed by roger
KILL ROGER:
- you deliver a holy sermon, everyone loves you, roger is found dead the next day. 

IF: not admitted crime
ESCAPE: canon
NO ESCAPE: canon but you don't admit your crimes; roger kills you
HESTER MAD: you deliver a holy sermon, (canon), but you don't see hester. Later, you find out she left with pearl. 

Variables:
Friendship:
- Pearl
- Hester
- Roger
- Public

Guilt:
- hidden var that affects some endings

Bool for runaway or not:

Scarlet Letter:

Endings:
Good Ending:
- Stay in New England with Pearl and Hester 
- because of high public opinion and the symbol of the A changing,
  you live a long and happy life with Hester and die a little bit later than canon
Requirements
- High everything, good public opinion, NO ROGERR


Bad Ending:
- Roger Kills you, Pearl and Hester Leave without you
Requirements:
Low Pearl and Hester vars, anatgonize Roger, 
Canon Ending:
- You die on the scaffold
Requirements:
- plan to leave to england but high guilt var kills you


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
- Draw Roger
- Draw Hester
- Draw Pearl
- draw cutscenes
- code transitions/screens
- UI
- Story(10 big blocks 150-200 words)

Joza:
Art:
- stock images of backgrounds
Code:
- Coding selection system, like how to choose the different buttons, 
- pray button

Both:
- balancing, what leads to what ending
- Options (3 per scene, like 50-100 words), 30 total

*/
