<template>
    <div>
        <div class="sidebar">
            <div class="sidebar-wrapper">
                <div class="logo">
                    <router-link :to="{name:'home'}"
                        class="simple-text logo-normal text-center">
                        {{ $store.state.name }}
                    </router-link>
                </div>
                <ul class="nav">
                    <li v-for="route in routes" v-bind:class="{ active: $route.name === route.name }">
                        <router-link :to="{name:route.name}">
                            <i :class="'tim-icons '+route.icon"></i>
                            <p>{{ route.title }}</p>
                        </router-link>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <div class="navbar-toggle d-inline">
                            <button type="button" class="navbar-toggler">
                                <span class="navbar-toggler-bar bar1"></span>
                                <span class="navbar-toggler-bar bar2"></span>
                                <span class="navbar-toggler-bar bar3"></span>
                            </button>
                        </div>
                        <a class="navbar-brand" href="javascript:void(0)">{{ $store.state.title }}</a>
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navigation">
                        <ul class="navbar-nav ml-auto">
<!--                            <li class="search-bar input-group">-->
<!--                                <button class="btn btn-link" id="search-button" data-toggle="modal" data-target="#searchModal"><i class="tim-icons icon-zoom-split" ></i>-->
<!--                                    <span class="d-lg-none d-md-block">Search</span>-->
<!--                                </button>-->
<!--                            </li>-->
                            <li class="dropdown nav-item">
                                <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                                    <div class="photo">
                                        <img :src="$store.state.auth.getImg" alt="Profile Photo">
                                    </div>
                                    <b class="caret d-none d-lg-block d-xl-block"></b>
                                    <p class="d-lg-none">
                                        Log out
                                    </p>
                                </a>
                                <ul class="dropdown-menu dropdown-navbar">
                                    <li class="nav-link">
                                        <a href="javascript:void(0)"
                                                            v-on:click="$root.logout"
                                                            class="nav-item dropdown-item">Log out</a></li>
                                </ul>
                            </li>
                            <li class="separator d-lg-none"></li>
                        </ul>
                    </div>
                </div>
            </nav>
<!--            <div class="modal modal-search fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModal" aria-hidden="true">-->
<!--                <div class="modal-dialog" role="document">-->
<!--                    <div class="modal-content">-->
<!--                        <div class="modal-header">-->
<!--                            <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="SEARCH">-->
<!--                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">-->
<!--                                <i class="tim-icons icon-simple-remove"></i>-->
<!--                            </button>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                </div>-->
<!--            </div>-->
            <!-- End Navbar -->
            <div class="content">
                <router-view></router-view>
            </div>
            <footer class="footer">
                <div class="container-fluid">
                    <ul class="nav">
                        <li class="nav-item">
                            <a href="javascript:void(0)" class="nav-link">
                                University of The Gambia
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="javascript:void(0)" class="nav-link">
                                Students' Association
                            </a>
                        </li>
                    </ul>
                    <div class="copyright">
                        © 2020 made with <i class="tim-icons icon-heart-2"></i> by
                        <a href="javascript:void(0)" target="_blank">El Stupidos</a> for fun.
                    </div>
                </div>
            </footer>
        </div>

        <notifications group="alert" position="top center" width="30%"/>
    </div>
</template>

<script>
    export default {
        name: "App",
        data() {
            return {
                routes: [
                    {
                        name: 'home',
                        icon: 'icon-atom',
                        title: 'Home',
                    },
                    {
                        name: 'known',
                        icon: 'icon-satisfied',
                        title: 'Known Friend',
                    },
                    {
                        name: 'unknown',
                        icon: 'icon-planet',
                        title: 'Secret Friend',
                    },
                    {
                        name: 'vote',
                        icon: 'icon-shape-star',
                        title: 'Vote',
                    },
                    {
                        name: 'gossip',
                        icon: 'icon-chat-33',
                        title: 'Gossip',
                    },
                    {
                        name: 'group',
                        icon: 'icon-molecule-40',
                        title: 'Groups',//this.$store.state.auth.getGroup,
                    },
                    {
                        name: 'everyone',
                        icon: 'icon-single-02',
                        title: 'Everyone',
                    },
                ],
            }
        },
    }
</script>

<style scoped>

</style>
