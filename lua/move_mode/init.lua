local M = {}

local move_mode = false

local function toggle_move_mode()
  move_mode = not move_mode
  if move_mode then
    print("Move mode activated")
  else
    print("Move mode deactivated")
  end
end

local function move_line(direction)
  if direction == "up" then
    return ":m .-2<CR>=="
  else
    return ":m .+1<CR>=="
  end
end

local function move_selection(direction)
  if direction == "up" then
    return ":<C-u>'<,'>m '<-2<CR>gv=gv"
  else
    return ":<C-u>'<,'>m '>+1<CR>gv=gv"
  end
end

function M.setup(opts)
  opts = opts or {}
  local toggle_key = opts.toggle_key or "m"

  vim.keymap.set({"n", "i", "v"}, toggle_key, function()
    toggle_move_mode()
    vim.defer_fn(function()
      if move_mode then
        toggle_move_mode()
      end
    end, 5000)
  end, {desc = "Toggle move mode"})

  vim.keymap.set("n", "<Up>", function()
    if move_mode then
      return move_line("up")
    else
      return "<Up>"
    end
  end, {expr = true, desc = "Move up or normal up"})

  vim.keymap.set("n", "<Down>", function()
    if move_mode then
      return move_line("down")
    else
      return "<Down>"
    end
  end, {expr = true, desc = "Move down or normal down"})

  vim.keymap.set("i", "<Up>", function()
    if move_mode then
      return "<Esc>" .. move_line("up") .. "i"
    else
      return "<Up>"
    end
  end, {expr = true, desc = "Move up or normal up"})

  vim.keymap.set("i", "<Down>", function()
    if move_mode then
      return "<Esc>" .. move_line("down") .. "i"
    else
      return "<Down>"
    end
  end, {expr = true, desc = "Move down or normal down"})

  vim.keymap.set("v", "<Up>", function()
    if move_mode then
      return move_selection("up")
    else
      return "<Up>"
    end
  end, {expr = true, desc = "Move selection up or normal up"})

  vim.keymap.set("v", "<Down>", function()
    if move_mode then
      return move_selection("down")
    else
      return "<Down>"
    end
  end, {expr = true, desc = "Move selection down or normal down"})
end

return M
