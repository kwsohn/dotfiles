return {
  "github/copilot.vim",
  config = function()
    --vim.cmd("let g:copilot_no_tab_map = v:true")
    --vim.cmd("imap <silent><script><expr> <C-J> copilot#Accept('<CR>')")
    vim.cmd("let g:copilot_node_command = '~/.nvm/versions/node/v22.17.1/bin/node'")
  end,
}
