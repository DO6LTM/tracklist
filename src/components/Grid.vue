<template>
  <v-container class="fill-height">
    <v-row v-if="$vuetify.display.smAndUp">
      <v-col v-for="card in cards" :key="card.title" cols="4">
        <v-card>
          <v-card-title>{{ card.title }}</v-card-title>
          <v-card-text>{{ card.year }}</v-card-text>
          <v-card-actions>
            <v-btn>More</v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
    <v-row style="align-self: start;" v-else>
      <v-col v-for="card in cards" :key="card.id" cols="12">
        <CardSmall
          :id="card.id"
          :title="card.title"
          :interpret="card.interpret"
          :year="card.year"
          :genres="card.genres"
          :games="card.games"
        />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import CardSmall from "@/components/cards/CardSmall.vue";
import { getDatabase } from "@/plugins/database.js";

export default {
  components: {CardSmall},
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

      const query = "SELECT DISTINCT t.id, t.title, t.interpret, t.year, c.name as console, g.name as game, GROUP_CONCAT(r.name) AS regions " +
        "FROM track t " +
        "INNER JOIN track_game tg ON t.id = tg.track_id " +
        "INNER JOIN game g ON g.id = tg.game_id " +
        "INNER JOIN region r ON r.id = tg.region_id " +
        "INNER JOIN console c ON c.id = g.console_id " +
        "WHERE t.title LIKE ? or t.interpret LIKE ? or CAST(t.year as TEXT) = ? or g.name LIKE ? " +
        "GROUP BY t.id " +
        "ORDER BY t.interpret, t.title";

      const stmt = getDatabase().prepare(query);
      stmt.bind([wildcardSearch, wildcardSearch, search, wildcardSearch]);
      while(stmt.step()) {
        const json = stmt.getAsObject();

        let card = {
          id: json.id, title: json.title, interpret: json.interpret, year: json.year, games: `${json.game} (${json.console}; ${json.regions})`, genres: []
        };

        this.cards.push(card);
      }

      stmt.free();
    }
  }
};
</script>
