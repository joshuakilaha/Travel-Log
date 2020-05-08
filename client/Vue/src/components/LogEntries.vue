<template>
    <form
            class="pa-4 pt-6">
        <v-text-field
        v-model="logEntry.title"
        label="Title"
        >
        </v-text-field>
        <v-text-field
                v-model="logEntry.description"
                label="Description"
        >
        </v-text-field>
        <v-text-field
                v-model="logEntry.comments"
                label="comments"
        >
        </v-text-field>
        <v-text-field
                v-model="logEntry.image"
                label="ImageURL"
        >
        </v-text-field>
        <v-text-field
                v-model="logEntry.rating"
                label="Rating"
        >
        </v-text-field>
        <v-text-field
                v-model="logEntry.longitude"
                label="Longitude"
        >
        </v-text-field>
        <v-text-field
                v-model="logEntry.latitude"
                label="Latitude"
        >
        </v-text-field>

        <v-text-field
                v-model="logEntry.visitDate"
                label="Date Visited"
        >
        </v-text-field>

<!--        36.100051-->
<!--        0.259151-->
        <v-btn class="mr-4" @click="addToDB">Save</v-btn>
    </form>
</template>

<script>
    import axios from 'axios';

    export default {
        name: 'LogEntries',
        data () {
            return {
                logEntry: {title: '', description: '', comments: '', image: '', rating: '', longitude: '', latitude: '', visitDate:''},
            }
        },
        methods: {
            addToDB() {
                let newLogEntry = {
                    title: this.logEntry.title,
                    description: this.logEntry.description,
                    comments: this.logEntry.comments,
                    image: this.logEntry.image,
                    rating: this.logEntry.rating,
                    longitude: this.logEntry.longitude,
                    latitude: this.logEntry.latitude,
                    visitDate: this.logEntry.visitDate
                };

                console.log(newLogEntry);
                axios.post('http://localhost:1337/api/logs', newLogEntry)
                .then((response) => {
                    console.log(response)
                })
                .catch(function (error) {
                    console.log(error)

                })
            }
        }

    }
</script>




