import ddf.minim.*;

// Init
Minim minim;                                                      // Audio library inladen
AudioSample HitSound;                                             // Voorbereiden audio samples
AudioPlayer Song;
PImage achtergrond, bikerLimb ;                                   // Voorbereiden afbeeldingen
PImage[] explosiePlaatjes, enemyPlaatjes, playerPlaatjes;         // Voorbereiden arrays voor afbeelding sequenties
int hoeveelExplosiePlaatjes, hoeveelEnemyPlaatjes, hoeveelPlayerPlaatjes;    // Voorbereiden hoeveelheden afbeeldingen in sequenties
ArrayList Nios_in_beeld, RaakOfMis, explosies_in_beeld;           // Voorbereiden diverse arrays voor rekenwerk
boolean showScore;                                                // Voorbereiden variabele voor scoremenu
String scoreVerloop = "";                                         // Score verloop leegmaken
int teller, nieuwe_Nio_timer;                                     // Voorbereiden timers
PFont scoreFont;                                                  // Voorbereiden score font
Io Player;

// Setup
void setup() {                                                    // dit wordt als allereerste één keer uitgevoerd
  size(765, 700);                                                 // Venster maat (x,y)

  Nios_in_beeld = new ArrayList();                                // Aanmaken diverse Arrays voor rekenwerk
  RaakOfMis = new ArrayList();
  explosies_in_beeld = new ArrayList();

  for (int i=0; i< (int (random (1, 3))); i++) {
    Nios_in_beeld.add(new Nio(i*15));

    minim = new Minim(this);                                      // Geluiden en muziek laden
    HitSound = minim.loadSample("Hit_Hurt.wav");
    scoreFont = loadFont("VirtualDJ-48.vlw");
  }

  Song = minim.loadFile("song.mp3", 2048);
  Song.play();

  Player  = new Io(0);
  teller = 0;
  nieuwe_Nio_timer=60;
  achtergrond = loadImage("level.png");
  bikerLimb = loadImage ("bikerlimb.png");

  hoeveelExplosiePlaatjes = 5;                                     // Plaatjes laden voor Explosie
  explosiePlaatjes = new PImage[hoeveelExplosiePlaatjes];  
  for (int i=0; i < hoeveelExplosiePlaatjes; i++) {                      
    PImage _img = loadImage("gore/gore" + (i + 1) + ".png");
    explosiePlaatjes[i] = _img;
  };

  hoeveelEnemyPlaatjes = 7;                                        // Plaatjes laden voor Enemy
  enemyPlaatjes = new PImage[hoeveelEnemyPlaatjes];             
  for (int i=0; i < hoeveelEnemyPlaatjes; i++) {              
    PImage _img = loadImage("enemy/enemy" + (i + 1) + ".png");
    enemyPlaatjes[i] = _img;
  };

  hoeveelPlayerPlaatjes = 9;    
  playerPlaatjes = new PImage[hoeveelPlayerPlaatjes];  // Plaatjes laden voor Enemy           
  for (int p=0; p < hoeveelPlayerPlaatjes; p++) {            
    playerPlaatjes[p] = loadImage("player/player" + (p+1) + ".png");
  };
}

void draw() { 

  if (RaakOfMis.size() < 10) {                                     // Dingen die tijdens de game gebeuren

    // dit wordt continu uitgevoerd
    background(achtergrond); // stel achtergrondkleur in
    teller++;
    if (teller == nieuwe_Nio_timer) {
      Nios_in_beeld.add(new Nio(255));

      teller=0;
      nieuwe_Nio_timer=int(random(60, 250));
    }

    for (int i=0; i<Nios_in_beeld.size (); i++) {                  // Nio
      // hun ding laten doen
      Nio BikerDude_temp = (Nio) Nios_in_beeld.get(i);
      BikerDude_temp.beweeg(i);
      BikerDude_temp.display();
    }

    for (int i=0; i<explosies_in_beeld.size (); i++) {             // Explosies
      // hun ding laten doen
      explosie explosie_temp = (explosie)explosies_in_beeld.get(i);
      explosie_temp.display();
    }

    Player.beweeg();
    Player.display();
  } else {                                                         // Score scherm

    if (showScore) {//continu
      background(10);
      text(scoreVerloop, 10, 30);
    } else {
      //1 keer
      showScore = true;                                            // Scorescherm laten zien
      for (int i=0; i < RaakOfMis.size (); i++) {
        String RM_temp = (String) RaakOfMis.get(i);
        scoreVerloop += RM_temp + "\n";
      }
      Song.pause();
      textFont(scoreFont, 32);
    }
  }
}

void RaakofMis(int x_pos_Nio, int WelkeInDeLijst) {                // Hitcalculatie
  int x_pos_Player = Player.WaarBenIk();
  int afstand = x_pos_Player - x_pos_Nio;

  if (abs(afstand) < 80) {
    RaakOfMis.add("Raak!");
    explosies_in_beeld.add(new explosie(x_pos_Nio, explosiePlaatjes));
    HitSound.trigger();
  } else {
    RaakOfMis.add("Mis!");
  }
  Nios_in_beeld.remove(WelkeInDeLijst);
}

void verwijderExplosie() {                                          // Explosie verwijderen
  explosies_in_beeld.remove(0);
}

