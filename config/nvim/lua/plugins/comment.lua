return {
    -- comment code
    "numToStr/Comment.nvim",
    opts = {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim")
            .create_pre_hook()
    },
    dependencies = {
        -- fix commenting in jsx,tsx files
        "JoosepAlviste/nvim-ts-context-commentstring",
    }
}
