<template>
    <div class="row">
        <div class="col-md-12">
            <div class="card"
                 v-show="$route.params.id === undefined">
                <div class="card-header"></div>
                <div class="card-body">
                    <div v-for="key in Object.keys(groups)"
                         class="alert alert-info alert-with-icon" data-notify="container">
                        <span data-notify="icon" class="tim-icons icon-molecule-40"></span>
                        <router-link :to="{name:'group', params:{id:key}}"
                                     class="text-white font-weight-bold text-underline h4"
                            data-notify="message">
                            {{ groups[key] }}
                        </router-link>
                    </div>
                </div>
            </div>

            <div
                v-show="$route.params.id !== undefined">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title h2">
                            <i class="tim-icons icon-molecule-40"></i>
                            {{ groups[$route.params.id]}}
                            <div class="pull-right">
                                <router-link
                                    :to="{name:'group'}"
                                    class="btn btn-sm">
                                    Back To List
                                </router-link>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
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
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <laravel-vue-pagination
                                    :data="users"
                                    :limit="5"
                                    align="center"
                                    @pagination-change-page="getUsers">
                                </laravel-vue-pagination>
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
        name: "Group",
        data() {
            return {
                groups: {},
                users: {},
            }
        },
        watch: {
            '$route': 'fetchData',
        },
        methods: {
            getUsers: function (page = 1) {
                // load groups
                axios.get('group/'+this.$route.params.id+'?page='+page)
                    .then(res => {
                        this.users = res.data.users;
                    });
            },
            fetchData: function () {
                if (this.$route.params.id)
                {
                    this.getUsers()
                }
            },
        },
        mounted() {
            this.fetchData();
            this.$store.state.title = 'Groups';

            // load groups
            axios.get('group')
                .then(res => {
                    this.groups = res.data.groups;
                });
        }
    }
</script>

<style scoped>

</style>
