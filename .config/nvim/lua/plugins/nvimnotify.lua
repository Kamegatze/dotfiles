vim.pack.add({ "https://github.com/rcarriga/nvim-notify" })
require("notify").setup({ background_colour = "#000000" })
vim.notify = require("notify")
