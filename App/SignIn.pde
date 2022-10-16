import java.awt.Font;



public class SignIn {
  ArrayList<PImage> images;
  ArrayList<PVector> size;
  ArrayList<PVector> pos;
  GTextField username;
  GPassword password;
  String inputPassword = "test";
  String inputUsername = "test2";
  int Scaler = 15;

  public SignIn(PApplet App) {
    images = h.loadImages("imgs/signin/");
    size = new ArrayList<>();
    pos = new ArrayList<>();

    size.add(new PVector(92 * Scaler, 42 * Scaler));
    size.add(new PVector(32 * Scaler, 12 * Scaler));
    size.add(new PVector(38 * Scaler, 12 * Scaler));

    pos.add(new PVector(300, 200));
    pos.add(new PVector(pos.get(0).x + 100, pos.get(0).y + size.get(0).y - size.get(1).y - 100));
    pos.add(new PVector(pos.get(0).x + size.get(0).x - size.get(2).x - 100, pos.get(0).y + size.get(0).y - size.get(1).y - 100));


    username = new GTextField(App, pos.get(0).x + (46*Scaler), pos.get(0).y + (5*Scaler), 40*Scaler, 5*Scaler);
    username.setFont(new Font("Dialog", Font.PLAIN, 48));

    password = new GPassword(App, pos.get(0).x + (46*Scaler), pos.get(0).y + (15*Scaler), 40*Scaler, 5*Scaler);
    password.setFont(new Font("Dialog", Font.PLAIN, 52));
    password.setMaxWordLength(20);
    password.setVisibleChar('*');
  }

  public void display() {
    username.draw();
    password.draw();
    for (int i = 0; i < images.size(); i++) {
      image(images.get(i), pos.get(i).x, pos.get(i).y, size.get(i).x, size.get(i).y); // draw Images
      if (h.OverRect(pos.get(i).x, pos.get(i).y, size.get(i).x, size.get(i).y) && sM.mPressed) {
        
        inputUsername = username.getText();
        inputPassword = password.getPassword();
        
        if (i == 1) {
          sM.mPressed = false;
          signIn();
        }

        if (i == 2) {
          sM.mPressed = false;
          createAccount();
        }
      }
    }
  }

  public void createAccount() {
    if ( db.connect() ) {


      db.query( String.format("INSERT INTO Player (username, password) VALUES ('%s', '%2s')", inputUsername, inputPassword) );
      db.query( "SELECT * FROM Player" );

      while (db.next())
        System.out.println( db.getString("username") + "\n" + db.getString("password") + "\n" +  db.getInt("hasStone")+ "\n" + db.getString("hasGiant"));
    }
  }



  public void signIn() {
    if ( db.connect() ) {
      db.query( String.format("SELECT * FROM Player WHERE (password == '%s' AND username == '%2s')", inputPassword, inputUsername));
      //db.query( "SELECT * FROM Player WHERE (password == 'test2' AND username == 'test')");

      while (db.next()) {
        playerID = db.getInt("playerID");
        coins = db.getInt("coins");
        if (db.getInt("hasStone") == 1){
          ownedWeapons.add(stone);
        }if (db.getInt("hasIron") == 1){
          ownedWeapons.add(iron);
        }if (db.getInt("hasFire") == 1){
          ownedWeapons.add(fire);
        }if (db.getInt("hasGiant") == 1){
          ownedWeapons.add(giant);
        }
        username.setVisible(false);
        password.setVisible(false);
        sM.scene = 'M';
      }
    }
  }
}
