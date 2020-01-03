import Login from "./components/Login";
import App from "./components/App";
import Home from "./components/Home";
import Known from "./components/Known";
import Unknown from "./components/Unknown";
import Vote from "./components/Vote";
import Gossip from "./components/Gossip";
import Group from "./components/Group";
import Everyone from "./components/Everyone";

export default {
    routes: [
        {
            beforeEnter: (to, from, next) => {
                if (window.Save.get('token') == null) next();
                else next({name:'home'});
            },
            path: '/',
            component: Login,
            name: 'login',
        },
        {
            beforeEnter: (to, from, next) => {
                if (window.Save.get('token')) next();
                else next({name:'login'});
            },
            path: '/home',
            component: App,
            children: [
                {
                    path: '',
                    component: Home,
                    name: 'home',
                },
                {
                    path: 'known',
                    component: Known,
                    name: 'known',
                },
                {
                    path: 'unknown',
                    component: Unknown,
                    name: 'unknown',
                },
                {
                    path: 'group/:id?',
                    component: Group,
                    name: 'group',
                },
                {
                    path: 'vote/:id?',
                    component: Vote,
                    name: 'vote',
                },
                {
                    path: 'gossip',
                    component: Gossip,
                    name: 'gossip',
                },
                {
                    path: 'everyone',
                    component: Everyone,
                    name: 'everyone',
                },
                {
                    path: 'profile',
                    component: Home,
                    name: 'profile',
                },
            ],
        },
    ],
    mode: 'history',
    linkActiveClass: 'active',
};
