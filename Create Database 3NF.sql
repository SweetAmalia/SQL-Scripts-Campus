CREATE DATABASE [Campus Eventdesk - 3NF];
GO

USE [Campus Eventdesk - 3NF];
GO

CREATE TABLE Deelnemer (
    Deelnemercode VARCHAR(10) PRIMARY KEY,
    Deelnemernaam VARCHAR(100) NOT NULL,
    DeelnemerLeeftijd INT NOT NULL,
    Deelnemertype VARCHAR(20) NOT NULL
);
GO

CREATE TABLE Student (
    Deelnemercode VARCHAR(10) PRIMARY KEY,
    Opleidingcode VARCHAR(20) NOT NULL,
    CONSTRAINT FK_Student_Deelnemer FOREIGN KEY (Deelnemercode) 
        REFERENCES Deelnemer(Deelnemercode)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE Docent (
    Deelnemercode VARCHAR(10) PRIMARY KEY,
    Organisatiecode VARCHAR(20) NOT NULL,
    CONSTRAINT FK_Docent_Deelnemer FOREIGN KEY (Deelnemercode) 
        REFERENCES Deelnemer(Deelnemercode)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE Externe (
    Deelnemercode VARCHAR(10) PRIMARY KEY,
    Bedrijfscode VARCHAR(20) NOT NULL,
    CONSTRAINT FK_Externe_Deelnemer FOREIGN KEY (Deelnemercode) 
        REFERENCES Deelnemer(Deelnemercode)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE Deelnemers_ContactKanalen (
    Deelnemercode VARCHAR(10) NOT NULL,
    contactwaarde VARCHAR(150) NOT NULL,
    PRIMARY KEY (Deelnemercode, contactwaarde),
    CONSTRAINT FK_Contact_Deelnemer FOREIGN KEY (Deelnemercode) 
        REFERENCES Deelnemer(Deelnemercode)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE ActiviteitTypeInfo (
    ActiviteitType VARCHAR(50) PRIMARY KEY,
    ActiviteitAttribuut VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Activiteit (
    Activiteitcode VARCHAR(10) PRIMARY KEY,
    ActiviteitTitel VARCHAR(100) NOT NULL,
    ActiviteitBeschrijving VARCHAR(255) NULL,
    ActiviteitCapaciteit INT NOT NULL,
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
        REFERENCES Activiteit(Activiteitcode)
);
GO

CREATE TABLE ActiviteitTag (
    Activiteitcode VARCHAR(10) NOT NULL,
    Tag VARCHAR(50) NOT NULL,
    PRIMARY KEY (Activiteitcode, Tag),
    CONSTRAINT FK_Tag_Activiteit FOREIGN KEY (Activiteitcode) 
        REFERENCES Activiteit(Activiteitcode)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE ActiviteitCategorie (
    Activiteitcode VARCHAR(10) NOT NULL,
    Categorie VARCHAR(50) NOT NULL,
    PRIMARY KEY (Activiteitcode, Categorie),
    CONSTRAINT FK_Categorie_Activiteit FOREIGN KEY (Activiteitcode) 
        REFERENCES Activiteit(Activiteitcode)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO


INSERT INTO ActiviteitTypeInfo (ActiviteitType, ActiviteitAttribuut) VALUES
('Workshop', 'Interactief'),
('Lezing', 'Plenair'),
('Hackathon', 'Coding');
GO

INSERT INTO Activiteit (Activiteitcode, ActiviteitTitel, ActiviteitBeschrijving, ActiviteitCapaciteit, ActiviteitType, VoorwaardeActiviteit, VervolgActiviteit, SessieStartmoment, SessieEindmoment, Locatie) VALUES
('ACT001', 'Introductie Python', 'Basisbeginselen van programmeren in Python', 30, 'Lezing', NULL, 'ACT002', '2026-11-01 09:00:00', '2026-11-01 10:30:00', 'Auditorium A'),
('ACT002', 'Gevorderd Python & Pandas', 'Data-analyse met pandas en numpy', 25, 'Workshop', 'ACT001', 'ACT003', '2026-11-01 11:00:00', '2026-11-01 13:00:00', 'Lab 1.2'),
('ACT003', 'AI Hackathon 2026', 'Bouw je eigen machine learning model in teams', 50, 'Hackathon', 'ACT002', NULL, '2026-11-02 09:00:00', '2026-11-02 17:00:00', 'Innovation Hub'),
('ACT004', 'Cloud Architectuur Basis', 'Inleiding tot cloud computing en AWS/Azure', 40, 'Lezing', NULL, 'ACT005', '2026-11-03 10:00:00', '2026-11-03 12:00:00', 'Auditorium B'),
('ACT005', 'Kubernetes & Docker Hands-on', 'Containerisatie praktijktraining', 20, 'Workshop', 'ACT004', NULL, '2026-11-03 13:30:00', '2026-11-03 16:30:00', 'Lab 2.1');
GO

INSERT INTO ActiviteitTag (Activiteitcode, Tag) VALUES
('ACT001', 'Python'),
('ACT001', 'Beginners'),
('ACT002', 'Python'),
('ACT002', 'DataScience'),
('ACT003', 'AI'),
('ACT003', 'MachineLearning'),
('ACT004', 'Cloud'),
('ACT005', 'DevOps'),
('ACT005', 'Docker');
GO

INSERT INTO ActiviteitCategorie (Activiteitcode, Categorie) VALUES
('ACT001', 'Software Development'),
('ACT002', 'Data Science'),
('ACT003', 'Artificial Intelligence'),
('ACT004', 'Infrastructure'),
('ACT005', 'Infrastructure');
GO

INSERT INTO Deelnemer (Deelnemercode, Deelnemernaam, DeelnemerLeeftijd, Deelnemertype) VALUES
('D001', 'Jan Jansen', 21, 'Student'),
('D002', 'Emma de Vries', 23, 'Student'),
('D003', 'Mohammed El Amrani', 20, 'Student'),
('D004', 'Sophie Bakker', 22, 'Student'),
('D005', 'Lucas van Dijk', 19, 'Student'),
('D006', 'Dr. Peter van de Berg', 45, 'Docent'),
('D007', 'Prof. Maria Santos', 52, 'Docent'),
('D008', 'Dr. Henk Visser', 38, 'Docent'),
('D009', 'Bram de Jong', 41, 'Externe'),
('D010', 'Lisa Mulder', 35, 'Externe'),
('D011', 'Klaas de Boer', 25, 'Student');
GO

INSERT INTO Student (Deelnemercode, Opleidingcode) VALUES
('D001', 'INF-HBO'),
('D002', 'BI-HBO'),
('D003', 'INF-HBO'),
('D004', 'AI-MSC'),
('D005', 'CYB-MSC'),
('D011', 'INF-HBO');
GO

INSERT INTO Docent (Deelnemercode, Organisatiecode) VALUES
('D006', 'ORG-IT'),
('D007', 'ORG-AI'),
('D008', 'ORG-IT');
GO

INSERT INTO Externe (Deelnemercode, Bedrijfscode) VALUES
('D009', 'TECH-CORP'),
('D010', 'INNO-SOL');
GO

INSERT INTO Deelnemers_ContactKanalen (Deelnemercode, contactwaarde) VALUES
('D001', 'jan.jansen@campus3nf.nl'),
('D001', '+31612345678'),
('D002', 'emma.devries@campus3nf.nl'),
('D003', 'mo.elamrani@campus3nf.nl'),
('D004', 'sophie.bakker@campus3nf.nl'),
('D005', 'lucas.vandijk@campus3nf.nl'),
('D006', 'p.vandeberg@campus3nf.nl'),
('D007', 'm.santos@campus3nf.nl'),
('D008', 'h.visser@campus3nf.nl'),
('D009', 'bram@techcorp.com'),
('D010', 'lisa@innosol.nl');
GO