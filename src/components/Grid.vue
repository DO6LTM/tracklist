<template>
  <v-container class="fill-height">
    <v-row v-if="$vuetify.display.smAndUp">
      <v-col v-for="card in cards" :key="card.id" cols="4">
        <v-lazy :min-height="500" :options="{'threshold':0.1}" transition="fade-transition">
          <Card
            :id="card.id"
            :title="card.title"
            :artist="card.artist"
            :album="card.album"
            :released="card.released"
            :duration="card.duration"
            :image_url="card.image_url"
            :url="card.url"
            :popularity="card.popularity"
          />
        </v-lazy>
      </v-col>
    </v-row>
    <v-row style="align-self: start; display: flex; flex-direction: column; align-items: flex-start; max-width: 90%" v-else>
      <v-col v-for="card in cards" :key="card.id" cols="1" style="padding: 0;">
        <v-lazy :min-height="200" :options="{'threshold':0.1}" transition="fade-transition">
          <Card
            :id="card.id"
            :title="card.title"
            :artist="card.artist"
            :album="card.album"
            :released="card.released"
            :duration="card.duration"
            :image_url="card.image_url"
            :url="card.url"
            :popularity="card.popularity"
          />
        </v-lazy>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import Card from "@/components/Card.vue";
import { getDatabase } from "@/plugins/database.js";

export default {
  components: {Card},
  data() {
    return {
      cards: [],
    };
  },
  props: {
    searchValue: String,
  },
  watch: {
    searchValue(newValue, oldValue) {
      if (newValue !== oldValue) {
        this.updateCards(newValue);
        window.scrollTo({ top: 0, behavior: "smooth" });
      }
    }
  },
  mounted() {
    this.updateCards("");
  },
  methods: {
    updateCards(search) {
      this.cards = [];

      search = search.trim();
      const wildcardSearch = "%" + search + "%";

      const query = "SELECT DISTINCT t.id, t.title, t.artist, t.album, t.released, t.duration, t.image_url, t.url, t.popularity " +
        "FROM track t " +
        "INNER JOIN track_game tg ON tg.track_id = t.id " +
        "INNER JOIN game g ON g.id = tg.game_id " +
        "INNER JOIN game_region gr ON gr.game_id = g.id " +
        "INNER JOIN game_title gt ON gt.id = gr.game_title_id " +
        "WHERE t.title LIKE ? or t.artist LIKE ? or t.album LIKE ? or CAST(t.released as TEXT) = ? or gt.title LIKE ? " +
        "GROUP BY t.artist, t.title " +
        "ORDER BY t.popularity DESC, t.artist ASC, t.title ASC";

      const stmt = getDatabase().prepare(query);
      stmt.bind([wildcardSearch, wildcardSearch, wildcardSearch, search, wildcardSearch]);
      while(stmt.step()) {
        const json = stmt.getAsObject();

        const card = {
          id: json.id, title: json.title, artist: json.artist, album: json.album, released: json.released, duration: json.duration, image_url: json.image_url, url: json.url, popularity: json.popularity
        };

        this.cards.push(card);
      }

      stmt.free();
    }
  }
};
</script>
