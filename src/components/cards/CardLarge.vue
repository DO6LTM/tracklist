<template>
  <v-card>
    <v-card-title>{{ title }} - <v-label color="grey lighten-1" class="text-subtitle-1" style="display: inline">{{ interpret }}</v-label></v-card-title>
    <v-card-text>{{ year }}</v-card-text>
    <v-card-actions>
      <v-btn @click="showDialog = true">{{ $t('more') }}</v-btn>
    </v-card-actions>
    <v-dialog v-model="showDialog" width="500">
      <v-card>
        <v-card-title>
          <v-label class="font-weight-bold text-black">{{ title }}</v-label> - <v-label color="grey lighten-1">{{ interpret }}</v-label>
        </v-card-title>
        <v-card-text>
          <v-row class="font-weight-bold text-black">
            {{ $t('games') }}:
          </v-row>
          <v-row class="mt-4">
            {{ games }}
          </v-row>
          <v-row>
            <iframe class="mt-8" width="100%" height="auto" :src="url" frameborder="0" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
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
export default {
  props: {
    id: Number,
    title: String,
    interpret: String,
    year: Number,
    genres: Array,
    games: String,
    url: String,
  },
  data() {
    return {
      showDialog: false,
    }
  },
};
</script>
