class Nio {
  // variabelen
  int x_loc; // geheugenruimte inruimen voor float-vorm (getal met cijfers achter de komma)
  int y_loc;
  int x_speed;
  int y_speed;
  int BikerDude_width;
  int BikerDude_height;
  int c; // variabele voor kleur
  Nio_body Lichaam; // geheugenruimte inruimen voor Nio_body-vorm
  Nio_limb_left Arm_left;

  Nio(int c_parameter) {
    c = c_parameter; // ingeruimde geheugenruimte vullen met waarde in parameter
    Lichaam = new Nio_body(c, y_loc); // ingeruimde geheugenruimte vullen met Nio_body vorm

    x_speed = int(random(4, 8)); // X Snelheid van beweging van het circeltje
    y_speed = x_speed; // X Snelheid van beweging van het circeltje

    x_loc = int(random(200, (width-200))); // X Startpositie circeltje
    y_loc = -30; // X Startpositie circeltje

    BikerDude_width = 30;
    BikerDude_height = BikerDude_width;

    Arm_left = new Nio_limb_left(c, y_loc);
  }

  void display() {
    Lichaam.display(x_loc, y_loc);
    Arm_left.display (x_loc, y_loc);
    //println("draaien maar!!!");
  }

  void beweeg(int WelkeInDeLijst) {
    if (x_loc > (width - 200) || x_loc < 200) { // x loc bij rand komen
      x_speed = x_speed * -1; // Omdraaien beweegrichting (x_speed keer -1)
    }

    x_loc = x_loc + x_speed; 
    y_loc = y_loc + y_speed;

    if (y_loc > height - 45) {
      RaakofMis(x_loc, WelkeInDeLijst);
      //println("Onderaan!");
    }
    //println(x_loc);
  }
}

