// VARIABLES //
String 脑子 = "not found";

int prayAmt = 0;
int mad = 0;

PImage light_forest;
PImage scaffolding;
PImage governor_house;
PImage dark_forest;

boolean prolouge = true;
boolean hester_on_scaffolding = false;
boolean roger_cutscene = false;
boolean governor = false;
boolean governor_admit = false;
boolean guilt = false;
boolean guilt_admit = false;
boolean woods = false;
boolean woods_admit = false;
boolean woods_mad = false;
boolean election = false;
boolean election_escape = false;
boolean election_noAdmit = false;
boolean election_kill = false;
boolean escape = false;
boolean noEscape = false;
boolean killRoger = false;
boolean madHester = false;
boolean ascension = false;

boolean hester_option1 = false;
boolean hester_option2 = false;
boolean governor_option1 = false;
boolean governor_option2 = false;
boolean governor_option3 = false;
boolean governor_admit_option1 = false;
boolean governor_admit_option2 = false;
boolean governor_admit_option3 = false;
boolean guilt_option1 = false;
boolean guilt_option2 = false;
boolean guilt_option3 = false;
boolean guilt_admit_option1 = false;
boolean guilt_admit_option2 = false;
boolean guilt_admit_option3 = false;


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
    if(x+5+textWidth(text_length) <= x+boxWidth-15){
      text(Text.charAt(i),x+5+textWidth(text_length),y);
    } 
    else{
      y+=20;
      text_length = "";
      text(Text.charAt(i),x+5+textWidth(text_length),y);
    }
    text_length+=Text.charAt(i);
  }
}

int button(String ChoiceOne, String ChoiceTwo, String ChoiceThree){
  //draw the button
  fill(255, 70);
  rect(10,490,250,50);
  textDisplay(ChoiceOne,15,495,240,18);
  
  fill(255, 70);
  rect(270,490,250,50);
  textDisplay(ChoiceTwo,270,495,240,18);

  fill(255, 70);
  rect(530,490,250,50);
  textDisplay(ChoiceThree,535,495,240,18);

  //text s
  if(buttonPressed(10,490,250,50)){
    return 1;
  }
  if(buttonPressed(265,490,250,50)){
    return 2;
  }
  if(buttonPressed(530,490,250,50)){
    return 3;
  }
  else{
    return 0;
  }
}

void dialouge(String Dialouge){
  fill(255,200);
  rect(10,550,780,240);

  textDisplay(Dialouge,15,555,780,20);

  fill(255);
  triangle(765,760,775,770,765,780);

  // fill(70);
  // text("(press enter to continue)", 550,775);
}

boolean next(){
  if(keyPressed){
    if(keyCode == ENTER || key == '\n' || key == '\r'){
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

void draw(){
  if(prolouge){
    background(light_forest);
    if(next() == true){
      prolouge = false;
      hester_on_scaffolding = true;
    }
    else{
      dialouge("You meet a nice young woman. Her name is Hester. There's something special between you two... But no, you must not! You are an esteemed priest, while she is a married seamstress...");
      fill(70);
  text("(press enter to continue)", 550,775);
    }
  }

  if(hester_on_scaffolding){
    background(scaffolding);

    if(button("Condemn Hester for her crimes","Admit that it is YOU who is the husband","Preach to the crowds")==1){
      hester_option1 = true;
    } 
    else if(button("Condemn Hester for her crimes","Admit that it is YOU who is the husband","Preach to the crowds")==2){
      hester_option2 = true;  
    } 
    else if(button("Condemn Hester for her crimes","Admit that it is YOU who is the husband","Preach to the crowds")==3){
      hester_on_scaffolding = false;
      roger_cutscene = true;
    }
    else{
      if(hester_option1){
        dialouge("The crowd praises you and shower you with love. Hester stares at you in shock and betrayal.");
        fill(70);
  text("(press enter to continue)", 550,775);
        if(next()){
          hester_on_scaffolding = false;
          roger_cutscene = true;
        }
      }
      else if(hester_option2){
        dialouge("The crowd is taken aback by your words. After a few minutes, public outcry against you pushes the governor to take you off the scaffolding. Shortly after, you are temporarily stripped of your priestly status.");
        fill(70);
  text("(press enter to continue)", 550,775);
        if(next()){
          hester_on_scaffolding = false;
          governor_admit = true;
        }
      }
      else{
        dialouge("Hester stands on the scaffolding. The crowd insults her for committing a horrible sin. Guilt naws at your heart. Little do the townspeople know, YOU are the one who sinned with her...");
      }
    }

    if(buttonPressed(10,440,250,50)){
      mad++;
    }
  }

  if(roger_cutscene){
    background(0);
    dialouge("An ominous presence approaches you. 'Hello, I'm Roger Chillingworth, and I'm a physician. Nice to meet your aquaintance.' The man says. Per the town's wishes, you and Roger start living together to preserve your failing health.");
    fill(70);
  text("(press enter to continue)", 550,775);
    if(next()){
      roger_cutscene = false;
      governor = true;
    }
    //pray button
    fill(255);
    circle(750,50,40);

    fill(0);
    textSize(17);
    text("pray", 735,54);
  }

  if(governor){
    background(governor_house);

    if(button("Argue for Hester to keep Pearl",
      "Apologize to Hester",
      "Try to take Pearl away from Hester")==1){
      governor_option1 = true;
    } 
    else if(button("Argue for Hester to keep Pearl",
      "Apologize to Hester",
      "Try to take Pearl away from Hester")==2){
      governor_option2 = true;  
    } 
    else if(button("Argue for Hester to keep Pearl",
      "Apologize to Hester",
      "Try to take Pearl away from Hester")==3){
      governor_option3 = true;
    }
    else{
      if(governor_option1){
        dialouge("Roger's eyes seem to pierce through your soul. You shiver and turn away from him. The governor considers your words, and accepts them.");
        fill(70);
  text("(press enter to continue)", 550,775);
        if(next()){
          governor = false;
          guilt = true;
        }
      }
      else if(governor_option2){
        dialouge("You tell Hester you can't help her, and apologize gracefully. A pair of eyes feel like they're burning through your skull, but you ignore it in favor of listening to the governor debate with Hester about Pearl. In the end, he agrees to let Hester keep custody of Pearl,  but it is a close call.");
        fill(70);
  text("(press enter to continue)", 550,775);
        if(next()){
          governor = false;
          guilt = true;
        }
      }
      else if(governor_option3){
        dialouge("Hester narrows her eyes at you in anger, and passionately states her case for why she should keep Pearl. The governor considers your words and Hester's words carefully, and ultimately decides to let Hester keep Pearl.");
        fill(70);
  text("(press enter to continue)", 550,775);
        if(next()){
          governor = false;
          guilt = true;
        }
      }
      else{
        dialouge("(You enter the Governor's hall along with Governor Bellingham and Reverend Wilson. Pearl and Hester are there, and Hester is trying to argue against having Pearl be taken away from her.)");
      }


      if (buttonPressed(530,440,250,50)){
        mad++;
      }
    }
    
    //pray button
    fill(255);
    circle(750,50,40);

    fill(0);
    textSize(17);
    text("pray", 735,54);
  }
  
  if(governor_admit){
    background(governor_house);
    
    if(button("Ask for forgiveness",
      "Preach how you punished yourself for your sins",
      "Ask for custody of Pearl with Hester")==1){
      governor_admit_option1 = true;
    } 
    else if(button("Ask for forgiveness",
      "Preach how you punished yourself for your sins",
      "Ask for custody of Pearl with Hester")==2){
      governor_admit_option2 = true;  
    } 
    else if(button("Ask for forgiveness",
      "Preach how you punished yourself for your sins",
      "Ask for custody of Pearl with Hester")==3){
      governor_admit_option3 = true;
    }
    else{
      if(governor_admit_option1){
        dialouge("The physicial behind the governor's eyes seem to pierce through your soul. You shiver and turn away from him. The governor considers your words. Afterwards, Hester makes her case for custody of Pearl. The governor promises to decide the next day.");
        fill(70);
  text("(press enter to continue)", 550,775);
        if(next()){
          governor_admit = false;
          guilt_admit = true;
        }
      }
      else if(governor_admit_option2){
        dialouge("The governor's eyes soften at your passionate voice. He deliberates for a few minutes, then agrees to make an opportunity for you to redeem yourself.");
        fill(70);
  text("(press enter to continue)", 550,775);
        if(next()){
          governor_admit = false;
          guilt_admit = true;
        }
      }
      else if(governor_admit_option3){
        dialouge("The governor considers your and Hesters' words, then looks at Pearl, who is happily twirling around the two of you. He decides to allow Pearl to stay with you and Hester. The physicial trailing in the back stares at you coldly as you celebrate with Hester.");
        fill(70);
  text("(press enter to continue)", 550,775);
        if(next()){
          governor_admit = false;
          guilt_admit = true;
        }
      }
      else{
        dialouge("The governor sees you and Hester in his hall. 'The fallen angel, the bearer of the scarlet letter, and the crimson blush of their child! To WHAT do I owe your presence in my esteemed hall?");
      }
    }

    //pray button
    fill(255);
    circle(750,50,40);

    fill(0);
    textSize(17);
    text("pray", 735,54);
  }

  if(guilt_admit){
    background(0);

    if(button("Talk with Hester",
      "Punish yourself",
      "Pray to God (50 prayers)")==1){
      guilt_admit_option1 = true;
    } 
    else if(button("Talk with Hester",
      "Punish yourself",
      "Pray to God (50 prayers)")==2){
      guilt_admit_option2 = true;
    } 
    else if(button("Talk with Hester",
      "Punish yourself",
      "Pray to God (50 prayers)")==3){
      guilt_admit_option3 = true;
    }
    else{
      if(guilt_admit_option1){
        dialouge("You talk with Hester");
        fill(70);
  text("(press enter to continue)", 550,775);
        if(next()){
          guilt_admit = false;
          woods_admit = true;
        }
      }
      else if(guilt_admit_option2){
        dialouge("You punish yourself");
        fill(70);
  text("(press enter to continue)", 550,775);
        if(next()){
          guilt_admit = false;
          woods_admit = true;
        }
      }
      else if(guilt_admit_option3){
        fill(70);
  text("(press enter to continue)", 550,775);
        dialouge("You pray to God 50 times");
        if(next()){
          guilt_admit = false;
          woods_admit = true;
        }
      }
      else{
        dialouge("Some nights, guilt continues to knaw at your heart. It's slowly becoming unbearable.");
      }
    }

    if(buttonPressed(530,440,250,50)){
      prayAmt+=10;
    }

    //pray button
    fill(255);
    circle(750,50,40);

    fill(0);
    textSize(17);
    text("pray", 735,54);
  }

  if(guilt){
    background(0);

    if(button("Talk with Roger",
      "Punish yourself",
      "Pray to God (50 prayers)")==1){
      guilt_option1 = true;
    } 
    else if(button("Talk with Roger",
      "Punish yourself",
      "Pray to God (50 prayers)")==2){
      guilt_option2 = true;
    } 
    else if(button("Talk with Roger",
      "Punish yourself",
      "Pray to God (50 prayers)")==3){
      guilt_option3 = true;
    }
    else{
      if(guilt_option1){
        dialouge("You talk with Roger");
        fill(70);
  text("(press enter to continue)", 550,775);
        if(next()){
          guilt = false;
          woods = true;
        }
      }
      else if(guilt_option2){
        dialouge("You punish yourself");
        fill(70);
  text("(press enter to continue)", 550,775);
        if(next()){
          guilt = false;
          woods = true;
        }
      }
      else if(guilt_option3){
        dialouge("You pray to God 50 times");
        fill(70);
  text("(press enter to continue)", 550,775);
        if(next()){
          guilt = false;
          woods = true;
        }
      }
      else{
        dialouge("Guilt continues to knaw at your raw heart. It's quickly becoming unbearable.");
      }
    }

    if(buttonPressed(530,440,250,50)){
      prayAmt+=10;
    }
    
    //pray button
    fill(255);
    circle(750,50,40);

    fill(0);
    textSize(17);
    text("pray", 735,54);
  }

  if(woods){
    background(dark_forest);

    if(button("Disagree, and stay",
      "Agree, and escape",
      "Kill Roger first, for revenge")==1){
      woods = false;
      noEscape = true;
    } 
    else if(button("Disagree, and stay",
      "Agree, and escape",
      "Kill Roger first, for revenge")==2){
      woods = false;
      escape = true;
    } 
    else if(button("Disagree, and stay",
      "Agree, and escape",
      "Kill Roger first, for revenge")==3){
      woods = false;
      killRoger = true;
    }
    else{
      dialouge("You meet with Hester in the woods. She reveals the true identity of Roger Chillingworth: her previous husband, now vengeful devil who torments you everyday. She wants to escape this town. However, you first need to give the election sermon, the pinnacle of your career. By leaving, you could finally be free of Roger, but if you stayed, you'd forever suffer until your death.");
    }
 
    if(prayAmt>=100){
      ascension = true;
      killRoger = false;
      escape = false;
      noEscape = false;
    }
    if(mad>=2){
      woods_mad=true;
      killRoger = false;
      escape = false;
      noEscape = false;
    }

    //pray button
    fill(255);
    circle(750,50,40);

    fill(0);
    textSize(17);
    text("pray", 735,54);
  }

  if(woods_admit){
    background(dark_forest);

    if(button("Disagree, and stay - but kill Roger",
      "Agree, and escape",
      "Disagree, and stay - and do nothing")==1){
      woods_admit = false;
      election_kill = true;
    } 
    else if(button("Disagree, and stay - but kill Roger",
      "Agree, and escape",
      "Disagree, and stay - and do nothing")==2){
      woods_admit = false;
      election_escape = true;
    } 
    else if(button("Disagree, and stay - but kill Roger",
      "Agree, and escape",
      "Disagree, and stay - and do nothing")==3){
      woods_admit = false;
      election_noAdmit = true;
    }
    else{
      dialouge("You meet with Hester in the woods. You tell her you have been given a chance to redeem yourself by giving a small speech at the coming election. Hester warns you of the danger of Roger Chillingworth, her ex-husband turned stalker of your family. She proposes to escape this town, back to New England.");
    }

    if(prayAmt>=100){
      ascension = true;
      election_noAdmit = false;
      election_escape = false;
      election_kill = false;
    }

    //pray button
    fill(255);
    circle(750,50,40);

    fill(0);
    textSize(17);
    text("pray", 735,54);
  }

  if(woods_mad){
    background(dark_forest);
    fill(70);
  text("(press enter to continue)", 550,775);
    if(next() == true){
      woods_mad = false;
      madHester = true;
    }
    else{
      dialouge("You see Hester, and turn to talk to her. However, she looks away angrily and continues walking without so much a glance at your face. You feel like something is off...");
    }

    //pray button
    fill(255);
    circle(750,50,40);

    fill(0);
    textSize(17);
    text("pray", 735,54);
  }

  // ENDINGS //
  if(election_kill){
    background(0);
    fill(255);
    textSize(50);
    text("THE END", 400-textWidth("THE END")/2,200);

    dialouge("You give the election sermon. You perform beautifully, and it's almost if one of the Muses has spoken through your lips. Roger is found dead the next day, dead to unknown causes. In the town, you are beloved and you lives for an average lifespan, occasionally meeting with Heste throughout the years.");
  }
  if(election_escape){
    background(0);
    fill(255);
    textSize(50);
    text("THE END", 400-textWidth("THE END")/2,200);
    
    dialouge("After you give you sermon, you escape on the boat with Hester. However the boats sinks under a mssive tusnami. Some rumors say that someone tampered with the weather and navigation equipement on the boat. Some people would call it karma.");
  }
  if(election_noAdmit){
    background(0);
    fill(255);
    textSize(50);
    text("THE END", 400-textWidth("THE END")/2,200);
    
    dialouge("You give the election sermon. You perform beautifully, and it's almost if one of the Muses has spoken through your lips. Sadly, you pass away a few days after giving your sermon due to unknown causes, heavily suspected to do with your health.");
  }

  if(escape){
    background(0);
    fill(255);
    textSize(50);
    text("THE END", 400-textWidth("THE END")/2,200);
    
    dialouge("You, Hester, and Pearl leave on the next ship early next morning. Unfortuantly, you found out that Roger has also taggd along. Upon your arrival in England, you don't live much for long before passing away.");
  }
  if(noEscape){
    background(0);
    fill(255);
    textSize(50);
    text("THE END", 400-textWidth("THE END")/2,200);
    
    dialouge("Hester reveals Roger's identity in front of the entire town. People are unsure of what to think. Roger is eventually declared a sinner for hiding his identity, and a D is branded across his chest for 'Deciever'.");
  }
  if(madHester){
    background(0);
    fill(255);
    textSize(50);
    text("THE END", 400-textWidth("THE END")/2,200);
    
    dialouge("You deliver a holy sermon at the election, but you don't see Hester. Later, you find out she left with Pearl. Before you can do anything, you pass away to mysterious means. It is likely due to something going wrong in your physical health.");
  }
  if(killRoger){
    background(0);
    fill(255);
    textSize(50);
    text("THE END", 400-textWidth("THE END")/2,200);
    
    dialouge("Late that night you decide to end Roger's life. Before anyone notices, you, Hester, and Pearl get on the next ship to England. The three of you live a long and happy life in England.");
  }
  if(ascension){
    background(0);
    fill(255);
    textSize(50);
    text("THE END", 400-textWidth("THE END")/2,200);
    
    dialouge("'Secret Ending' Due to your constant praying, and the repentance of your sins, God awards you an immediete spot in heaven. But what of Hester and Pearl?");
  }
}

void mouseClicked(){
  if(dist(mouseX,mouseY,750,50)<50){
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
- UI (user interface)
- Coding buttons 
- Story planning
- balancing, what leads to what ending
- Options for each scene

Joza:
- Coding buttons
- Coding text animations
- Coding flow of events (which screen/button leads to what)
- (basically the framework of the code - the logistical stuff)

Both:
- find images for backgrounds
- pray button

*/
