return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim" },
  },
  build = "make tiktoken", -- Only on MacOS or Linux
  opts = {
    debug = false,
    -- model = "gpt-4",
    temperature = 0.1,
    question_header = "## User ",
    answer_header = "## Copilot ",
    error_header = "## Error ",
    separator = "───",
    show_folds = true,
    show_help = true,
    auto_follow_cursor = true,
    auto_insert_mode = false,
    clear_chat_on_new_prompt = false,
    context = nil,

    prompts = {
      -- Code related prompts
      Explain = {
        prompt = "/COPILOT_EXPLAIN Write an explanation for the active selection as paragraphs of text.",
      },
      Review = {
        prompt = "/COPILOT_REVIEW Review the selected code.",
        callback = function(response, source)
          -- Additional processing if needed
        end,
      },
      Fix = {
        prompt = "/COPILOT_GENERATE There is a problem in this code. Rewrite the code to show it with the bug fixed.",
      },
      Optimize = {
        prompt = "/COPILOT_GENERATE Optimize the selected code to improve performance and readability.",
      },
      Docs = {
        prompt = "/COPILOT_GENERATE Please add documentation comment for the selection.",
      },
      Tests = {
        prompt = "/COPILOT_GENERATE Please generate tests for my code.",
      },
      FixDiagnostic = {
        prompt = "Please assist with the following diagnostic issue in file:",
        selection = function(source)
          local diagnostics = vim.diagnostic.get(0)
          local diagnostic = diagnostics[1]
          return {
            {
              filename = vim.fn.expand("%:p"),
              filetype = vim.bo.filetype,
              lines = { diagnostic.lnum + 1, diagnostic.end_lnum + 1 },
            },
          }
        end,
      },
      Commit = {
        prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
        selection = function(source)
          return require("CopilotChat.select").gitdiff(source, true)
        end,
      },
      CommitStaged = {
        prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
        selection = function(source)
          return require("CopilotChat.select").gitdiff(source, false)
        end,
      },
    },

    mappings = {
      complete = {
        detail = "Use @<Tab> or /<Tab> for options.",
        insert = "<Tab>",
      },
      close = {
        normal = "q",
        insert = "<C-c>",
      },
      reset = {
        normal = "<C-l>",
        insert = "<C-l>",
      },
      submit_prompt = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      accept_diff = {
        normal = "<C-y>",
        insert = "<C-y>",
      },
      yank_diff = {
        normal = "gy",
      },
      show_diff = {
        normal = "gd",
      },
      show_system_prompt = {
        normal = "gp",
      },
      show_user_selection = {
        normal = "gs",
      },
    },
  },
  config = function(_, opts)
    local chat = require("CopilotChat")
    local select = require("CopilotChat.select")

    chat.setup(opts)

    -- Setup keybindings
    vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
      chat.ask(args.args, { selection = select.visual })
    end, { nargs = "*", range = true })

    -- Inline chat with visual selection
    vim.api.nvim_create_user_command("CopilotChatInline", function(args)
      chat.ask(args.args, {
        selection = select.visual,
        window = {
          layout = "float",
          relative = "cursor",
          width = 1,
          height = 0.4,
          row = 1,
        },
      })
    end, { nargs = "*", range = true })

    -- Quick chat
    vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
      chat.ask(args.args, { selection = select.buffer })
    end, { nargs = "*" })
  end,
  event = "VeryLazy",
  keys = {
    -- Show help actions with telescope
    {
      "<leader>ah",
      function()
        local actions = require("CopilotChat.actions")
        require("CopilotChat.integrations.telescope").pick(actions.help_actions())
      end,
      desc = "CopilotChat - Help actions",
    },
    -- Show prompts actions with telescope
    {
      "<leader>ap",
      function()
        local actions = require("CopilotChat.actions")
        require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      end,
      desc = "CopilotChat - Prompt actions",
    },
    {
      "<leader>ap",
      ":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>",
      mode = "x",
      desc = "CopilotChat - Prompt actions",
    },
    -- Code related commands
    { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
    { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
    { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
    { "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
    { "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
    -- Chat with Copilot in visual mode
    {
      "<leader>av",
      ":CopilotChatVisual<cr>",
      mode = "x",
      desc = "CopilotChat - Open in vertical split",
    },
    {
      "<leader>ax",
      ":CopilotChatInline<cr>",
      mode = "x",
      desc = "CopilotChat - Inline chat",
    },
    -- Custom input for CopilotChat
    {
      "<leader>ai",
      function()
        local input = vim.fn.input("Ask Copilot: ")
        if input ~= "" then
          vim.cmd("CopilotChat " .. input)
        end
      end,
      desc = "CopilotChat - Ask input",
    },
    -- Generate commit message based on the git diff
    {
      "<leader>am",
      "<cmd>CopilotChatCommit<cr>",
      desc = "CopilotChat - Generate commit message for all changes",
    },
    {
      "<leader>aM",
      "<cmd>CopilotChatCommitStaged<cr>",
      desc = "CopilotChat - Generate commit message for staged changes",
    },
    -- Quick chat with Copilot
    {
      "<leader>aq",
      function()
        local input = vim.fn.input("Quick Chat: ")
        if input ~= "" then
          vim.cmd("CopilotChatBuffer " .. input)
        end
      end,
      desc = "CopilotChat - Quick chat",
    },
    -- Debug
    { "<leader>ad", "<cmd>CopilotChatDebugInfo<cr>", desc = "CopilotChat - Debug Info" },
    -- Fix the issue with diagnostic
    { "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
    -- Clear buffer and chat history
    { "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
    -- Toggle Copilot Chat Vsplit
    { "<leader>ac", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
  },
}
