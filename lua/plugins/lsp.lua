return {
    "neovim/nvim-lspconfig",
    cmd = { "Mason", "Neoconf" },
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/neoconf.nvim",
        "folke/neodev.nvim",
        {
            "j-hui/fidget.nvim",
            tag = "legacy",
        },
        "nvimdev/lspsaga.nvim",
    },
    config = function()
        local servers = {
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telementry = { enable = false },
                },
            },
            pyright = {},
            jsonls = {},
            ruff_lsp = {},
        }
        local on_attach = function(_, bufnr)
            local function buf_set_option(...)
                vim.api.nvim_buf_set_option(bufnr, ...)
            end

            buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- Mappings.
            local opts = { buffer = bufnr, noremap = true, silent = true }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<cr>', opts)
            vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)
            vim.keymap.set('n', 'gi', require 'telescope.builtin'.lsp_implementations, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set('n', '<space>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', '<space>rn', '<cmd>Lspsaga rename ++project<CR>', opts)
            vim.keymap.set('n', '<space>ca', '<cmd>Lspsaga code_action<CR>', opts)
            vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
            -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<space>da', require('telescope.builtin').diagnostics, opts)
            vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
            vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
            vim.keymap.set('n', '<space>f', function()
                vim.lsp.buf.format { async = true }
            end, opts)
            vim.keymap.set({ 'n', 't' }, '<A-1>', '<cmd>Lspsaga term_toggle<cr>', opts)
        end

        require 'neoconf'.setup()
        require 'neodev'.setup()
        require 'fidget'.setup()
        require 'lspsaga'.setup()
        require 'mason'.setup()
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require 'mason-lspconfig'.setup({
            ensure_installed = vim.tbl_keys(servers),
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup {
                        settings = servers[server_name],
                        on_attach = on_attach,
                        capabilities = capabilities,
                    }
                end
            }
        })
        require('lspconfig').pyright.setup {
            settings = {
                pyright = {
                    -- Using Ruff's import organizer
                    disableOrganizeImports = true,
                },
                python = {
                    analysis = {
                        -- Ignore all files for analysis to exclusively use Ruff for linting
                        ignore = { '*' },
                    },
                },
            },
        }
        -- require'lspconfig'.pyright.setup{
        --     on_attach = on_attach
        -- }
    end
}
