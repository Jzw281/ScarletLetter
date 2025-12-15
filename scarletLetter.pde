// me when i do scarlet letter 
// me when i don't know how to code.
// me when scarlet letter is stupid
// me when 
String 脑子 = "not found";


boolean buttonPressed(int x, int y, int w, int h) {
  return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h && mousePressed;
}

void textDisplay(String Text, int x, int y,int boxWidth){
  int Y = y;
  for(int i = 0; i<Text.length();i++){
    if(i>0){
      if(x+5+textWidth(Text.charAt(i-1))>=x+boxWidth){
      text(Text.charAt(i),x+5+textWidth(Text.charAt(i-1)),Y);
      } else{
        Y+=5;
        text(Text.charAt(i),x+5+textWidth(Text.charAt(i-1))-boxWidth,Y);
      }
    } else if(i==0){
      text(Text.charAt(i),x+5,y);
    }
  }
}

int button(String ChoiceOne, String ChoiceTwo, String ChoiceThree){
  //draw the button
  rect(10,440,250,50);
  textDisplay(ChoiceOne,15,445,240);
  rect(265,440,250,50);
  textDisplay(ChoiceTwo,270,445,240);
  rect(530,440,250,50);
  textDisplay(ChoiceThree,535,445,240);
  //text s
  if(buttonPressed(10,440,260,490)){
    return 1;
  }
  if(buttonPressed(265,440,515,490)){
    return 2;
  }
  if(buttonPressed(530,440,780,490)){
    return 3;
  }
  else{
    return 0;
  }
}
void dialouge(String Dialouge){
  rect(10,500,780,290);
  textDisplay(Dialouge,15,505,780);
}

void setup(){
  size(800,800);
  background(255);
}
void draw(){
  
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
3. Ask about Pearl with Hester (canon hester) - BUT if you did option one and didn't do option 2, he'll be mad

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

- Arthur in the woods
- Arthur in the town being naughty and dismissing Roger
- election sermon

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
