local function config()
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)

      if client.server_capabilities.signatureHelpProvider then
        require('lsp-overloads').setup(client, {
          ui = {
            border = "single",
            close_events = { "CursorMovedI", "CursorMoved", "BufHidden", "InsertLeave" },
            floating_window_above_cur_line = true,
          },
          keymaps = {
            next_signature = "<C-j>",
            previous_signature = "<C-k>",
            next_parameter = "<C-l>",
            previous_parameter = "<C-h>",
            close_signature = "<A-s>"
          }
        })
      end

      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<leader>lf', function()
        require("conform").format({
          bufnr = ev.buf,
          async = true,
          lsp_fallback = true
        })
      end, opts)
    end,
  })

  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "single"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end

  vim.diagnostic.config({
    virtual_text = false,
    underline = true,
    severity_sort = true,
    float = {
      border = "single",
      source = "always",
      header = "",
      prefix = "",
      suffix = ""
    }
  })

  local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end


return {
  'neovim/nvim-lspconfig',
  event = { "BufNewFile", "BufRead" },
  config = config,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "Issafalcon/lsp-overloads.nvim",
  }
}
