<template>
    <div class="row" v-if="friend.isNull">
        <div class="col-md-6">
            <div class="card card-user">
                <div class="card-body" v-if="!$store.state.auth.isNull">
                    <p class="card-text">
                    </p><div class="author">
                    <div class="block block-one"></div>
                    <div class="block block-two"></div>
                    <div class="block block-three"></div>
                    <div class="block block-four"></div>
                    <a href="javascript:void(0)">
                        <img class="avatar" src="/storage/profiles/default.png">
                        <h3 class="title">Friend Not Assigned</h3>
                    </a>
                </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row" v-else>
        <div class="col-md-4">
            <div class="card card-user">
                <div class="card-body" v-if="!friend.isNull">
                    <p class="card-text">
                    </p><div class="author">
                    <div class="block block-one"></div>
                    <div class="block block-two"></div>
                    <div class="block block-three"></div>
                    <div class="block block-four"></div>
                    <a href="javascript:void(0)">
                        <img class="avatar" :src="friend.getImg">
                        <h4 class="title">{{ friend.name }}</h4>
                    </a>
                    <p class="description">
                        {{ friend.getGroup }}
                    </p>
                    <small class="description">
                        {{ friend.getGender }}
                    </small>
                </div>
                    <p></p>
                    <div class="card-description">
                        {{ friend.about }}
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">
                        <i class="tim-icons icon-chat-33"></i>
                        Messages
                    </h4>
                </div>
                <div class="card-body row">

                    <form class="form col-12" v-on:submit="submitForm">
                        <div class="form-group">
                            <textarea rows="4" cols="80" class="form-control" maxlength="500" v-model="message" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-fill btn-primary pull-right">
                            <i class="tim-icons icon-send"></i> Send
                        </button>
                    </form>
                    <div class="col-12">
                        <br>
                        <div v-for="message in messages.data" class="alert"
                             v-bind:class="[ message.user_id === $store.state.auth.id ? 'alert-primary':'alert-info']">
                            <span>{{ message.message }}</span>
                            <small class="pull-right">{{ message.created_at }}</small>
                        </div>
                        <laravel-vue-pagination
                            :limit="5"
                            :data="messages"
                            align="center"
                            @pagination-change-page="getMessages">
                        </laravel-vue-pagination>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import User from "../models/user";

    export default {
        name: "Known",
        data() {
            return {
                friend: new User({}),
                messages: {},
                message: null,
            }
        },
        mounted() {
            this.$store.state.title = 'Known Friend';
            this.fetchData();
        },
        methods: {
            submitForm: function (e) {
                e.preventDefault();

                axios.post('known/messages/post', {
                    message: this.message,
                })
                .then(res => {
                    this.messages = res.data.messages;
                    this.message = null;
                });
            },
            fetchData: function () {

                axios.get('known')
                .then(res => {
                    this.friend = new User(res.data.friend);
                });

                this.getMessages();
            },
            getMessages: function (page = 1) {

                axios.get('known/messages/get?page='+page)
                .then(res => {
                    this.messages = res.data.messages;
                });
            }
        },
    }
</script>

<style scoped>

</style>
