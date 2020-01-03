<template>
    <div class="row">
        <div class="col-md-6">
            <div class="card card-user">
                <div class="card-header">
                    <div class="card-title">
                        <div class="pull-left text-uppercase h4 text-white">My Profile</div>
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
                    <div class="button-container pull-right">
                        <a href="#edit" v-on:click="editProfile('pic')" class="btn btn-link">
                            Picture
                        </a>
                        <a v-on:click="editProfile('about')" href="#edit" class="btn btn-link">
                            About
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6" id="edit">
            <form v-on:submit="submitEdit" class="card" v-show="edit.prop">
                <div class="card-header">
                    <h4 class="card-title">
                        <i class="tim-icons icon-pencil"></i>
                        Edit
                    </h4>
                </div>
                <div class="card-body row">
                    <div class="col-12">
                        <div v-show="edit.prop === 'pic'">
                            <input
                                placeholder="Select profile picture.."
                                type="file" accept="image/*"
                                v-on:change="uploadImage">
                            <hr>
                            <img :src="edit.form.previewImage" class="uploading-image" />
                        </div>
                        <div v-show="edit.prop === 'about'">
                            <div class="form-group">
                                <textarea v-model="edit.form.about" rows="4" cols="80" class="form-control" placeholder="Here can be your description"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <button type="submit" class="btn btn-fill btn-primary">Save</button>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
    import User from "../models/user";

    export default {
        name: "Home",
        data() {
            return {
                me: {},
                edit: {
                    prop: null,
                    form: {
                        previewImage: null,
                        about: null,
                    },
                }
            }
        },
        methods: {
            uploadImage: function (e){
                const image = e.target.files[0];
                const reader = new FileReader();
                reader.readAsDataURL(image);
                reader.onload = e =>{
                    this.edit.form.previewImage = e.target.result;
                    axios.post('me/upload', {
                        pic: this.edit.form.previewImage
                    })
                    .then(res => {
                        location.reload();
                    });
                };
            },
            editProfile: function(prop) {
                this.edit.prop = prop;

                if (prop === 'about')
                    this.edit.form.about = this.$store.state.auth.about;
            },
            submitEdit: function (e) {
                e.preventDefault();
                axios.post('me/edit', {
                    about: this.edit.form.about
                })
                    .then(res => {
                        this.$root.post_success(res.data.success);
                        this.$store.state.auth = new User(res.data.user); // store user object in vue state
                        this.edit.prop = null;
                    });
            },
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
    .uploading-image{
        display:flex;
    }
</style>
