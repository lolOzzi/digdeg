import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

SQLite db;

public void setup() {
  size( 100, 100 );
  db = new SQLite( this, "./data/mvDB.sqlite" );

  if ( db.connect() ) {

    db.query( "SELECT name as \"Name\" FROM SQLITE_MASTER where type=\"table\"" );

    while (db.next())
      System.out.println( db.getString("Name") );

    db.query( "INSERT INTO Player (username, password, coins) VALUES ('test', 'test2', 10)" );


    db.query( "SELECT * FROM Player" );

    while (db.next())
      System.out.println( db.getString("username") + "\n" + db.getString("password") + "\n" +  db.getInt("hasStone")+ "\n" + db.getString("hasGiant"));

  }

  noLoop();
}

public void draw() {
}
