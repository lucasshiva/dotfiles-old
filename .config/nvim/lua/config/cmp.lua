require("luasnip/loaders/from_vscode").lazy_load()

local lspkind = require('lspkind')
local cmp = require("cmp")

cmp.setup {
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer", max_item_count = 10 },
    { name = "luasnip" },
    { name = "path" },
  },
  formatting = {
    format = lspkind.cmp_format {
      --mode = 'symbol',
      with_text = true,
      menu = {
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        luasnip = "[Snippet]",
        path = "[Path]",
      },
    },
  },
  experimental = {
    native_menu = false,
    ghost_text = true
  },
}
