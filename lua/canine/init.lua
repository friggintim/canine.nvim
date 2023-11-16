local M = {}

local dog = "🐕bark"

math.randomseed(os.time())

local function get_random_position()
  local current_window = vim.api.nvim_get_current_win()
  local win_h = vim.api.nvim_win_get_height(current_window)
  local win_w = vim.api.nvim_win_get_width(current_window)

  local random_h = math.random(0, win_h - 1)
  local random_w = math.random(0, win_w - 6)
  return { random_h, random_w }
end

function M.bark()
  local buffer_number = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buffer_number, 0, -1, true, { dog })

  local window_options = {
    style = "minimal",
    border = "single",
    relative = "win",
    width = 6,
    height = 1,
    bufpos = get_random_position(),
    zindex = 666,
  }
  vim.api.nvim_open_win(buffer_number, false, window_options)
end

return M
