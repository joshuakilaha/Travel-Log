import Vue from  'vue'
import Router from 'vue-router'
import Destinations from "./components/Destinations";
import LogEntries from "./components/LogEntries";


Vue.use(Router);

export default new Router({
    routes: [
        {
            path: '/',
            name: 'Destinations',
            component: Destinations
        },
        {
            path: '/LogEntries',
            name: 'LogEntries',
            component: LogEntries
        }
    ]
})
