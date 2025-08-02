<template>
  <v-card @click="showDialog = true" width="92%" class="card">
    <div class="w-33 image">
      <v-img rounded cover max-height="inherit" aspect-ratio="1" :src="image_url" />
    </div>
    <div class="w-66 text">
      <v-card-title>
        <v-row>
          <v-col cols="10">
           <div class="ellipsis">{{ title }}</div>
          </v-col>
          <v-col cols="2" class="text-end">
            <v-icon color="grey lighten-1">mdi-information-outline</v-icon>
          </v-col>
        </v-row>
      </v-card-title>
      <v-card-subtitle>{{ artist }}</v-card-subtitle>
      <v-card-text>
        <span class="font-weight-bold">{{ $t('released') }}: </span>{{ released }}
        <v-spacer />
        <span class="font-weight-bold">{{ $t('duration') }}: </span>{{ formattedDuration }}
        <v-spacer />
        <span class="ellipsis"><span class="font-weight-bold">{{ $t('album') }}: </span>{{ album }}</span>
      </v-card-text>
    </div>
    <v-dialog v-model="showDialog" width="500">
      <v-card>
        <v-card-title>
          <v-row>
            <v-col cols="10" style="display: flex; flex-wrap: wrap;">
              <v-label class="font-weight-bold text-black">{{ title }}</v-label><span style="margin-left: 0.2em; margin-right: 0.2em;">-</span><v-label color="grey lighten-1">{{ artist }}</v-label>
            </v-col>
            <v-col cols="2" class="text-end">
              <a :href="url" target="_blank" style="color: black;"><v-icon><i class="fa-brands fa-spotify"></i></v-icon></a>
            </v-col>
          </v-row>
        </v-card-title>
        <v-card-text>
          <v-row class="font-weight-bold text-black">
            {{ $t('games') }}:
          </v-row>
          <v-row class="mt-4 d-block">
            <li v-for="game in games" style="list-style-type: none;">
              {{ game.title }} ({{ game.regions }}) {{ game.console }}
            </li>
          </v-row>
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <v-btn @click="showDialog = false">{{ $t('close') }}</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-card>
</template>

<script>
import {getDatabase} from "@/plugins/database.js";

export default {
  props: {
    id: Number,
    title: String,
    artist: String,
    album: String,
    released: Number,
    duration: Number,
    image_url: String,
    url: String,
    popularity: Number
  },
  data() {
    return {
      showDialog: false,
    }
  },
  computed: {
    formattedDuration() {
      if (!this.duration) {
        return null;
      }
      const minutes = Math.floor(this.duration / 60);
      const seconds = this.duration - minutes * 60;
      return minutes + ":" + String(seconds).padStart(2, '0');
    },
    games() {
      const games = [];
      const query = "SELECT gt.title, GROUP_CONCAT(DISTINCT r.name) AS regions, c.name " +
        "FROM track t " +
        "INNER JOIN track_game tg ON tg.track_id = t.id " +
        "INNER JOIN game g ON g.id = tg.game_id " +
        "INNER JOIN game_region gr ON gr.game_id = g.id " +
        "INNER JOIN region r ON gr.region_id = r.id " +
        "INNER JOIN game_title gt ON gt.id = gr.game_title_id " +
        "INNER JOIN console c ON c.id = g.console_id " +
        "WHERE t.title LIKE ? and (SUBSTR(t.artist, 1, INSTR(t.artist, ' ') - 1) LIKE ? or t.artist LIKE ?)" +
        "GROUP BY upper(gt.title)";

      const stmt = getDatabase().prepare(query);
      stmt.bind([this.title, this.artist.split(" ")[0], this.artist]);
      while(stmt.step()) {
        const json = stmt.getAsObject();
        const game = {
          title: json.title, regions: json.regions.split(",").join(", "), console: json.name
        };
        games.push(game);
      }
      return games;
    }
  }
};
</script>

<style scoped>
.card {
  position: absolute;
  width: 92%;
  max-height: 200px;

  .image {
    float: left;
    height: 100%;
    padding: 0.5em;
    max-height: 150px;
  }

  .text {
    float: left;
  }
}

.ellipsis {
  overflow: hidden;
  text-overflow: ellipsis;
  width: 100%;
  display: inline-block;
  white-space: nowrap;
}

.desktop {
  position: relative;
}
</style>
