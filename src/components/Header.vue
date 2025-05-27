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
  </v-app-bar>
</template>

<script>
  export default {
    data() {
      return {
        searchValue: ''
      };
    },
  };
</script>
