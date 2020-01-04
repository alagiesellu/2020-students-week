import User from "./models/user";

require('./bootstrap');
require('./config');
require('./save');

import Vue from 'vue';

import Vuex from 'vuex';
Vue.use(Vuex);

import VueRouter from 'vue-router';
Vue.use(VueRouter);

import Notifications from 'vue-notification';
Vue.use(Notifications);

import VModal from 'vue-js-modal';
Vue.use(VModal);

import router from "./router";
import methods from "./methods";
import state from "./store/state";

let vue_app = {
    router: new VueRouter(router),
    store: new Vuex.Store({state}),
    methods: methods,
};

window.axios.interceptors.response.use(
    (response) => {
        console.log(response.data);
        return response;
    },
    (error) => {

        // if auth error, exit user to login page
        if (error.response.status === 401)
            vue_app.methods.logout();

        // else if abort message returned, then print error message
        else if (error.response.status === 400 && error.response.data.message)
            vue_app.methods.post_errors(JSON.parse(error.response.data.message));

        // else print system error.
        else
            vue_app.methods.post_errors([
                [error.response.statusText]
            ]);
    },
);

let token = window.Save.get('token');
if (token != null) { // if token exist

    if (window.axios.defaults.headers.common['Authorization'] == null) {

        window.axios.defaults.headers.common['Accept'] = 'application/json';
        window.axios.defaults.headers.common['Authorization'] = 'Bearer ' + token;
    }

    methods.get_configs();

    // get user to see if token still valid
    axios.get('/user')
        .then(res => {

            vue_app.store.state.auth = new User(res.data); // store user object in vue state

            window.app = new Vue(vue_app).$mount('#app');
        });
} else {
    window.app = new Vue(vue_app).$mount('#app');
}

Vue.component('laravel-vue-pagination', require('laravel-vue-pagination'));
