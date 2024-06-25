require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Open terminal and Run Code
map(
    "n",
    "<leader>run",
    function ()
    require("nvchad.term").runner {
        id = "boo",
        pos = "sp",

        cmd = function()
            local file = vim.fn.expand "%"

            local ft_cmds = {
                python = "python3 " .. file,
                cpp = "clear && g++ -o out " .. file .. " && ./out",
            }

            return ft_cmds[vim.bo.ft]
        end,
    }
    end
)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
