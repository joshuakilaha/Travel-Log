<template>
  <v-app>
    <v-app-bar
      app
      color="secondary"
      dark
    >

      <div class="d-flex align-center">
        <v-img
          alt="Vuetify Logo"
          class="shrink mr-2"
          contain
          src="https://cdn.vuetifyjs.com/images/logos/vuetify-logo-dark.png"
          transition="scale-transition"
          width="40"
        />

        <v-card-text class="text-uppercase"><router-link to="/">Destinations</router-link></v-card-text>
      </div>

      <v-spacer></v-spacer>
      <v-btn><router-link to="/LogEntries">Add</router-link></v-btn>
    </v-app-bar>

    <v-content>
      <router-view to="/"></router-view>
    </v-content>
  </v-app>
</template>

<script>


export default {
  name: 'App',

  components: {

  },

  data: () => ({
    //
  }),
};
</script>
