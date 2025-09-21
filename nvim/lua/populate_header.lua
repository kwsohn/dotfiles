local function populate_header_with_class(namespace)
  local api = vim.api
  local buf = api.nvim_get_current_buf()
  local filename = api.nvim_buf_get_name(buf)
  local class_name = vim.fn.fnamemodify(filename, ":t:r") -- filename without path and extension

  -- Only proceed if buffer is empty
  if api.nvim_buf_line_count(buf) > 1 or (#api.nvim_buf_get_lines(buf, 0, 1, false)[1] > 0) then
    print("Buffer is not empty.")
    return
  end

  local lines = {
    "#pragma once",
    "",
    "namespace " .. namespace .. " {",
    "",
    "class " .. class_name .. " {",
    "public:",
    "    " .. class_name .. "();",
    "    ~" .. class_name .. "();",
    "};",
    "",
    "} // namespace " .. namespace,
  }

  api.nvim_buf_set_lines(buf, 0, -1, false, lines)
end


vim.api.nvim_create_user_command('PopulateHeader', function(opts) 
    populate_header_with_class(opts.args)
end, { nargs = 1 })
