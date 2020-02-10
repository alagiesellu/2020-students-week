window.Save = {

    get: function(key)
    {
        return localStorage.getItem(key);
    },

    store: function(key, data)
    {
        localStorage.setItem(key, data);
        // sessionStorage.setItem(key, data);
    },

    clear: function()
    {
        localStorage.clear();
        // sessionStorage.clear();
    },
};
