local user_name = "Sean"

local function getGreeting(name)
  local tableTime = os.date("*t")
  local hour = tableTime.hour
  local greetingsTable = {
    [0] = "󰢠  Early bird!",
    [1] = "  Good morning",
    [2] = "  Good afternoon",
    [3] = "  Good evening",
    [4] = "󰖔  Good night",
    [5] = "󰋣  Sleep well",
  }

  local greetingIndex = 0
  if hour < 6 then
    greetingIndex = 5
  elseif hour < 8 then
    greetingIndex = 0
  elseif hour < 12 then
    greetingIndex = 1
  elseif hour < 17 then
    greetingIndex = 2
  elseif hour < 20 then
    greetingIndex = 3
  elseif hour < 23 then
    greetingIndex = 4
  else
    greetingIndex = 5
  end

  return greetingsTable[greetingIndex] .. ", " .. name
end

return {
  "nvimdev/dashboard-nvim",
  opts = function()
    local logo = [[
	⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⢀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀
	⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀
	⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀
	⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀
	⠀⣿⣿⣿⣿⣿⣿⣿⣷⢿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀
	⢀⣿⠘⣿⡿⣿⣿⣿⣿⡎⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⡇⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀
	⠈⣿⠀⢿⣿⢹⣻⣿⣯⣿⡄⢻⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡞⣿⣿⣿⡄
	⠀⣿⡄⠘⣿⡇⢿⣿⡿⡜⢿⣀⣹⣯⠿⠟⠛⠋⠁⠉⠉⠉⠈⠀⢿⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣧
	⠀⢿⣇⠀⠹⠿⠌⠋⠋⠉⠉⠉⠁⠀⣀⣠⡤⠶⢶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⣿⣿⣿
	⠀⠀⢻⡤⠖⣒⣢⣄⠀⠀⠀⠀⠀⠀⠀⡟⠀⠀⠈⢿⠓⣻⡿⠋⠀⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⡟
	⠀⠀⠀⢹⣌⣠⠶⣾⣷⡄⠀⠀⠀⠀⠀⠀⠀⢀⢀⣀⣽⠋⠀⠀⠀⢹⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣟⣿⣿⣿⣿⣿⠿⠋⠀
	⠀⠀⠀⢸⣿⣿⡄⠘⠭⡇⠀⠀⠀⠀⠀⠀⠀⠈⠻⠛⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣷⢿⣿⣿⣿⠟⠀⠀⠀
	⠀⠀⠀⢸⣿⣿⡍⠳⢾⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣧⢸⣿⣿⣿⣿⣿⣿⣿⣿⠸⢛⠟⠁⠀⠀⠀⠀
	⠀⠀⠀⢸⣿⣿⣇⢀⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⢿⠔⠁⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠨⣿⣿⣿⡌⣷⣄⠠⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⣿⣿⣇⠹⡌⠉⠁⠀⠀⠀⠀⣀⡤⢤⣴⡶⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⠋⣾⢹⣿⣿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⣿⣿⣯⠀⠹⣄⠀⠀⠰⣯⣵⢟⣋⣽⡋⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠀⣿⠸⠟⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⢸⣿⣿⠀⠀⠙⢦⡀⠀⠈⠿⠿⠿⠛⠁⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⡿⠀⠉⠀⠀⠘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⢸⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠴⠋⠀⣿⣿⣿⡇⠀⠀⣀⣠⣤⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⣿⣿⡀⠀⠀⠀⢻⣿⣿⣄⠀⠀⠀⠀⠀⣀⣴⠛⠁⠀⠀⠀⣿⣿⣿⣷⣶⠿⠛⠋⠉⠘⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
	⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠸⣿⣿⣿⣦⣀⣠⣴⡟⠋⢹⠀⠀⣀⣠⡴⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ]]

    logo = string.rep("\n", 6) .. logo .. "\n" .. getGreeting(user_name) .. "\n"
    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
      -- stylua: ignore
      center = {
        { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
        { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
        { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
        { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
        { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
        { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
      },
        -- footer = getGreeting(user_name),
        footer = {
          "",
          "I have found that people lie, most often deceiving themselves.",
          "                                             - Saburo Arasaka",
        },
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- open dashboard after closing lazy
    if vim.o.filetype == "lazy" then
      vim.api.nvim_create_autocmd("WinClosed", {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
          end)
        end,
      })
    end

    return opts
  end,
}
