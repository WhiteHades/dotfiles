# OpenCode.nvim Complete Cheatsheet

## Neovim Keybindings (Your Config)

| Keybinding | Mode | What It Does |
|------------|------|--------------|
| `<leader>oa` | Normal, Visual | **Ask with Context** - Opens prompt input with `@this:` already filled in. Includes your selection (visual) or cursor position (normal). Press Enter to submit  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `<leader>ox` | Normal, Visual | **Select Action** - Opens menu of pre-configured prompts like "explain", "fix", "optimize", "add tests", "add comments"  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `<leader>oc` | Normal, Terminal | **Toggle Chat** - Opens/closes embedded OpenCode terminal window inside Neovim  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `<leader>ou` | Normal | **Scroll Up** - Scroll OpenCode chat messages up by half page  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `<leader>od` | Normal | **Scroll Down** - Scroll OpenCode chat messages down by half page  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `<leader>on` | Normal | **New Session** - Start fresh conversation, clears all previous chat history  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `<leader>oi` | Normal | **Interrupt** - Stop AI response mid-generation (useful when it's going wrong)  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `go` | Normal, Visual | **Add Range Operator** - Type `go` then motion (e.g., `goip` = add paragraph, `go3j` = add 3 lines down). Sends to chat without submitting  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `goo` | Normal | **Add Line** - Quick shortcut to add current line to OpenCode chat  [github](https://github.com/NickvanDyke/opencode.nvim) |

## Context Placeholders (Use in Prompts)

| Placeholder | What It Includes |
|-------------|------------------|
| `@buffer` | Entire content of current file  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `@selection` | Currently selected text in visual mode  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `@this` | Smart context: selection if in visual mode, otherwise cursor position  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `@diagnostics` | All LSP errors, warnings, and hints in current buffer  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `@diff` | Git changes (staged and unstaged) in current file  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `@cursor` | Current cursor line and position  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `@visible` | Text currently visible in your Neovim viewport  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `@quickfix` | All items in your quickfix list  [github](https://github.com/NickvanDyke/opencode.nvim) |

## OpenCode Chat Commands (Type Inside Chat)

| Command | What It Does |
|---------|--------------|
| `/init` | Initialize project context - OpenCode analyzes your codebase structure  [opencode](https://opencode.ai/docs/commands/) |
| `/undo` | Undo last AI-applied changes to files  [opencode](https://opencode.ai/docs/commands/) |
| `/redo` | Redo previously undone changes  [opencode](https://opencode.ai/docs/commands/) |
| `/share` | Generate shareable link to your conversation  [opencode](https://opencode.ai/docs/commands/) |
| `/help` | Show all available commands  [opencode](https://opencode.ai/docs/commands/) |
| `/clear` | Clear chat history (keeps session)  [opencode](https://opencode.ai/docs/cli/) |
| `/exit` | Close OpenCode session  [opencode](https://opencode.ai/docs/cli/) |

## OpenCode Internal Keybinds (Inside Chat Window)

| Keybinding | What It Does |
|------------|--------------|
| `Ctrl+x` then `n` | New session (same as `/init`)  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `Ctrl+x` then `i` | Interrupt AI generation  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `Ctrl+x` then `a` | Cycle between Plan Agent (review first) and Build Agent (apply immediately)  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `Ctrl+x` then `t` | Switch color themes  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `Ctrl+g` | Cancel current operation  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `Up Arrow` | Browse previous prompts history  [github](https://github.com/NickvanDyke/opencode.nvim) |
| `Tab` | Autocomplete context placeholders while typing  [github](https://github.com/NickvanDyke/opencode.nvim) |

## Common Workflows

### 1. Fix an Error

1. Select the problematic code in visual mode
2. Press `<leader>ox`
3. Choose "fix" from menu
4. AI analyzes with `@diagnostics` context and suggests fix [github](https://github.com/NickvanDyke/opencode.nvim)

### 2. Explain Code

1. Highlight confusing code
2. Press `<leader>oa`
3. Type: `explain this in simple terms`
4. Press Enter [github](https://github.com/NickvanDyke/opencode.nvim)

### 3. Add Tests

1. Select function/class
2. Press `<leader>ox`
3. Choose "add tests"
4. AI generates test cases [github](https://github.com/NickvanDyke/opencode.nvim)

### 4. Refactor with Plan Agent

1. Open chat: `<leader>oc`
2. Press `Ctrl+x` then `a` to enable Plan Agent (review mode)
3. Make your request
4. AI shows diff before applying changes [keebsforall](https://keebsforall.com/blogs/mechanical-keyboards-101/complete-guide-to-using-opencode-with-neovim-tmux)

### 5. Project-Wide Question

1. Press `<leader>oc`
2. Type `/init` to analyze project
3. Ask: "where is authentication handled?"
4. AI searches entire codebase [opencode](https://opencode.ai/docs/commands/)

## Advanced: Custom Prompts

Add to your config for instant access: [github](https://github.com/NickvanDyke/opencode.nvim)

```lua
vim.keymap.set({ "n", "x" }, "<leader>oe", function()
  require("opencode").ask("@this Explain this code in simple terms",
    { submit = true })
end, { desc = "OpenCode: Explain" })

vim.keymap.set({ "n", "x" }, "<leader>of", function()
  require("opencode").ask("@this @diagnostics Fix all errors", { submit = true })
end, { desc = "OpenCode: Fix errors" })

vim.keymap.set({ "n", "x" }, "<leader>ot", function()
  require("opencode").ask("@this Add comprehensive tests", { submit = true })
end, { desc = "OpenCode: Add tests" })
```

## Tips

- Always run `/init` when starting work on a new project [opencode](https://opencode.ai/docs/commands/)
- Use Plan Agent (`Ctrl+x` `a`) for risky refactors to review first [keebsforall](https://keebsforall.com/blogs/mechanical-keyboards-101/complete-guide-to-using-opencode-with-neovim-tmux)
- Combine placeholders: `@buffer @diagnostics fix all issues` [github](https://github.com/NickvanDyke/opencode.nvim)
- Press `:e!` in Neovim to reload files after OpenCode modifies them [keebsforall](https://keebsforall.com/blogs/mechanical-keyboards-101/complete-guide-to-using-opencode-with-neovim-tmux)
- Use `/undo` immediately if AI makes wrong changes [opencode](https://opencode.ai/docs/commands/)
