<template>
  <v-row>
    <v-col cols="6" sm="12" offset-sm="0">

      <v-card>
        <v-container fluid>
          <v-row>
            <v-col
                    v-for="log of logEntry"
                    :key="log._id"
                    class="d-flex child-flex"
                    cols="4"
            >


      <v-layout row wrap justify-space-around class="mt-2">
        <v-flex xs10 class="align-content-center">
          <v-layout v-if="logEntry && logEntry.length">
<!--            <v-list-item v-for="log of logEntry" :key="log._id">-->
              <v-spacer>
                <v-card  max-height="350" max-width="350" >

                  <v-img :src="log.image" height="200px"> </v-img>
                  <v-card-title> {{log.title}} </v-card-title>
                  <v-card-subtitle> {{log.description}} </v-card-subtitle>
                  <v-card-text class="font-italic"> {{log.comments}} </v-card-text>

                </v-card>
              </v-spacer>
<!--            </v-list-item>-->
          </v-layout>
        </v-flex>
      </v-layout>
            </v-col>
          </v-row>
        </v-container>
      </v-card>
    </v-col>
  </v-row>
</template>


<script>
  import axios from 'axios'
  export default {
    name: 'Destinations',
    data () {
      return {
        logEntry: [],
      }
    },
    mounted() {

      axios.get('http://localhost:1337/api/logs')

              .then(response => {
                (this.logEntry = response.data);
                console.log(response.data._id);
              })
    }
  }
</script>


