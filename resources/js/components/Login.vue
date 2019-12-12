<template>
    <div class="wrapper-full-page" style="margin-top:5%;">
        <div class="full-page login-page ">
            <!--   you can change the color of the filter page using: data-color="blue | purple | green | orange | red | rose " -->
            <div class="content">
                <div class="container">
                    <div class="col-lg-4 col-md-6 ml-auto mr-auto">
                        <form class="form" v-on:submit="submitForm">
                            <div class="card card-login card-white">
                                <div class="card-header">
                                    <img src="/black/assets/img/card-primary.png" alt="">
                                    <h2 class="card-title">{{$store.state.title}}</h2>
                                </div>
                                <div class="card-body">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <i class="tim-icons icon-email-85"></i>
                                            </div>
                                        </div>
                                        <input type="text" required v-model="input.username" class="form-control" placeholder="Username">
                                    </div>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <i class="tim-icons icon-lock-circle"></i>
                                            </div>
                                        </div>
                                        <input type="password" required v-model="input.password" placeholder="Password" class="form-control">
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary btn-lg btn-block mb-3">Login</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <notifications group="alert" position="top center" width="30%"/>
    </div>
</template>

<script>
    export default {
        name: "Login",
        data() {
            return {
                input: {
                    username: null,
                    password: null,
                },
                errors: [],
            }
        },
        methods: {
            submitForm: function (e) {
                e.preventDefault();

                axios.post('login', this.input)
                .then(res => {
                    if (res.data.errors)
                        this.$root.post_errors(res.data.errors);
                    else {
                        window.Save.store('token', res.data);
                        window.location.href = "/home";
                    }
                });
            }
        }
    }
</script>

<style scoped>

</style>
