class Nio_body {
  int c;
  int y_loc;
  float welkEnemyPlaatjeIsZichtbaar;

  Nio_body(int c_param, int y_loc_param) {
    c = c_param;
    y_loc = y_loc_param;
  }

  void display(int x_loc_param, int y_loc_param) {
    imageMode(CENTER);    
    image(enemyPlaatjes[round(welkEnemyPlaatjeIsZichtbaar)], x_loc_param, y_loc_param);
    if (welkEnemyPlaatjeIsZichtbaar < (hoeveelEnemyPlaatjes - 1)) {
      welkEnemyPlaatjeIsZichtbaar += 0.2;
    } else {
      welkEnemyPlaatjeIsZichtbaar = 0;
    }
  }
}

