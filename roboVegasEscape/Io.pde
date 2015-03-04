class Io {
  // variabelen
  int x_loc; // geheugenruimte inruimen voor float-vorm (getal met cijfers achter de komma)
  int x_speed;
  float welkPlayerPlaatjeIsZichtbaar;

  Io(int c_parameter) {
    x_loc = width/2;
    welkPlayerPlaatjeIsZichtbaar = 0;
  }

  void display() {  
    imageMode(CENTER);    

    image(playerPlaatjes[int(welkPlayerPlaatjeIsZichtbaar)], x_loc, 620);
    if (welkPlayerPlaatjeIsZichtbaar < 9) {
      welkPlayerPlaatjeIsZichtbaar += 0.4;

      //welkPlayerPlaatjeIsZichtbaar += 0.2;
    } 
    if (welkPlayerPlaatjeIsZichtbaar>8)
    {
      welkPlayerPlaatjeIsZichtbaar = 0;
    }
  }

  void beweeg() {
    // x_loc = mouseX; 
    int afstand = mouseX - x_loc;
    x_speed = afstand / 80;
    x_loc += x_speed;
  }

  int WaarBenIk() {
    return x_loc;
  }
}

