-- smoothcursor.nvim setup
require("smoothcursor").setup({
    priority = 10,
    fancy = {
        enable = true,
        head = { cursor = "", texthl = "SmoothCursor", linehl = nil },
        body = {
            { cursor = "●", texthl = "SmoothCursorWhite" },
            { cursor = "●", texthl = "SmoothCursorWhite" },
            { cursor = "●", texthl = "SmoothCursorWhite" },
            { cursor = "●", texthl = "SmoothCursorWhite" },
            { cursor = "•", texthl = "SmoothCursorWhite" },
            { cursor = ".", texthl = "SmoothCursorWhite" },
            { cursor = ".", texthl = "SmoothCursorWhite" },
        },
        tail = { cursor = nil, texthl = "SmoothCursor" },
    },
    disabled_filetypes = {
        "TelescopePrompt",
        "TelescopeResults",
        "gitblame",
        "css",
        "noice",
        "lazy",
    },
})

