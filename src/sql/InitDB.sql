CREATE TABLE region (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE console (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE game (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    console_id INTEGER,
    FOREIGN KEY (console_id) REFERENCES console(id)
);

CREATE TABLE genre (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE track (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    interpret TEXT NOT NULL,
    year INTEGER,
    url TEXT
);

CREATE TABLE track_game (
    track_id INTEGER,
    game_id INTEGER,
    region_id INTEGER,
    PRIMARY KEY (track_id, game_id, region_id),
    FOREIGN KEY (track_id) REFERENCES track(id),
    FOREIGN KEY (game_id) REFERENCES game(id),
    FOREIGN KEY (region_id) REFERENCES region(id)
);

CREATE TABLE track_genre (
    track_id INTEGER,
    genre_id INTEGER,
    PRIMARY KEY (track_id, genre_id),
    FOREIGN KEY (track_id) REFERENCES track(id),
    FOREIGN KEY (genre_id) REFERENCES genre(id)
);

-- Insert regions
INSERT INTO region (name) VALUES ('UK');
INSERT INTO region (name) VALUES ('NA');
INSERT INTO region (name) VALUES ('DE');
INSERT INTO region (name) VALUES ('ES');
INSERT INTO region (name) VALUES ('FR');
INSERT INTO region (name) VALUES ('IT');
INSERT INTO region (name) VALUES ('PL');
INSERT INTO region (name) VALUES ('SE');
INSERT INTO region (name) VALUES ('NL');
INSERT INTO region (name) VALUES ('AU');
INSERT INTO region (name) VALUES ('PT');
INSERT INTO region (name) VALUES ('DK');
INSERT INTO region (name) VALUES ('FI');
INSERT INTO region (name) VALUES ('NO');
INSERT INTO region (name) VALUES ('HR');
INSERT INTO region (name) VALUES ('BE');

-- Insert consoles
INSERT INTO console (name) VALUES ('PS2');
INSERT INTO console (name) VALUES ('PS3');
INSERT INTO console (name) VALUES ('PS4');
INSERT INTO console (name) VALUES ('PS5');

-- Insert PS2 games
INSERT INTO game (name, console_id) VALUES ('SingStar', 1);
INSERT INTO game (name, console_id) VALUES ("SingStar '80s", 1);
INSERT INTO game (name, console_id) VALUES ("SingStar '90s", 1);
INSERT INTO game (name, console_id) VALUES ('SingStar ABBA', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Amped', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Anthems', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Boy Bands vs Girl Bands', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Chart Hits', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Country', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Hottest Hits', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Legends', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Motown', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Party', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Pop', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Pop Hits', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Pop Vol. 2', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Queen', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar R&B', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Rock Ballads', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Rocks!', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Singalong with Disney', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Studio 100', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Summer Party', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Take That', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar The Wiggles', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar The Dome', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Schlager', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Deutsch Rock-Pop', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar Deutsch Rock-Pop Vol. 2', 1);

-- Tracks
INSERT INTO track (interpret, title, year) VALUES ("A-ha", "Take On Me", 1984);
INSERT INTO track (interpret, title, year) VALUES ("Alexia", "Egoista", 2003);
INSERT INTO track (interpret, title, year) VALUES ("Atomic Kitten", "Eternal Flame", 1989);
INSERT INTO track (interpret, title, year) VALUES ("Avril Lavigne", "Complicated", 2002);
INSERT INTO track (interpret, title, year) VALUES ("Azúcar Moreno", "Sólo se vive una vez", 1996);
INSERT INTO track (interpret, title, year) VALUES ("Beth", "Dime", 2003);
INSERT INTO track (interpret, title, year) VALUES ("Blondie", "Heart of Glass", 1979);
INSERT INTO track (interpret, title, year) VALUES ("Blue", "One Love", 2002);
INSERT INTO track (interpret, title, year) VALUES ("Bro'Sis", "Do You", 2002);
INSERT INTO track (interpret, title, year) VALUES ("Busted", "Crashed the Wedding", 2003);
INSERT INTO track (interpret, title, year) VALUES ("Cali", "C'est Quand Le Bonheur", 2003);
INSERT INTO track (interpret, title, year) VALUES ("Carl Douglas", "Kung Fu Fighting", 1974);
INSERT INTO track (interpret, title, year) VALUES ("Daniel Bedingfield", "If You're Not the One", 2002);
INSERT INTO track (interpret, title, year) VALUES ("Daniele Silvestri", "Salirò", 2002);
INSERT INTO track (interpret, title, year) VALUES ("The Darkness", "I Believe in a Thing Called Love", 2003);
INSERT INTO track (interpret, title, year) VALUES ("David Civera", "Bye Bye", 2003);
INSERT INTO track (interpret, title, year) VALUES ("Deee-Lite", "Groove Is in the Heart", 1990);
INSERT INTO track (interpret, title, year) VALUES ("Dido", "Thank You", 2000);
INSERT INTO track (interpret, title, year) VALUES ("Die Toten Hosen", "Steh auf, wenn du am Boden bist", 2002);
INSERT INTO track (interpret, title, year) VALUES ("Elvis Presley", "Suspicious Minds", 1968);
INSERT INTO track (interpret, title, year) VALUES ("Emma Daumas", "Tu Seras", 2004);
INSERT INTO track (interpret, title, year) VALUES ("Falco", "Rock Me Amadeus", 1985);
INSERT INTO track (interpret, title, year) VALUES ("Fantastischen Vier", "Sie Ist Weg", 1995);
INSERT INTO track (interpret, title, year) VALUES ("George Michael", "Careless Whisper", 1984);
INSERT INTO track (interpret, title, year) VALUES ("Gloria Estefan", "Hoy", 2003);
INSERT INTO track (interpret, title, year) VALUES ("Good Charlotte", "Girls & Boys", 2003);
INSERT INTO track (interpret, title, year) VALUES ("Guaraná", "Noche en vela", 2004);
INSERT INTO track (interpret, title, year) VALUES ("Hombres G", "Lo Noto", 2002);
INSERT INTO track (interpret, title, year) VALUES ("Hombres G", "No Te Escaparás", 2004);
INSERT INTO track (interpret, title, year) VALUES ("Jamelia", "Superstar", 2003);
INSERT INTO track (interpret, title, year) VALUES ("Jamiroquai", "Deeper Underground", 1998);
INSERT INTO track (interpret, title, year) VALUES ("Jessica Marquez", "Magdalena", 2003);
INSERT INTO track (interpret, title, year) VALUES ("Juanes", "A Dios le Pido", 2002);
INSERT INTO track (interpret, title, year) VALUES ("Junior", "Down", 2003);
INSERT INTO track (interpret, title, year) VALUES ("La Differenza", "In un istante", 2004);
INSERT INTO track (interpret, title, year) VALUES ("La Oreja de Van Gogh", "20 de enero", 2003);
INSERT INTO track (interpret, title, year) VALUES ("La Oreja de Van Gogh", "Puedes Contar Conmigo", 2003);
INSERT INTO track (interpret, title, year) VALUES ("Laith Al-Deen", "Bilder Von Dir", 2000);
INSERT INTO track (interpret, title, year) VALUES ("Lemar", "50/50", 2003);
INSERT INTO track (interpret, title, year) VALUES ("Liberty X", "Just a Little", 2002);
INSERT INTO track (interpret, title, year) VALUES ("Lightning Seeds", "Three Lions", 1996);
INSERT INTO track (interpret, title, year) VALUES ("Los Rodríguez", "Sin Documentos", 1993);
INSERT INTO track (interpret, title, year) VALUES ("Madonna", "Like a Virgin", 1984);
INSERT INTO track (interpret, title, year) VALUES ("Mis-Teeq", "Scandalous", 2003);
INSERT INTO track (interpret, title, year) VALUES ("Motörhead", "Ace of Spades", 1980);
INSERT INTO track (interpret, title, year) VALUES ("Natalia Lafourcade", "En el 2000", 2002);
INSERT INTO track (interpret, title, year) VALUES ("No Angels", "Someday", 2003);
INSERT INTO track (interpret, title, year) VALUES ("Paola e Chiara", "Vamos a bailar", 2000);
INSERT INTO track (interpret, title, year) VALUES ("Patrick Nuo", "5 Days", 2003);
INSERT INTO track (interpret, title, year) VALUES ("Peter Schilling", "Major Tom", 1983);
INSERT INTO track (interpret, title, year) VALUES ("Petula Clark", "Downtown", 1964);
INSERT INTO track (interpret, title, year) VALUES ("P!nk", "Get the Party Started", 2001);
INSERT INTO track (interpret, title, year) VALUES ("Rick Astley", "Never Gonna Give You Up", 1987);
INSERT INTO track (interpret, title, year) VALUES ("Ricky Martin", "Livin' la Vida Loca", 1999);
INSERT INTO track (interpret, title, year) VALUES ("Rosario", "Mi Gato", 2002);
INSERT INTO track (interpret, title, year) VALUES ("Roy Orbison", "Oh, Pretty Woman", 1964);
INSERT INTO track (interpret, title, year) VALUES ("S Club", "Don't Stop Movin'", 2001);
INSERT INTO track (interpret, title, year) VALUES ("Sinclair", "Ensemble", 1997);
INSERT INTO track (interpret, title, year) VALUES ("Sinclair", "Si C'est Bon Comme Ça", 1997);
INSERT INTO track (interpret, title, year) VALUES ("Sinclair", "Votre Image", 1993);
INSERT INTO track (interpret, title, year) VALUES ("Sophie Ellis-Bextor", "Murder on the Dancefloor", 2001);
INSERT INTO track (interpret, title, year) VALUES ("Subsonica", "Nuova ossessione", 2002);
INSERT INTO track (interpret, title, year) VALUES ("Sugababes", "Round Round", 2002);
INSERT INTO track (interpret, title, year) VALUES ("Tragédie", "Hey Oh!", 2003);
INSERT INTO track (interpret, title, year) VALUES ("Village People", "Y.M.C.A.", 1978);
INSERT INTO track (interpret, title, year) VALUES ("Westlife", "World of Our Own", 2002);

INSERT INTO track_game (track_id, game_id, region_id) VALUES (1, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (1, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (1, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (1, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (1, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (2, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (3, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (3, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (3, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (3, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (3, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (4, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (4, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (4, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (4, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (4, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (5, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (6, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (7, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (7, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (7, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (8, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (8, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (8, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (8, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (9, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (10, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (10, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (10, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (11, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (12, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (12, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (12, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (13, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (14, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (15, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (15, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (15, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (15, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (16, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (17, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (17, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (17, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (18, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (18, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (18, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (18, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (18, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (19, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (20, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (20, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (20, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (20, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (20, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (21, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (22, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (23, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (24, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (24, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (24, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (24, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (24, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (25, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (26, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (26, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (27, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (28, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (29, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (30, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (30, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (30, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (30, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (30, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (31, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (32, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (33, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (34, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (35, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (36, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (37, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (38, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (39, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (40, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (40, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (40, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (41, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (42, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (43, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (43, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (43, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (43, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (43, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (44, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (44, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (44, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (45, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (45, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (45, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (46, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (47, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (48, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (49, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (50, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (51, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (51, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (52, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (52, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (52, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (52, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (52, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (53, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (53, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (53, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (53, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (54, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (54, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (54, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (54, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (54, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (55, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (56, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (56, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (56, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (56, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (56, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (57, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (57, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (57, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (57, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (58, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (59, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (60, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (61, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (61, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (61, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (61, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (62, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (63, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (63, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (63, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (63, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (64, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (65, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (65, 1, 3);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (65, 1, 4);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (65, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (65, 1, 6);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (66, 1, 1);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (66, 1, 5);
INSERT INTO track_game (track_id, game_id, region_id) VALUES (66, 1, 6);
