CREATE DATABASE campus_eventdesk;
GO

IF OBJECT_ID('platte_registratie', 'U') IS NOT NULL
    DROP TABLE platte_registratie;
GO


CREATE TABLE platte_registratie (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    DeelnemerCode VARCHAR(50),
    DeelnemerNaam VARCHAR(100),
    DeelnemerLeeftijd INT,
    DeelnemerType VARCHAR(50),
    Opleiding VARCHAR(100),
    Bedrijfsnaam VARCHAR(100),
    Bedrijfscode VARCHAR(50),
    ContactKanalen VARCHAR(MAX),
    ActiviteitCode VARCHAR(50),
    ActiviteitTitel VARCHAR(100),
    ActiviteitBeschrijving VARCHAR(MAX),
    ActiviteitCapaciteit INT,
    ActiviteitType VARCHAR(50),
    ActiviteitAttribute VARCHAR(100),
    Categorieen VARCHAR(255),
    Tags VARCHAR(255),
    VoorwaardeActiviteit VARCHAR(50),
    VervolgActiviteit VARCHAR(50),
    SessieStartmoment DATETIME,
    SessieEindmoment DATETIME,
    Locatie VARCHAR(100),
    Deelnamevorm VARCHAR(50),
    Prijs DECIMAL(10,2),
    Aanmelddatum DATE,
    AanmeldStatus VARCHAR(50)
);
GO


INSERT INTO platte_registratie (
    DeelnemerCode, DeelnemerNaam, DeelnemerLeeftijd, DeelnemerType, 
    Opleiding, Bedrijfsnaam, Bedrijfscode, ContactKanalen, 
    ActiviteitCode, ActiviteitTitel, ActiviteitBeschrijving, ActiviteitCapaciteit, 
    ActiviteitType, ActiviteitAttribute, Categorieen, Tags, 
    VoorwaardeActiviteit, VervolgActiviteit, SessieStartmoment, SessieEindmoment, 
    Locatie, Deelnamevorm, Prijs, Aanmelddatum, AanmeldStatus
) VALUES 
('1', 'Aria', 20, 'Student', 'ICT', NULL, NULL, 'Telefoon: 0612345678, E-mail: aria@test.nl', 'ACT-01', 'Workshop SQL', 'Basis SQL', 30, 'Workshop', 'Verplicht', 'Onderwijs, IT Beginner, Tech', NULL, NULL, 'ACT-02', '2026-10-10 09:00:00', '2026-10-10 12:00:00', 'Zaal 1', 'Gratis', 0.00, '2026-09-01', 'Bevestigd'),
('2', 'Breda', 35, 'Medewerker', NULL, 'De Haagse Hogeschool', NULL, 'E-mail: breda@hhs.nl', 'ACT-02', 'Gastlezing AI', 'AI in praktijk', 50, 'Gastlezing', 'Vrijwillig', 'Onderzoek, Innovatie', 'Gevorderd, AI', 'ACT-01', NULL, '2026-10-11 13:00:00', '2026-10-11 15:00:00', 'Zaal 2', 'Betaald', 50.00, '2026-09-05', 'Bevestigd'),
('3', 'Colorado', 40, 'Externe', NULL, NULL, 'EX-992', 'Telefoon: 0698765432', 'ACT-02', 'Gastlezing AI', 'AI in praktijk', 50, 'Gastlezing', 'Vrijwillig', 'Onderzoek, Innovatie', 'Gevorderd, AI', 'ACT-01', NULL, '2026-10-11 13:00:00', '2026-10-11 15:00:00', 'Zaal 2', 'Early-Bird', 40.00, '2026-09-02', 'Wachtlijst'),
('1', 'Aria', 20, 'Student', 'ICT', NULL, NULL, 'Telefoon: 0612345678, E-mail: aria@test.nl', 'ACT-03', 'Python Basics', 'Leren programmeren', 25, 'Training', 'Verplicht', 'Onderwijs, IT Beginner', 'Programmeren', NULL, NULL, '2026-10-15 10:00:00', '2026-10-15 14:00:00', 'Zaal 3', 'Gratis', 0.00, '2026-09-03', 'Bevestigd'),
('4', 'Dakota', 28, 'Medewerker', NULL, 'De Haagse Hogeschool', NULL, 'E-mail: dakota@hhs.nl', 'ACT-03', 'Python Basics', 'Leren programmeren', 25, 'Training', 'Verplicht', 'Onderwijs, IT Beginner', 'Programmeren', NULL, NULL, '2026-10-15 10:00:00', '2026-10-15 14:00:00', 'Zaal 3', 'Standaard', 20.00, '2026-09-10', 'Geannuleerd'),
('5', 'Emma', 21, 'Student', 'Bedrijfskunde', NULL, NULL, 'Telefoon: 0688888888', 'ACT-01', 'Workshop SQL', 'Basis SQL', 30, 'Workshop', 'Verplicht', 'Onderwijs, IT Beginner', 'Tech', NULL, 'ACT-02', '2026-10-10 09:00:00', '2026-10-10 12:00:00', 'Zaal 1', 'Standaard', 10.00, '2026-09-15', 'Wachtlijst'),
('6', 'Floor', 22, 'Student', 'ICT', NULL, NULL, 'E-mail: floor@test.nl', 'ACT-04', 'Advanced SQL', 'Complexe queries', 20, 'Workshop', 'Keuze', 'Onderwijs, IT Gevorderd', 'Tech', 'ACT-01', NULL, '2026-10-20 13:00:00', '2026-10-20 16:00:00', 'Zaal 1', 'Gratis', 0.00, '2026-09-16', 'Bevestigd'),
('7', 'Gerald', 45, 'Externe', NULL, 'IT Consultancy BV', 'EX-101', 'Telefoon: 0622223333, E-mail: gerald@itc.nl', 'ACT-04', 'Advanced SQL', 'Complexe queries', 20, 'Workshop', 'Keuze', 'Onderwijs, IT Gevorderd', 'Tech', 'ACT-01', NULL, '2026-10-20 13:00:00', '2026-10-20 16:00:00', 'Zaal 1', 'Betaald', 100.00, '2026-09-17', 'Bevestigd'),
('8', 'Hector', 19, 'Student', 'ICT', NULL, NULL, 'Telefoon: 0633334444', 'ACT-02', 'Gastlezing AI', 'AI in praktijk', 50, 'Gastlezing', 'Vrijwillig', 'Onderzoek, Innovatie', 'Gevorderd, AI', 'ACT-01', NULL, '2026-10-11 13:00:00', '2026-10-11 15:00:00', 'Zaal 2', 'Gratis', 0.00, '2026-09-18', 'Bevestigd'),
('9', 'Ian', 33, 'Medewerker', NULL, 'De Haagse Hogeschool', NULL, 'Fax: 070-1234567, E-mail: ian@hhs.nl', 'ACT-01', 'Workshop SQL', 'Basis SQL', 30, 'Workshop', 'Verplicht', 'Onderwijs, IT Beginner', 'Tech', NULL, 'ACT-02', '2026-10-10 09:00:00', '2026-10-10 12:00:00', 'Zaal 1', 'Standaard', 10.00, '2026-09-19', 'Geannuleerd'),
('10', 'Jonathan', 30, 'Externe', NULL, 'Data Solutions', 'EX-102', 'E-mail: jon@datasol.nl', 'ACT-03', 'Python Basics', 'Leren programmeren', 25, 'Training', 'Verplicht', 'Onderwijs, IT Beginner', 'Programmeren', NULL, NULL, '2026-10-15 10:00:00', '2026-10-15 14:00:00', 'Zaal 3', 'Early-Bird', 80.00, '2026-09-20', 'Bevestigd'),
('11', 'Kim', 18, 'Student', 'Bedrijfskunde', NULL, NULL, 'Telefoon: 0655556666', 'ACT-03', 'Python Basics', 'Leren programmeren', 25, 'Training', 'Verplicht', 'Onderwijs, IT Beginner', 'Programmeren', NULL, NULL, '2026-10-15 10:00:00', '2026-10-15 14:00:00', 'Zaal 3', 'Gratis', 0.00, '2026-09-21', 'Wachtlijst'),
('12', 'Lester', 28, 'Medewerker', NULL, 'De Haagse Hogeschool', NULL, 'E-mail: lester@hhs.nl', 'ACT-04', 'Advanced SQL', 'Complexe queries', 20, 'Workshop', 'Keuze', 'Onderwijs, IT Gevorderd', 'Tech', 'ACT-01', NULL, '2026-10-20 13:00:00', '2026-10-20 16:00:00', 'Zaal 1', 'Betaald', 50.00, '2026-09-22', 'Bevestigd'),
('1', 'Aria', 20, 'Student', 'ICT', NULL, NULL, 'Telefoon: 0612345678, E-mail: aria@test.nl', 'ACT-04', 'Advanced SQL', 'Complexe queries', 20, 'Workshop', 'Keuze', 'Onderwijs, IT Gevorderd', 'Tech', 'ACT-01', NULL, '2026-10-20 13:00:00', '2026-10-20 16:00:00', 'Zaal 1', 'Gratis', 0.00, '2026-09-23', 'Bevestigd'),
('13', 'Mona', 50, 'Externe', NULL, 'Tech Corp', 'EX-909', 'Telefoon: 0611112222', 'ACT-01', 'Workshop SQL', 'Basis SQL', 30, 'Workshop', 'Verplicht', 'Onderwijs, IT Beginner', 'Tech', NULL, 'ACT-02', '2026-10-10 09:00:00', '2026-10-10 12:00:00', 'Zaal 1', 'Betaald', 100.00, '2026-09-24', 'Bevestigd'),
('2', 'Breda', 35, 'Medewerker', NULL, 'De Haagse Hogeschool', NULL, 'E-mail: breda@hhs.nl', 'ACT-03', 'Python Basics', 'Leren programmeren', 25, 'Training', 'Verplicht', 'Onderwijs, IT Beginner', 'Programmeren', NULL, NULL, '2026-10-15 10:00:00', '2026-10-15 14:00:00', 'Zaal 3', 'Betaald', 50.00, '2026-09-25', 'Wachtlijst');
GO
