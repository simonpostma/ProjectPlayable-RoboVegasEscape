class explosie {
  int x_loc;
  float welkPlaatjeIsZichtbaar;

  explosie(int x_loc_param, PImage[] plaatjes_param) {
    x_loc = x_loc_param;
    explosiePlaatjes = plaatjes_param;
    welkPlaatjeIsZichtbaar = 0;
  }

  void display() {
    imageMode(CENTER);
    // het juiste plaatje in de lijst laten zien
    image(explosiePlaatjes[int(welkPlaatjeIsZichtbaar)], x_loc, height-150);
    if (welkPlaatjeIsZichtbaar < (hoeveelExplosiePlaatjes - 1)) {
      welkPlaatjeIsZichtbaar += 0.5;
    } else {
      verwijderExplosie();
    }
  }

  void verwijderExplosie() {
    explosies_in_beeld.remove(0);
  }
}

