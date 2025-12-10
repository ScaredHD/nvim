local Terminal = require("toggleterm.terminal").Terminal
local M = {}

function M.build_and_run()
  local file = vim.fn.expand("%:p")
  local file_no_ext = vim.fn.expand("%:p:r")
  local exe = file_no_ext
  if vim.fn.has("win32") == 1 then
    exe = exe .. ".exe"
  end

  local compiler = "clang++"
  local flags = "-std=c++23 -O2 -Wall -Wextra -Wpedantic"

  local cmd = string.format("%s %s %s -o %s", compiler, file, flags, exe)

  local term = Terminal:new({
    direction = "float",
    close_on_exit = false,
    on_open = function(t)
      t:send("clear\n")
      t:send(cmd .. "\n")

      local run_cmd = string.format('if ($?) { & "%s" }\n', exe)
      if vim.fn.has("win32") == 0 then
        run_cmd = string.format('if [ $? -eq 0 ]; then "%s"; fi\n', exe)
      end

      t:send(run_cmd)
    end
  })

  term:toggle()
end

return M