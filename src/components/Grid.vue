<template>
  <v-container>
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
    <v-row v-else>
      <v-col v-for="card in cards" :key="card.title" cols="12">
        <CardSmall
          :id="card.id"
          :title="card.title"
          :interpret="card.interpret"
          :year="card.year"
          :length="card.length"
          :genres="card.genres"
          :games="card.games"
        />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import CardSmall from "@/components/cards/CardSmall.vue";

export default {
  components: {CardSmall},
  data() {
    return {
      cards: [
        { id: 1, title: 'Titel', interpret: 'Interpret', year: 2000, length: '4:00', genres: [1, 2, 3], games: [1, 2, 3] },
      ],
    };
  },
};
</script>
