local api = vim.api

-- Highlight on yank
api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
  ]],
	false
)

-- Run gofmt + goimport on save
api.nvim_exec(
  [[
  autocmd BufWritePre *.go :silent! lua require('go.format').goimport()
  ]],
  false
)
