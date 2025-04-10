<template>
  <v-container class="fill-height">
    <v-responsive
      class="align-centerfill-height mx-auto"
      max-width="900"
    >
      <Header />
      <Grid />
    </v-responsive>
  </v-container>
</template>

<script setup>
import Header from "@/components/Header.vue";
import Grid from "@/components/Grid.vue";
</script>
