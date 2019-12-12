import User from "./models/user";

export default {

    get_configs: function() {

        axios.get('get/configs')
            .then(res => {
                window.groups = res.data.groups;
            });
    },
    logout: function() {

        window.Save.clear();
        window.location.href = "/";
    },
    post_errors: function(errors = []) {
        let errors_list = '';
        for (let ei in errors)
            for (let i in errors[ei])
                errors_list += '<li>'+errors[ei][i]+'</li>';

        window.app.$notify({
            group: 'alert',
            title: 'Errors..!',
            text: errors_list,
            type: 'error',
            duration: 10000,
            speed: 1000,
        });
    },
    post_success: function(message) {
        window.app.$notify({
            group: 'alert',
            title: 'Successful..!',
            text: message,
            type: 'success',
            duration: 10000,
            speed: 1000,
        });
    },
};
