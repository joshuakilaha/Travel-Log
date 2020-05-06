<template>

      <v-layout row wrap justify-space-around class="mt-2">
        <v-flex xs10 class="align-content-center">
          <v-layout v-if="logEntry && logEntry.length">
            <v-list-item v-for="log of logEntry" :key="log._id">
              <v-spacer>
                <v-card class="mx-auto" max-width="300" >

                  <v-img :src="log.image" height="200px"> </v-img>
                  <v-card-title> {{log.title}} </v-card-title>
                  <v-card-subtitle> {{log.description}} </v-card-subtitle>
                  <v-card-text class="font-italic"> {{log.comments}} </v-card-text>

                </v-card>
              </v-spacer>
            </v-list-item>
          </v-layout>
        </v-flex>
      </v-layout>
</template>


<script>
  import axios from 'axios'
  export default {
    name: 'HelloWorld',
    data () {
      return {
       // logEntry: [],
      //  message: 'heeey',
       // Post: [],
        logEntry: [],
      }
    },
    mounted() {

      axios.get('http://localhost:1337/api/logs')
            //   .then((response) => {
            //     console.log(response.data);
            //
            //
            //     this.Post = response.data;
            //     console.log(response.Post.id)
            // //   this.logEntry = response.data;
            //   //  console.log(response.logEntry.title);
            //    // this.message = response.data;
            //
            //   })
              .then(response => {
                (this.logEntry = response.data);
                console.log(response.data._id);
              })
              // .catch(function (error) {
              //   console.log(error)
              // })
    }
  }
</script>
<style>
  .title{
    padding-left: 20px;
  }
</style>

