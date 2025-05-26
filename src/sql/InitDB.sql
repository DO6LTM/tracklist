CREATE TABLE language (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

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
    region_id INTEGER,
    FOREIGN KEY (console_id) REFERENCES console(id),
    FOREIGN KEY (region_id) REFERENCES region(id)
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
    length INTEGER,  -- Length in seconds
    url TEXT,
    language_id INTEGER,
    FOREIGN KEY (language_id) REFERENCES language(id)
);

CREATE TABLE track_game (
    track_id INTEGER,
    game_id INTEGER,
    PRIMARY KEY (track_id, game_id),
    FOREIGN KEY (track_id) REFERENCES track(id),
    FOREIGN KEY (game_id) REFERENCES game(id)
);

CREATE TABLE track_genre (
    track_id INTEGER,
    genre_id INTEGER,
    PRIMARY KEY (track_id, genre_id),
    FOREIGN KEY (track_id) REFERENCES track(id),
    FOREIGN KEY (genre_id) REFERENCES genre(id)
);