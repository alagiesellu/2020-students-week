<template>
    <div class="row">
        <div class="col-md-12">
            <div class="card"
                 v-show="$route.params.id === undefined">
                <div class="card-header"></div>
                <div class="card-body">
                    <div v-for="key in Object.keys(categories)"
                         class="alert alert-info alert-with-icon" data-notify="container">
                        <span data-notify="icon" class="tim-icons icon-trophy"></span>
                        <router-link :to="{name:'vote', params:{id:key}}"
                                     class="text-white font-weight-bold text-underline h4"
                            data-notify="message">
                            {{ categories[key] }}
                        </router-link>
                    </div>
                </div>
            </div>

            <div
                v-show="$route.params.id !== undefined">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title h2">
                            <i class="tim-icons icon-trophy"></i>
                            {{ categories[$route.params.id]}}
                            <button
                                data-toggle="modal" data-target="#searchVoteModal"
                                class="btn btn-sm btn-primary">
                                Vote
                            </button>
                            <div class="modal modal-search fade" id="searchVoteModal" tabindex="-1" role="dialog" aria-labelledby="searchModal" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <input type="text" class="form-control"
                                                   v-on:change="searchPerson"
                                                   v-model="search.input"
                                                   placeholder="Search for the person you want to vote for...">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <i class="tim-icons icon-simple-remove"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="pull-right">
                                <router-link
                                    :to="{name:'vote'}"
                                    class="btn btn-sm">
                                    Back To List
                                </router-link>
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
                                            v-on:click="submitVote(user.id)"
                                            class="btn btn-block btn-success">
                                            Vote for {{ user.name }}
                                        </button>
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
                        <div v-else>
                            <div class="row" v-if="votes.data">
                                <div class="col-md-4" v-for="key in Object.keys(votes.data)">
                                    <div class="card card-user">
                                        <div class="card-body">
                                            <h3 class="card-text text-info font-weight-bold">
                                                # {{ key * 1 + 1}}
                                                <span class="badge badge-info">{{ votes.data[key].count }} Votes</span>
                                            </h3>
                                            <div class="author">
                                                <div class="block block-three"></div>
                                                <div class="block block-four"></div>
                                                <a href="javascript:void(0)">
                                                    <img class="avatar" :src="'/storage/'+votes.data[key].candidate.img">
                                                    <h4 class="title">{{ votes.data[key].candidate.name }}</h4>
                                                </a>
                                                <small class="description">
                                                    {{ votes.data[key].candidate.gender == 'm' ? 'Male':'Female' }}
                                                </small>
                                            </div>
                                            <p></p>
                                            <div class="card-description">
                                                {{ votes.data[key].candidate.about }}
                                            </div>
                                            <button
                                                v-on:click="submitVote(votes.data[key].candidate.id)"
                                                class="btn btn-block btn-success">
                                                Vote for {{ votes.data[key].candidate.name }}
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</template>

<script>
    export default {
        name: "Vote",
        data() {
            return {
                categories: {},
                votes: {},
                users: {},
                search: {
                    input: null,
                },
            }
        },
        watch: {
            '$route': 'fetchData',
        },
        methods: {
            submitVote: function (user_id) {
                axios.post('vote', {
                    user: user_id,
                    category: this.$route.params.id,
                })
                .then(res => {
                    this.$root.post_success([[res.data.success]]);
                    this.fetchData();
                    this.users = {};
                })
            },
            searchPerson: function (page = 1) {
                // load categories
                axios.post('everyone/search?page='+page, this.search)
                    .then(res => {
                        this.users = res.data.users;
                    });
            },
            fetchData: function () {
                if (this.$route.params.id)
                {
                    // load categories
                    axios.get('vote/categories/'+this.$route.params.id)
                        .then(res => {
                            this.votes = res.data.votes;
                        });
                }
            },
        },
        mounted() {
            this.fetchData();
            this.$store.state.title = 'Votes';

            // load categories
            axios.get('vote/categories')
                .then(res => {
                    this.categories = res.data.categories;
                });
        }
    }
</script>

<style scoped>

</style>
