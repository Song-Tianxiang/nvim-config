return {
    {
        "boltlessengineer/smart-tab.nvim",
        event = "InsertEnter",
        config = function()
            require('smart-tab').setup()
        end
    },

}
