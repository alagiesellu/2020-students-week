<template>
    <div class="row">
        <div class="col-md-6">
            <div class="card card-user">
                <div class="card-header">
                    <div class="card-title">
                        <div class="pull-left text-uppercase h4 text-white">My Profile</div>
                        <div class="button-container pull-right">
                            <button href="javascript:void(0)" class="btn btn-sm">
                                Picture
                            </button>
                            <button href="javascript:void(0)" class="btn btn-sm">
                                About
                            </button>
                        </div>
                    </div>
                </div>
                <div class="card-body" v-if="!$store.state.auth.isNull">
                    <p class="card-text">
                    </p><div class="author">
                    <div class="block block-one"></div>
                    <div class="block block-two"></div>
                    <div class="block block-three"></div>
                    <div class="block block-four"></div>
                    <a href="javascript:void(0)">
                        <img class="avatar" :src="$store.state.auth.getImg">
                        <h3 class="title">{{ $store.state.auth.name }}</h3>
                    </a>
                    <p class="description">
                        {{ $store.state.auth.getGroup }}
                    </p>
                    <small class="description">
                        {{ $store.state.auth.getGender }}
                    </small>
                </div>
                    <p></p>
                    <div class="card-description">
                        {{ $store.state.auth.about }}
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">
                        <i class="tim-icons icon-bell-55"></i>
                        Notifications
                    </h4>
                </div>
                <div class="card-body">
                    <div class="alert alert-primary">
                        <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                            <i class="tim-icons icon-simple-remove"></i>
                        </button>
                        <span><b> Primary - </b> This is a regular notification made with ".alert-primary"</span>
                    </div>
                    <div class="alert alert-info">
                        <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                            <i class="tim-icons icon-simple-remove"></i>
                        </button>
                        <span><b> Info - </b> This is a regular notification made with ".alert-info"</span>
                    </div>
                    <div class="alert alert-success">
                        <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                            <i class="tim-icons icon-simple-remove"></i>
                        </button>
                        <span><b> Success - </b> This is a regular notification made with ".alert-success"</span>
                    </div>
                    <div class="alert alert-warning">
                        <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                            <i class="tim-icons icon-simple-remove"></i>
                        </button>
                        <span><b> Warning - </b> This is a regular notification made with ".alert-warning"</span>
                    </div>
                    <div class="alert alert-danger">
                        <button type="button" aria-hidden="true" class="close" data-dismiss="alert" aria-label="Close">
                            <i class="tim-icons icon-simple-remove"></i>
                        </button>
                        <span><b> Danger - </b> This is a regular notification made with ".alert-danger"</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Home",
        data() {
            return {
                me: {}
            }
        },
        methods: {
            fetchData: function () {

                axios.get('me')
                    .then(res => {
                        this.me = res.data.me;
                    });
            },
        },
        mounted() {
            this.fetchData();
            this.$store.state.title = 'Home';
        }
    }
</script>

<style scoped>

</style>
