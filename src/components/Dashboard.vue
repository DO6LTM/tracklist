<template>
  <v-container class="fill-height">
    <Header @search="this.updateSearch" />
    <Grid :searchValue="searchValue"/>
  </v-container>
</template>

<script>
import Header from "@/components/Header.vue";
import Grid from "@/components/Grid.vue";

export default {
  components: {Header, Grid},
  data() {
    return {
      searchValue: '',
    };
  },
  methods: {
    updateSearch(value) {
      this.searchValue = value;
    },
  },
}
</script>
