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

            <div class="card"
                 v-show="$route.params.id !== undefined">
                <div class="card-header">
                    <div class="card-title h2">
                        <i class="tim-icons icon-trophy"></i>
                        {{ categories[$route.params.id]}}
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
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card card-user">
                                <div class="card-body">
                                    <h3 class="card-text text-info font-weight-bold"># 1</h3>
                                    <div class="author">
                                        <div class="block block-three"></div>
                                        <div class="block block-four"></div>
                                        <a href="javascript:void(0)">
                                            <img class="avatar" src="/storage/profiles/default.png">
                                            <h4 class="title">Name</h4>
                                        </a>
                                        <small class="description">
                                            Gender
                                        </small>
                                    </div>
                                    <p></p>
                                    <div class="card-description">
                                        About me..
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="button-container">
                                        <button href="javascript:void(0)" class="btn btn-sm">
                                            Vote for the {{ categories[$route.params.id]}}
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
</template>

<script>
    export default {
        name: "Gossip",
        data() {
            return {
                categories: {}
            }
        },
        methods: {
            fetchData: function () {

                axios.get('vote/categories')
                    .then(res => {
                        this.categories = res.data.categories;
                    });
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
