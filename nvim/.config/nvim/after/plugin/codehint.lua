local codehint = require("codehint")

codehint.setup()

vim.keymap.set("n", "<leader>h", codehint.hint)
