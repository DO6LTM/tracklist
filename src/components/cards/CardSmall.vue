<template>
  <v-card @click="showDialog = true">
    <v-card-title>
      <v-row>
        <v-col cols="10">
          {{ title }}
        </v-col>
        <v-col cols="2" class="text-end">
          <v-icon color="grey lighten-1">mdi-information-outline</v-icon>
        </v-col>
      </v-row>
    </v-card-title>
    <v-card-subtitle>{{ interpret }}</v-card-subtitle>
    <v-card-text>
      <v-card-text>
        <v-row>
          <v-col cols="6">
            <span class="font-weight-bold">Released:</span> {{ year }}
            <v-spacer />
            <span class="font-weight-bold">Length:</span> {{ length }}
          </v-col>
          <v-col cols="6">
            <span class="font-weight-bold">Genres:</span> {{ genres.join(', ')}}
          </v-col>
        </v-row>
      </v-card-text>
    </v-card-text>
    <v-dialog v-model="showDialog" width="500">
      <v-card>
        <v-card-title>Games</v-card-title>
        <v-card-text>
          <v-list>
            <v-list-item v-for="(item, index) in games" :key="index">
              <template v-slot:prepend>
                 <v-icon style="font-size: 10px;">mdi-circle</v-icon>
              </template>
              <v-list-item-title>{{ item }}</v-list-item-title>
            </v-list-item>
          </v-list>
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <v-btn @click="showDialog = false">Close</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-card>
</template>

<script>
export default {
  props: {
    id: Number,
    title: String,
    interpret: String,
    year: Number,
    length: String,
    genres: Array,
    games: Array,
  },
  data() {
    return {
      showDialog: false,
    }
  },
};
</script>
