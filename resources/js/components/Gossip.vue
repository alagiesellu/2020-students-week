<template>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="card-title">
                        <button
                            data-toggle="modal" data-target="#searchGossipModal"
                            class="btn btn-sm btn-primary">
                            Gossip
                        </button>
                        <div class="modal modal-search fade" id="searchGossipModal" tabindex="-1" role="dialog" aria-labelledby="searchModal" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <input type="text" class="form-control"
                                               v-on:change="searchPerson"
                                               v-model="search.input"
                                               placeholder="Search for the person you want to gossip for...">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i class="tim-icons icon-simple-remove"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row" v-if="users.data">
                        <div class="col-md-4" v-for="user in users.data">
                            <div class="card card-user">
                                <div class="card-body">
                                    <div class="author">
                                        <div class="block block-three"></div>
                                        <div class="block block-four"></div>
                                        <a href="javascript:void(0)">
                                            <img class="avatar" :src="'/storage/'+user.img">
                                            <h4 class="title">{{ user.name }}</h4>
                                        </a>
                                        <small class="description">
                                            {{ user.gender == 'm' ? 'Male':'Female' }}
                                        </small>
                                    </div>
                                    <p></p>
                                    <div class="card-description">
                                        {{ user.about }}
                                    </div>
                                    <button
                                        data-toggle="modal" v-on:click="writeGossip(user)" data-target="#gossipModal"
                                        class="btn btn-sm btn-primary">
                                        Gossip
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="modal modal-search fade" id="gossipModal" tabindex="-1" role="dialog" aria-labelledby="searchModal" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <input type="text" class="form-control"
                                               v-if="gossip.user"
                                               v-on:change="submitGossip"
                                               v-model="gossip.message"
                                               :placeholder="'Gossip '+gossip.user.name">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <i class="tim-icons icon-simple-remove"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <laravel-vue-pagination
                                :data="users"
                                :limit="5"
                                align="center"
                                @pagination-change-page="searchPerson">
                            </laravel-vue-pagination>
                        </div>
                    </div>
                    <div v-for="gossip in gossips.data"
                         class="alert alert-primary alert-with-icon" data-notify="container">
                        <span data-notify="icon">
                            <img class="avatar" :src="'/storage/'+gossip.to_user.img">
                        </span>
                        <b>
                            {{ gossip.to_user.name }}
                        </b>
                        <i class="tim-icons icon-double-left"></i>
                        {{ gossip.message }}

                        <div class="pull-right button-container">
                            <button
                                v-show="gossip.from_user_id === $store.state.auth.id"
                                v-on:click="deleteGossip(gossip)"
                                class="btn btn-sm btn-outline-danger">
                                Delete
                            </button>
                            <button
                                v-show="gossip.likes.indexOf($store.state.auth.id) === -1"
                                v-on:click="likeGossip(gossip)" class="btn btn-icon btn-sm btn-round btn-success">
                                <i class="tim-icons icon-check-2"></i>
                            </button>
                            <button class="btn btn-icon btn-sm btn-round btn-default">
                                {{ gossip.score }}
                            </button>
                            <button
                                v-show="gossip.dislikes.indexOf($store.state.auth.id) === -1"
                                v-on:click="dislikeGossip(gossip)" class="btn btn-icon btn-sm btn-round btn-danger">
                                <i class="tim-icons icon-simple-remove"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <laravel-vue-pagination
                        :data="gossips"
                        :limit="5"
                        align="center"
                        @pagination-change-page="get_gossips">
                    </laravel-vue-pagination>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Gossip",
        data() {
            return {
                gossips: {},
                users: {},
                search: {
                    input: null,
                },
                gossip: {
                    user: null,
                    message: null,
                }
            }
        },
        methods: {
            submitGossip: function (e) {
                e.preventDefault();

                axios.post('gossips', {
                    message: this.gossip.message,
                    user: this.gossip.user.id,
                })
                    .then(res => {
                        this.$root.post_success(res.data.success);
                        this.get_gossips(this.gossips.last_page);
                    });
            },
            writeGossip: function (user) {
                this.gossip.user = user;
            },
            searchPerson: function (page = 1) {
                // load categories
                axios.post('everyone/search?page='+page, this.search)
                    .then(res => {
                        this.users = res.data.users;
                    });
            },
            deleteGossip: function(gossip) {
                axios.post('gossips/delete/'+gossip.id)
                    .then(res => {
                        this.$root.post_success(res.data.success);
                        this.get_gossips();
                    });
            },
            likeGossip: function(gossip) {
                if (gossip.likes.indexOf(this.$store.state.auth.id) !== -1)
                    this.$root.post_errors([['Gossip already liked.']]);

                else
                    axios.post('gossips/like/'+gossip.id)
                        .then(res => {
                            this.$root.post_success(res.data.success);
                            this.get_gossips(this.gossips.current_page);
                        });
            },
            dislikeGossip: function(gossip) {
                if (gossip.dislikes.indexOf(this.$store.state.auth.id) !== -1)
                    this.$root.post_errors([['Gossip already disliked.']]);

                else
                    axios.post('gossips/dislike/'+gossip.id)
                        .then(res => {
                            this.$root.post_success(res.data.success);
                            this.get_gossips(this.gossips.current_page);
                        });
            },
            get_gossips: function(page = 1) {

                axios.get('gossips?page='+page)
                    .then(res => {
                        this.gossips = res.data.gossips;
                    });
            },
            fetchData: function () {

                this.get_gossips();
            },
        },
        mounted() {
            this.fetchData();
            this.$store.state.title = 'Gossips';
        }
    }
</script>

<style scoped>

</style>
