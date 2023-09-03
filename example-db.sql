DROP TABLE IF EXISTS trans;
DROP TABLE IF EXISTS work;
DROP TABLE IF EXISTS customer_artist_int;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS listofartists;

CREATE TABLE listofartists (
  ArtistID       INT(11)  NOT NULL AUTO_INCREMENT,
  LastName       CHAR(25) NOT NULL,
  FirstName     CHAR(25) NOT NULL,
  Nationality   CHAR(30) DEFAULT NULL,
  DateDeceased   INT(11)  DEFAULT NULL,
  DateOfBirth   INT(11)  DEFAULT NULL,
  CONSTRAINT ListOfArtists_PK PRIMARY KEY (ArtistID)
);

INSERT INTO listofartists
  (ArtistID,LastName,FirstName,Nationality,DateDeceased,DateOfBirth)
VALUES
  (1,'Miro','Joan','Spanish',1983,1893),
  (2,'Kandinsky','Wassily','Russian',1944,1866),
  (3,'Klee','Paul','German',1940,1879),
  (4,'Matisse','Henri','French',1954,1869),
  (5,'Chagall','Marc','French',1985,1887),
  (11,'Sargent','John Singer','American',1925,1856),
  (17,'Tobey','Mark','American',1976,1890),
  (18,'Horiuchi','Paul','American',1999,1906),
  (19,'Graves','Morris','American',1999,1920),
  (20,'Dali','Salvador','Spanish',1989,1904),
  (21,'Rodin','Auguste','French',1917,1840);
  
CREATE TABLE customer (
  CustomerID    INT           NOT NULL AUTO_INCREMENT,
  LastName      CHAR(25)      NOT NULL,
  FirstName     CHAR(25)      NOT NULL,
  Street        CHAR(30)      DEFAULT NULL,
  City          CHAR(35)      DEFAULT NULL,
  ZipPostalCode CHAR(9)       DEFAULT NULL,
  Country       CHAR(50)      DEFAULT NULL,
  AreaCode      CHAR(3)       DEFAULT NULL,
  PhoneNumber   CHAR(8)       DEFAULT NULL,
  Email         VARCHAR(100)  DEFAULT NULL,
  PRIMARY KEY (CustomerID),
  UNIQUE KEY EmailAK1 (Email)
);

INSERT INTO customer (CustomerID,LastName,FirstName,Street,City,
                      ZipPostalCode,Country,AreaCode,PhoneNumber,Email)
VALUES
  (1000,'Cohen','Shalom','23 Habonim St','Haifa','94325','Israel','04',
        '5432345','Cohen.Sh@gmail.com'),
  (1001,'Arad','Keren','17 Jabotinsky St','Tel Aviv','64325','Israel','03',
        '5226874','AradK@hotmail.com'),
  (1002,'Kaminzky','Ariel','43 Yordei Hasira','Tel Aviv','65321','Israel','03',
        '5117643','AKam@bezeqint.net'),
  (1003,'Wu','Susan','105 Locust Ave','Atlanta','30322','USA','404',
        '6533465',NULL),
  (1004,'Zur','Michael','35 Magpie Lane','London','WC13CW','UK','020',
        '98231450','ZurM@yahoo.com');

CREATE TABLE customer_artist_int (
  ArtistID    INT   NOT NULL,
  CustomerID  INT   NOT NULL,
  PRIMARY KEY (ArtistID,CustomerID),
  FOREIGN KEY CAInt_ArtistFK (ArtistID)
    REFERENCES ListOfArtists (ArtistID)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  FOREIGN KEY CAInt_CustomerFK (CustomerID)
    REFERENCES customer (CustomerID)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);

INSERT INTO customer_artist_int (ArtistID,CustomerID)
VALUES
  (1,1001),
  (2,1001),
  (1,1004),
  (2,1004),
  (18,1002),
  (19,1001);

CREATE TABLE work (
  WorkID      INT           NOT NULL AUTO_INCREMENT,
  Title       CHAR(35)      NOT NULL,
  Copy        CHAR(12)      NOT NULL,
  Medium      CHAR(35)      DEFAULT NULL,
  Description VARCHAR(1000) DEFAULT 'Unknown provenance',
  ArtistID    INT           NOT NULL,
  PRIMARY KEY (WorkID),
  UNIQUE KEY WorkAK1 (Title,Copy),
  FOREIGN KEY ArtistFK (ArtistID)
    REFERENCES listofartists (ArtistID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

INSERT INTO work (WorkID,Title,Copy,Medium,Description,ArtistID)
VALUES
  (500,'Memories 4','Unique','Casein rice paper collage','31 X 24.8 in.',18),
  (511,'Surf and Bird','142/500','High Quality Limited Print','NorthWest School Expressionist style',19),
  (521,'The Tilled Field','788/1000','High Quality Limited Print','Early Surrealist style',1),
  (522,'La Lecon de Ski','353/500','High Quality Limited Print','Surrealist style',1),
  (524,'Woman With A Hat','596/750','High Quality Limited Print','A very colourful impressionist piece',4),
  (548,'Night Bird','Unique','Watercolour on paper','50X72.5 cm. - Signed',19),
  (553,'The Dance','734/1000','High Quality Limited Print','An Impressionist masterpiece',4),
  (586,'Spanish Dancer','588/750','High Quality Limited Print','American Realist style - From work in Spain',11),
  (590,'Blue Interior','Unique','Tempera on card','43.9 X 28 in.',17);

CREATE TABLE trans (
  TransactionID     INT       NOT NULL AUTO_INCREMENT,
  DateAcquired      DATETIME  NOT NULL,
  AcquisitionPrice  INT       NOT NULL,
  DateSold          DATETIME  DEFAULT NULL,
  AskingPrice       INT       DEFAULT NULL,
  SalesPrice        INT       DEFAULT NULL,
  CustomerID        INT       DEFAULT NULL,
  WorkID            INT       NOT NULL,
  PRIMARY KEY (TransactionID),
  FOREIGN KEY TransCustomerFK (CustomerID)
    REFERENCES customer (CustomerID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY TransWorkFK (WorkID)
    REFERENCES work (WorkID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

INSERT INTO trans (TransactionID,DateAcquired,AcquisitionPrice,
                   DateSold,AskingPrice,SalesPrice,CustomerID,WorkID)
VALUES
  (100,'2005-04-11 00:00:00',30000,'2005-04-12 00:00:00',45000,42500,1001,500),
  (104,'2005-11-07 00:00:00',250,'2005-12-19 00:00:00',500,500,1001,511),
  (108,'2005-11-17 00:00:00',250,'2006-12-12 00:00:00',500,400,1004,522);
