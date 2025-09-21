return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = "gpt-4.1",
      --model = 'Claude-Sonnet-4',
      prompts = {
        SourceHdr = {
          prompt = '#buffer:current\nGenerate empty function definitions for the class declaration',
          system_prompt = '',
          --mapping = '<leader>ccmc',
          --description = 'My custom prompt description',
        },
      },
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts)
      vim.keymap.set("n", "<leader>cc", function()
        vim.cmd("CopilotChat")
      end, { desc = "Open CopilotChat" })

      vim.keymap.set('n', '<leader>ccq', function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          require("CopilotChat").ask(input, {
            selection = require("CopilotChat.select").buffer
          })
        end
      end, { desc = "CopilotChat - Quick chat" })
    end,
  },
}
