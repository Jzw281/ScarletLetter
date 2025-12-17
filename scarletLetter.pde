// VARIABLES //
String 脑子 = "not found";

int prayAmt = 0;
int mad = 0;

PImage light_forest;
PImage scaffolding;
PImage governor_house;
PImage dark_forest;

boolean prolouge = true; //background: light forest
boolean hester_on_scaffolding = false; //background: scaffolding
boolean roger_cutscene = false; //this needs a background
boolean governor = false;
boolean governor_admit = false;
boolean guilt = false; //this needs a background
boolean guilt_admit = false;
boolean night_walk = false; //this needs a background - the old pic was too low-quality
boolean angel_cutscene = false; //this is the a in the sky. needs a background - can be the scaffolding but just dark
boolean woods = false; //background: dark_forest
boolean woods_admit = false;
boolean election = false; //background: scaffolding
boolean election_escape = false;
boolean election_noAdmit = false;
boolean election_kill = false;
boolean escape = false;
boolean noEscape = false;
boolean killRoger = false;
boolean madHester = false;
boolean ascension = false;

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
boolean next(){
  if(keyPressed){
    if(keyCode == ENTER || keyCode == RETURN || key == 'p'){
      return true;
    } 
    else{
      return false;
    }
  } else{
    return false;
  }
}

void drawScene (String choiceOne, String choiceTwo, String choiceThree, boolean scene, boolean nextScene1, boolean nextScene2,boolean nextScene3){
    if(button(choiceOne,choiceTwo,choiceThree)==1){
      scene = false;
      nextScene1 = true;
    } else if(button(choiceOne,choiceTwo,choiceThree)==2){
      scene = false;
      nextScene2 = true;
    } else if(button(choiceOne,choiceTwo,choiceThree)==3){
      scene = false;
      nextScene3 = true;
    }
}

    boolean hester_option1 = false;
    boolean hester_option2 = false;
void draw(){
  if(prolouge){
    background(light_forest);
    if(next() == true){
      prolouge = false;
      hester_on_scaffolding = true;
    }
    else{
      dialouge("You meet a nice young woman. Her name is Hester. There's something special between you. But no, you must not! You are an esteemed priest, while she is a married seamstress.");
    }
  }
  if(hester_on_scaffolding){
    background(scaffolding);

    if(button("Condemn Hester for her crimes.","Admit that it is YOU who is the husband.","Preach to the crowds and beg Hester to admit who the husband is.")==1){
      hester_option1 = true;
    } 
    else if(button("Condemn Hester for her crimes.","Admit that it is YOU who is the husband.","Preach to the crowds and beg Hester to admit who the husband is.")==2){
      hester_option2 = true;  
    } 
    else if(button("Condemn Hester for her crimes.","Admit that it is YOU who is the husband.","Preach to the crowds and beg Hester to admit who the husband is.")==3){
      hester_on_scaffolding = false;
      roger_cutscene = true;
    }
    else{
      if(hester_option1){
        dialouge("(The crowd praises you and shower you with love. Hester stares at you in shock and betrayal.)");
        if(next()){
          hester_on_scaffolding = false;
          roger_cutscene = true;
        }
      }
      else if(hester_option2){
        dialouge("(The crowd is taken aback by your words. After a few minutes, public outcry against you pushes the governor to take you off the scaffolding. Shortly after, you are temporarily stripped of your priestly status.)");
        if(next()){
          hester_on_scaffolding = false;
          governor_admit = true;
        }
      }
      else{
        dialouge("Hester stands on the scaffolding. The crowd insults her. Guilt naws at your heart. Little do the townspeople know, YOU are the one who sinned...");
      }
    }

    if(buttonPressed(10,440,250,50)){
      mad++;
    }
  }
  if(roger_cutscene){
    background(0);
    if(next() == false){
      roger_cutscene = false;
      governor = true;
    }else{
      dialouge("(An ominous presence approaches you.) Hello, I'm Roger Chillingworth, and I'm a physician. Nice to meet your aquaintance. (Per the town's wishes, you and Roger start living together to preserve your failing health.)");
    }
    //pray button
    fill(255);
    circle(750,50,40);

    fill(0);
    textSize(17);
    text("pray", 735,54);
  }
  if(governor){
    dialouge("(You enter the Governor's hall along with Governor Bellingham and Reverend Wilson, Pearl and Hester are there, Hester is trying to argue against pearl being taken away)");
    drawScene(
      "Argue for Hester to keep Pearl",
      "Apologize to Hester",
      "Try to take Pearl away (doesn't work but Hester is MAD)",
      governor,guilt,guilt,guilt
    );
    if (buttonPressed(530,440,250,50)){
      mad++;
    }
    
    //pray button
    fill(255);
    circle(750,50,40);

    fill(0);
    textSize(17);
    text("pray", 735,54);
  }
  if(governor_admit){
    dialouge("Governor: *sees you and hester* The fallen angel and the bearer of the scarlet letter, what are you doing in my abode?");
    drawScene(
      "Ask for forgiveness (Roger smirks in the background)",
      "Preach how you punished yourself for your sins - Governor is happier, and will allow you to keep Pearl happily (Roger stares at you)",
      "Ask for Pearl to be with Hester and yourself",
      governor_admit,guilt_admit,guilt_admit,guilt_admit
    );

    //pray button
    fill(255);
    circle(750,50,40);

    fill(0);
    textSize(17);
    text("pray", 735,54);
  }
  if(guilt_admit){
    dialouge("Guilt continues to knaw at your heart. It's slowly becoming unbearable.");
    drawScene(
    "Talk with Hester. She comforts you",
    "Punish yourself(flogging)",
    "Pray to god", 
      guilt_admit,woods_admit,woods_admit,woods_admit
    );

    //pray button
    fill(255);
    circle(750,50,40);

    fill(0);
    textSize(17);
    text("pray", 735,54);
  }

  if(guilt){
    dialouge("Guilt continues to knaw at your heart. It's slowly becoming unbearable.");
    drawScene(
      "Talk to Roger. He makes you feel more guilty",
      "Punish yourself(flogging)",
      "Pray to god",
      guilt,night_walk,night_walk,night_walk
    );
    if (buttonPressed(530,440,250,50)){
      prayAmt+=10;
    }
    
        //pray button
    fill(255);
    circle(750,50,40);

    fill(0);
    textSize(17);
    text("pray", 735,54);
  }

  if(night_walk){
    dialouge("You can't sleep becuse of th guilt. You go into the town for a walk to clear your head.");
    drawScene(
      "Walk onto the scaffolding",
      "Return Home(More Self-Punishment)",
      "Pray to god",
      night_walk,angel_cutscene,woods,woods
    );
    if (buttonPressed(530,440,250,50)){
      prayAmt+=10;
    }
    
  }
  if(angel_cutscene){
    if(next() == false){
      angel_cutscene = false;
      woods = true;
    }else{
      dialouge("You walk onto the scaffolding, and a giant A flashes across the sky. The townspeople said it meant 'Angel'." );
    }
  }

  if(woods){
    dialouge("You meet with Hester in the woods. She wants to escape the next morning, however you would miss giving the election sermon that you have been anticipating.");
    drawScene(
      "Disagree.",
      "Agree.",
      "Kill Roger.",
      woods,noEscape,escape,killRoger
    );
    if(prayAmt>=100){
      ascension = true;
      killRoger = false;
      escape = false;
      noEscape = false;
    }
    if (mad>=2){
      madHester=true;
      killRoger = false;
      escape = false;
      noEscape = false;
    }
  }
  if(woods_admit){
    dialouge("talk to hester; you reveal you have been given a chance to redeem yourself by giving a small speech at the election. Hester proposes we escape.");
    drawScene(
      "Decide you do not need to escape, because you can kill roger",
      "Decide to ESCAPE.",
      "Decide to NOT escape and NOT do anything about roger." ,
       woods_admit,election_kill,election_escape,election_noAdmit
    );
    if (mad>=2){
      madHester=true;
      election_noAdmit = false;
      election_escape = false;
      election_kill = false;
    }
    if(prayAmt>=100){
      ascension = true;
      election_noAdmit = false;
      election_escape = false;
      election_kill = false;
    }
    
  }
  if(election_kill){
    background(0);
    dialouge("Good ending. You deliver a holy sermon, everyone loves you more, Roger is found dead the next day. You lives a slightly better life, occasionally meeting with Hester" );
    }
  if(election_escape){
    background(0);
    dialouge("After you give you sermon, you escape on the boat with Hester, however the boats sinks under a mssive tusnami. Some would call it karma.");
  }
  if(election_noAdmit){
    background(0);
    dialouge("You give the election sermon. You perform beautifully, it's almost if one of the Muses has give you their blessing. Sadly, you pass right after giving your sermon.");
  }

  if(escape){
    background(0);
    dialouge("You, Hester, and Pearl leave on the next ship early next morning. Unfortuantly, you found out that Roger has also taggd along. Upon your arrival in England, you don't live much long before passing.");
  }
 if(noEscape){
    background(0);
    dialouge("Hester reveals Roger's identity infront of the entire town, people are unsure of what to think. Roger is declared a sinner for hiding his identity, and a D is branded across his chest for 'Deciver'.");
  }
  if(madHester){
    background(0);
    dialouge("You deliver a holy sermon, but you don't see Hester. Later, you find out she left with pearl. You get killed by Roger");
  }
  if(killRoger){
    background(0);
    dialouge("Late that night you decide to end Roger's life. Before anyone notices, you, Hester, and Pearl get on the next ship to England. The three of you live a long and happy life after.");
  }
  if(ascension){
    background(0);
    dialouge("'Secret Ending' Due to your constant praying, and you repentance of your sins, God awards you an immediete spot in heaven. But what of Hester and Pearl?");

  }
}
void mouseClicked(){
  if(dist(mouseX,mouseY,750,50)<50){
    prayAmt++;
  }
}
int prolouge(){
  background(light_forest); //the background is the image. the image MUST be 800x800 aka the same dimensions of the canvas or else it won't work
  
  dialouge("aabsdfasjdfasdnf");
  return button("One","Two","Three");

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

If you didn't admit your crimes
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