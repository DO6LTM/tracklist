<template>
  <v-container class="fill-height">
    <Header @search="this.updateSearch" @sort="this.updateSortValue" @sortDesc="this.updateSortDesc" />
    <Grid :searchValue="searchValue" :sort="sortValue" :sortDesc="sortDesc"/>
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
      sortValue: 0,
      sortDesc: true
    };
  },
  methods: {
    updateSearch(value) {
      this.searchValue = value;
    },
    updateSortValue(value) {
      this.sortValue = value;
    },
    updateSortDesc(value) {
      this.sortDesc = value;
    }
  },
}
</script>
