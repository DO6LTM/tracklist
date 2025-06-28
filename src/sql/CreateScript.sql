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
    console_id INTEGER,
    FOREIGN KEY (console_id) REFERENCES console(id)
);

CREATE TABLE game_title (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL
);

CREATE TABLE game_region (
    game_id INTEGER,
    region_id INTEGER,
    game_title_id INTEGER,
    PRIMARY KEY (game_id, region_id, game_title_id),
    FOREIGN KEY (game_id) REFERENCES game(id),
    FOREIGN KEY (region_id) REFERENCES region(id),
    FOREIGN KEY (game_title_id) REFERENCES game_title(id)
);

CREATE TABLE genre (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE track (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    artist TEXT NOT NULL,
    album TEXT,
    released INTEGER,
    duration INTEGER,
    image_url TEXT,
    url TEXT,
    popularity INTEGER
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

-- Init regions
INSERT INTO region (id, name) VALUES (1, 'UK');
INSERT INTO region (id, name) VALUES (2, 'NA');
INSERT INTO region (id, name) VALUES (3, 'DE');
INSERT INTO region (id, name) VALUES (4, 'ES');
INSERT INTO region (id, name) VALUES (5, 'FR');
INSERT INTO region (id, name) VALUES (6, 'IT');
INSERT INTO region (id, name) VALUES (7, 'PL');
INSERT INTO region (id, name) VALUES (8, 'SE');
INSERT INTO region (id, name) VALUES (9, 'NL');
INSERT INTO region (id, name) VALUES (10, 'AU');
INSERT INTO region (id, name) VALUES (11, 'PT');
INSERT INTO region (id, name) VALUES (12, 'DK');
INSERT INTO region (id, name) VALUES (13, 'FI');
INSERT INTO region (id, name) VALUES (14, 'NO');
INSERT INTO region (id, name) VALUES (15, 'HR');
INSERT INTO region (id, name) VALUES (16, 'BE');

-- Init consoles
INSERT INTO console (id, name) VALUES (1, 'PS2');
INSERT INTO console (id, name) VALUES (2, 'PS3');
INSERT INTO console (id, name) VALUES (3, 'PS4');
INSERT INTO console (id, name) VALUES (4, 'PS5');