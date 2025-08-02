<template>
  <v-app-bar :elevation="2" rounded>
    <v-app-bar-title class="d-none d-sm-flex">{{ $t('title') }}</v-app-bar-title>
    <v-spacer class="d-none d-sm-flex"/>
    <v-text-field
      class="mx-4"
      :label="$t('search')"
      v-model="searchValue"
      @input="$emit('search', searchValue)"
      prepend-inner-icon="mdi-magnify"
      variant="solo-filled"
      hide-details
      clearable
      @click:clear="$emit('search', '')"
    />
    <v-spacer class="d-none d-sm-flex" />
    <v-menu activator="parent">
      <template v-slot:activator="{ props }">
        <v-btn style="height: 95%;" v-bind="props"><i class="fa-solid fa-filter" style="font-size: 1.2em;"></i></v-btn>
      </template>

      <v-list>
        <v-list-item>
          <v-list-item-title>{{ $t("sort") }}</v-list-item-title>
          <template v-slot:append>
            <v-icon icon="mdi-menu-right" size="x-small"></v-icon>
          </template>

          <v-menu :open-on-focus="false" activator="parent" submenu>
            <v-list class="pa-0">
              <v-btn-toggle v-model="sortValue" color="primary" mandatory>
                <v-btn v-for="(value, index) in sort" class="ma-0 pt-2 pb-2" :value="index" @click="changeOrder">
                  {{ $t(sort[index]["label"]) }}
                  <v-label class="text-body-2"> - </v-label>
                  <v-label class="text-body-2" v-if="sort[index]['desc']"> {{ $t("desc") }}&#9662;</v-label>
                  <v-label class="text-body-2" v-else> {{ $t("asc") }}&#9652;</v-label>
                </v-btn>
              </v-btn-toggle>
            </v-list>
          </v-menu>
        </v-list-item>
      </v-list>
    </v-menu>
  </v-app-bar>
</template>

<script>
  export default {
    data() {
      return {
        searchValue: "",
        sortValue: 0,
        lastSortValue: 0,
        sort: [
          { key: "popularity", label: "popularity", desc: true},
          { key: "title", label: "titleLabel", desc: false},
          { key: "artist", label: "artist", desc: false},
          { key: "year", label: "year", desc: true}
        ]
      };
    },
    methods: {
      changeOrder() {
        if (this.lastSortValue === this.sortValue) {
          this.sort[this.sortValue]['desc'] = !this.sort[this.sortValue]['desc'];
        }
        this.lastSortValue = this.sortValue;
        this.$emit("sort", this.sortValue);
        this.$emit("sortDesc", this.sort[this.sortValue]['desc']);
      }
    }
  };
</script>

<style scoped>
.v-btn-toggle {
  display: flex;
  flex-direction: column;
  height: 100% !important;
}
</style>
