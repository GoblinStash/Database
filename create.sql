Create TABLE Regions (
    ID SERIAL,
    Name varchar(60) NOT NULL,
    PRIMARY KEY (ID)
);

Create TABLE Realms (
    ID SERIAL,
    Name varchar(60) NOT NULL,
    Slug varchar(60) NOT NULL,
    RegionID int,
    ConnectedRealmID int,
    PRIMARY KEY (ID),
    FOREIGN KEY (RegionID) REFERENCES Regions(ID),
    FOREIGN KEY (ConnectedRealmID) REFERENCES ConnectedRealms(ID)
);

Create TABLE Items (
    ID SERIAL,
    Name varchar(255) NOT NULL,
    PRIMARY KEY (ID)
);

-- Create the auction database
Create TABLE Auctions (
    ID SERIAL,
    BidEach int,
    BuyEach int,
    AuctionID int,
    Bid int,
    Buyout int,
    Quantity int,
    TimeLeft int,
    PlayerID int,
    ItemID int,
    RealmID int,
    PRIMARY KEY (ID)
);

Create Table Player (
    ID SERIAL,
    Name varchar(60) NOT NULL,
    RealmID int,
    PRIMARY KEY (ID),
    FOREIGN KEY (RealmID) REFERENCES Realms(ID)
);

Create Table ConnectedRealms (
    ID SERIAL,
    PRIMARY KEY (ID)
);

Create Table CalculationsHourly (
    ID SERIAL,
    Available int,
    Open real,
    PreviousClose real,
    Turnover real,
    CurrentPerItem real,
    Median real,
    StandardDeviation real,
    AverageStackSize real,
    RealmID int,
    ItemID int,
    PRIMARY KEY (ID),
    FOREIGN KEY (RealmID) REFERENCES Realms(ID),
    FOREIGN KEY (ItemID) REFERENCES Items(ID)
);