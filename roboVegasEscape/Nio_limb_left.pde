class Nio_limb_left {
  color c;
  int x_loc;
  int y_loc;
  float hoek;
  float rotatie;

  Nio_limb_left(int c_temp, int y_loc_param) {
    int c = c_temp;
    hoek = 0;
    rotatie = 0.01;
    y_loc = y_loc_param;
  }

  void display(float x_loc_param, float y_loc_param) {
    draai();
    imageMode(CORNER);
    pushMatrix();
    translate(x_loc_param, y_loc_param);
    rotate(hoek);
    scale(-1, 1);
    image(bikerLimb, 15, -10);
    popMatrix();
  }

  void draai() {
    rotatie = rotatie - 0.1;
    hoek = sin(rotatie);
  }
}

