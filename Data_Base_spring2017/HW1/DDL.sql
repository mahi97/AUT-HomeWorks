CREATE TABLE Categories(ID           INT NOT NULL,
                 	  	NAME         VARCHAR (20) NOT NULL,
    			 	  	PRIMARY KEY (ID));

CREATE TABLE Programs(ID           INT NOT NULL,
                 	  NAME         VARCHAR(20) NOT NULL,
   					  DEVELOPER    VARCHAR(20) NOT NULL,
    			 	  PRIMARY KEY (ID));

CREATE TABLE Ads(ID            INT NOT NULL,
                 PROGRAMID     INT NOT NULL,
   				 CLICKPRICE    INT NOT NULL,
    			 VISITPRICE    INT NOT NULL,
   				 DOWNLOADPRICE INT NOT NULL,
                 CATEGORYID    INT NOT NULL,
                 A_TIMESTAMP   DATETIME NOT NULL,
    			 PRIMARY KEY (ID) ,
                 FOREIGN KEY (PROGRAMID) REFERENCES Programs(ID),
                 FOREIGN KEY (CATEGORYID) REFERENCES Categories(ID)
                 );

CREATE TABLE ProgramAds(ID          INT NOT NULL,
                 	  	PROGRAMID   INT NOT NULL,
   					  	ADID        INT NOT NULL,
    			 	  	PRIMARY KEY (ID),
                        FOREIGN KEY (PROGRAMID) REFERENCES Programs(ID),
                        FOREIGN KEY (ADID) REFERENCES Ads(ID));

CREATE TABLE Clicks(ID          INT NOT NULL,
                 	PROGRAMADID INT NOT NULL,
   					A_TIMESTAMP DATETIME NOT NULL,
    			 	PRIMARY KEY (ID),
                    FOREIGN KEY (PROGRAMADID) REFERENCES ProgramAds(ID));

CREATE TABLE Views(ID           INT NOT NULL,
                   PROGRAMADID         INT NOT NULL,
   				   A_TIMESTAMP    DATETIME NOT NULL,
    			   PRIMARY KEY (ID),
                   FOREIGN KEY (PROGRAMADID) REFERENCES ProgramAds(ID));

CREATE TABLE Downloads(ID           INT NOT NULL,
                 	  	PROGRAMADID         INT NOT NULL,
   					  	A_TIMESTAMP    DATETIME NOT NULL,
    			 	  	PRIMARY KEY (ID),
                        FOREIGN KEY (PROGRAMADID) REFERENCES ProgramAds(ID));