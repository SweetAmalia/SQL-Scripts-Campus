CREATE DATABASE Campus_Eventdesk_RIM;
GO

USE Campus_Eventdesk_RIM;
GO

-- 1. Deelnemer Table with Age Validation Constraint
CREATE TABLE Deelnemer (
    Deelnemercode VARCHAR(10) PRIMARY KEY,
    Deelnemernaam VARCHAR(100) NOT NULL,
    DeelnemerLeeftijd INT NOT NULL CONSTRAINT CHK_Deelnemer_Leeftijd CHECK (DeelnemerLeeftijd >= 0 AND DeelnemerLeeftijd <= 120),
    Deelnemertype VARCHAR(20) NOT NULL CONSTRAINT CHK_Deelnemer_Type CHECK (Deelnemertype IN ('Student', 'Docent', 'Externe'))
);
GO

-- 2. Student Subtype Table
CREATE TABLE Student (
    Deelnemercode VARCHAR(10) PRIMARY KEY,
    Opleidingcode VARCHAR(20) NOT NULL,
    CONSTRAINT FK_Student_Deelnemer FOREIGN KEY (Deelnemercode) 
        REFERENCES Deelnemer(Deelnemercode)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- 3. Docent Subtype Table
CREATE TABLE Docent (
    Deelnemercode VARCHAR(10) PRIMARY KEY,
    Organisatiecode VARCHAR(20) NOT NULL,
    CONSTRAINT FK_Docent_Deelnemer FOREIGN KEY (Deelnemercode) 
        REFERENCES Deelnemer(Deelnemercode)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- 4. Externe Subtype Table
CREATE TABLE Externe (
    Deelnemercode VARCHAR(10) PRIMARY KEY,
    Bedrijfscode VARCHAR(20) NOT NULL,
    CONSTRAINT FK_Externe_Deelnemer FOREIGN KEY (Deelnemercode) 
        REFERENCES Deelnemer(Deelnemercode)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- 5. Contact Channels Table
CREATE TABLE Deelnemers_ContactKanalen (
    Deelnemercode VARCHAR(10) NOT NULL,
    contactwaarde VARCHAR(150) NOT NULL,
    PRIMARY KEY (Deelnemercode, contactwaarde),
    CONSTRAINT FK_Contact_Deelnemer FOREIGN KEY (Deelnemercode) 
        REFERENCES Deelnemer(Deelnemercode)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- 6. Activity Type Lookup Table
CREATE TABLE ActiviteitTypeInfo (
    ActiviteitType VARCHAR(50) PRIMARY KEY,
    ActiviteitAttribuut VARCHAR(50) NOT NULL
);
GO

-- 7. Activiteit Table with Capacity Constraint
CREATE TABLE Activiteit (
    Activiteitcode VARCHAR(10) PRIMARY KEY,
    ActiviteitTitel VARCHAR(100) NOT NULL,
    ActiviteitBeschrijving VARCHAR(255) NULL,
    ActiviteitCapaciteit INT NOT NULL CONSTRAINT CHK_Activiteit_Capaciteit CHECK (ActiviteitCapaciteit > 0),
    ActiviteitType VARCHAR(50) NOT NULL,
    VoorwaardeActiviteit VARCHAR(10) NULL,
    VervolgActiviteit VARCHAR(10) NULL,
    SessieStartmoment DATETIME NOT NULL,
    SessieEindmoment DATETIME NOT NULL,
    Locatie VARCHAR(100) NOT NULL,
    CONSTRAINT FK_Activiteit_Type FOREIGN KEY (ActiviteitType) 
        REFERENCES ActiviteitTypeInfo(ActiviteitType),
    CONSTRAINT FK_Activiteit_Voorwaarde FOREIGN KEY (VoorwaardeActiviteit) 
        REFERENCES Activiteit(Activiteitcode),
    CONSTRAINT FK_Activiteit_Vervolg FOREIGN KEY (VervolgActiviteit) 
        REFERENCES Activiteit(Activiteitcode),
    CONSTRAINT CHK_Activiteit_Tijden CHECK (SessieEindmoment > SessieStartmoment)
);
GO

-- 8. Activity Tags Table
CREATE TABLE ActiviteitTag (
    Activiteitcode VARCHAR(10) NOT NULL,
    Tag VARCHAR(50) NOT NULL,
    PRIMARY KEY (Activiteitcode, Tag),
    CONSTRAINT FK_Tag_Activiteit FOREIGN KEY (Activiteitcode) 
        REFERENCES Activiteit(Activiteitcode)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- 9. Activity Categories Table
CREATE TABLE ActiviteitCategorie (
    Activiteitcode VARCHAR(10) NOT NULL,
    Categorie VARCHAR(50) NOT NULL,
    PRIMARY KEY (Activiteitcode, Categorie),
    CONSTRAINT FK_Categorie_Activiteit FOREIGN KEY (Activiteitcode) 
        REFERENCES Activiteit(Activiteitcode)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

-- 10. Aanmelding Table with Price, Status, and Participation Form Constraints
CREATE TABLE Aanmelding (
    Aanmeldingcode VARCHAR(10) PRIMARY KEY,
    Deelnemercode VARCHAR(10) NOT NULL,
    Activiteitcode VARCHAR(10) NOT NULL,
    Deelnamevorm VARCHAR(50) NOT NULL CONSTRAINT CHK_Aanmelding_Vorm CHECK (Deelnamevorm IN ('Fysiek', 'Online')),
    Prijs DECIMAL(10,2) NOT NULL CONSTRAINT CHK_Aanmelding_Prijs CHECK (Prijs >= 0.00),
    Aanmelddatum DATETIME NOT NULL,
    AanmeldStatus VARCHAR(50) NOT NULL CONSTRAINT DF_AanmeldStatus DEFAULT 'Wachtlijst' CONSTRAINT CHK_AanmeldStatus CHECK (AanmeldStatus IN ('Bevestigd', 'Wachtlijst', 'Geannuleerd')),
    CONSTRAINT FK_Aanmelding_Deelnemer FOREIGN KEY (Deelnemercode) 
        REFERENCES Deelnemer(Deelnemercode),
    CONSTRAINT FK_Aanmelding_Activiteit FOREIGN KEY (Activiteitcode) 
        REFERENCES Activiteit(Activiteitcode)
);
GO