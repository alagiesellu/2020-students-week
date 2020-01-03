<template>
    <div class="row">
        <div class="col-md-12">
            <div>
                <div class="card">
                    <div class="card-header">
                        <div class="card-title h2">
                            <i class="tim-icons icon-single-02"></i>
                            Everyone
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
        name: "Everyone",
        data() {
            return {
                users: {},
            }
        },
        watch: {
            '$route': 'fetchData',
        },
        methods: {
            getUsers: function (page = 1) {
                // load groups
                axios.get('everyone?page='+page)
                    .then(res => {
                        this.users = res.data.users;
                    });
            },
        },
        mounted() {
            this.$store.state.title = 'Everyone';

            this.getUsers();
        }
    }
</script>

<style scoped>

</style>
