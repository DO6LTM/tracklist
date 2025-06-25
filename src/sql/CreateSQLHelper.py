import csv
import os
from pathlib import Path
from spotipy import Spotify
from spotipy.oauth2 import SpotifyClientCredentials

client_id = ""
client_secret = ""

track_id = 1
game_id = 1
game_title_id = 1

PS2_EXCEPTIONS = {
    "Singstar Legends": {
        "FI": "Singstar Legendat"
    },
    "Singstar Party": {
        "FR": "Singstar NRJ Music Tour"
    },
    "Singstar Pop": {
        "UK": "Singstar Popworld",
        "DE": "The Dome",
        "SE": "Singstar Svenska Hits",
        "NO": "Singstar Norske Hits"
    },
    "Singstar Summer Party": {
        "AU": "Singstar Party Hits"
    }
}

CONSOLE_MAP = {
    "PS2": 1,
    "PS3": 2,
    "PS4": 3,
    "PS5": 4
}
LANGUAGE_MAP = {
    "UK": 1,
    "NA": 2,
    "DE": 3,
    "ES": 4,
    "FR": 5,
    "IT": 6,
    "PL": 7,
    "SE": 8,
    "NL": 9,
    "AU": 10,
    "PT": 11,
    "DK": 12,
    "FI": 13,
    "NO": 14,
    "HR": 15,
    "BE": 16
}

def get_spotify_client():
    auth_manager = SpotifyClientCredentials(
        client_id=client_id,
        client_secret=client_secret
    )
    return Spotify(auth_manager=auth_manager)

def search_track(title, artist=None):
    sp = get_spotify_client()
    query = f'track:"{title}"'
    if artist:
        query += f' artist:"{artist}"'

    results = sp.search(q=query, type="track", limit=1)
    items = results.get("tracks", {}).get("items", [])
    return items[0] if items else None

def interpret_track(track_obj):
    images = track_obj["album"].get("images", [])
    album_image_url = images[0]["url"] if images else None

    result = {
        "name": track_obj["name"],
        "artists": track_obj["artists"][0]["name"],
        "album": track_obj["album"]["name"],
        "released": track_obj["album"]["release_date"].split("-")[0],
        "duration": track_obj["duration_ms"] // 1000,
        "spotify_url": track_obj["external_urls"]["spotify"],
        "album_image_url": album_image_url
    }

    return result

with open(f"InitScript.sql", "w", encoding="utf-8") as out_file:
    for console in CONSOLE_MAP.keys():
        console_id = CONSOLE_MAP[console]
        if os.path.isdir(console):
            for game_file in os.listdir(console):
                with open(f"{console}/{game_file}", "r", encoding="utf-8") as in_file:
                    reader = csv.DictReader(in_file, delimiter="\t")
                    dict_list = [row for row in reader]

                    game_title = ".".join(game_file.split('.')[0:-1])
                    out_file.write(f"INSERT INTO game (id, console_id) VALUES ({game_id}, {console_id});\n")

                    out_file.write(f'INSERT INTO game_title (id, title) VALUES ({game_title_id}, "{game_title}");\n')
                    game_exceptions = {}
                    if console == "PS2" and game_title in PS2_EXCEPTIONS.keys():
                        tmp_game_title_id = game_title_id
                        for (region, title) in PS2_EXCEPTIONS[game_title].items():
                            tmp_game_title_id += 1
                            game_exceptions[region] = tmp_game_title_id
                            out_file.write(f'INSERT INTO game_title (id, title) VALUES ({tmp_game_title_id}, "{title}");\n')
                            out_file.write(f"INSERT INTO game_region (game_id, region_id, game_title_id) VALUES ({game_id}, {LANGUAGE_MAP[region]}, {tmp_game_title_id});\n")
                    for region in [r for r in reader.fieldnames if r in LANGUAGE_MAP.keys() and r not in game_exceptions.keys()]:
                        out_file.write(f"INSERT INTO game_region (game_id, region_id, game_title_id) VALUES ({game_id}, {LANGUAGE_MAP[region]}, {game_title_id});\n")

                    for track in dict_list:
                        title = track["Song Title"]
                        artist = track["Artist"]
                        spotify_track = search_track(title, artist)
                        if not spotify_track:
                            print("No matching track found:", title, artist)
                            out_file.write(f'INSERT INTO track (id, title, artist) VALUES ({track_id}, "{title}", "{artist}");\n')
                        else:
                            result = interpret_track(spotify_track)
                            album = result["album"]
                            released = result["released"]
                            duration = result["duration"]
                            image = result["album_image_url"]
                            spotify_url = result["spotify_url"]
                            out_file.write(f'INSERT INTO track (id, title, artist, album, released, duration, image_url, url) VALUES ({track_id}, "{title}", "{artist}", "{album}", "{released}", "{duration}", "{image}", "{spotify_url}");\n')

                        for region in [r for r in track.keys() if r in LANGUAGE_MAP.keys()]:
                            if track[region] == "Yes":
                                out_file.write(f"INSERT INTO track_game (track_id, game_id, region_id) VALUES ({track_id}, {game_id}, {LANGUAGE_MAP[region]});\n")
                        track_id += 1

                game_title_id += 1
                game_title_id += len(game_exceptions.keys())
                game_id += 1