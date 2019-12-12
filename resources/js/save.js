window.Save = {

    get: function(key)
    {
        return sessionStorage.getItem(key);
    },

    store: function(key, data)
    {
        sessionStorage.setItem(key, data);
    },

    clear: function()
    {
        sessionStorage.clear();
    },
};
