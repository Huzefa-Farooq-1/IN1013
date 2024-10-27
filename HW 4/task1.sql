CREATE TABLE petPet (
    petname VARCHAR(20) NOT NULL,
    owner VARCHAR(45),
    species VARCHAR(45),
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    birth DATE,
    death DATE,
    PRIMARY KEY (petname)
);

CREATE TABLE petEvent (
    petname VARCHAR(20),
    eventdate DATE,
    eventtype VARCHAR(15),
    remark VARCHAR(255),
    FOREIGN KEY (petname) REFERENCES petPet(petname),
    PRIMARY KEY (petname, eventdate)
);