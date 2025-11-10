return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
        require("neo-tree").setup({
            enable_git_status = true,

            -- To close Neo-Tree after opening a file
            --[[
            event_handlers = {
                {
                    event = "file_open_requested",
                    handler = function()
                        require("neo-tree.command").execute({ action = "close" })
                    end
                }
            },
            ]]--

            filesystem = {
                window = {
                    position = "left",
                    width = 24,
                    mappings = {
                        ["e"] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
                        ["b"] = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
                        ["g"] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
                        ["o"] = "system_open",
                        ["D"] = "diff_files"
                    }
                }
            },

            commands = {
                -- To open a file with the default program of the system
                system_open = function (state)
                    local node = state.tree:get_node()
                    local path = node:get_id()
                    vim.fn.jobstart({ "xdg-open", path }, { detach = true })
                end,

                -- To diff files
                diff_files = function(state)
                    local node = state.tree:get_node()
                    local log = require("neo-tree.log")
                    state.clipboard = state.clipboard or {}
                    if diff_Node and diff_Node ~= tostring(node.id) then
                        local current_Diff = node.id
                        require("neo-tree.utils").open_file(state, diff_Node, open)
                        vim.cmd("vert diffs " .. current_Diff)
                        log.info("Diffing " .. diff_Name .. " against " .. node.name)
                        diff_Node = nil
                        current_Diff = nil
                        state.clipboard = {}
                        require("neo-tree.ui.renderer").redraw(state)
                    else
                        local existing = state.clipboard[node.id]
                        if existing and existing.action == "diff" then
                            state.clipboard[node.id] = nil
                            diff_Node = nil
                            require("neo-tree.ui.renderer").redraw(state)
                        else
                            state.clipboard[node.id] = { action = "diff", node = node }
                            diff_Name = state.clipboard[node.id].node.name
                            diff_Node = tostring(state.clipboard[node.id].node.id)
                            log.info("Diff source file " .. diff_Name)
                            require("neo-tree.ui.renderer").redraw(state)
                        end
                    end
                end
            }
        })
        vim.keymap.set('n', '<leader>nt', ':Neotree filesystem reveal<CR>', {})
    end
}

