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
    length TEXT,
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
INSERT INTO game (name, console_id) VALUES ('SingStar 80s', 1);
INSERT INTO game (name, console_id) VALUES ('SingStar 90s', 1);
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
