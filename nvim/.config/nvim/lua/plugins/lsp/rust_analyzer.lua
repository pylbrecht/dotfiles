local servo_settings = {
  rustfmt = {
    overrideCommand = { "./mach", "fmt" },
  },
  check = {
    overrideCommand = { "./mach", "clippy", "--message-format=json" },
  },
  cargo = {
    buildScripts = {
      overrideCommand = { "./mach", "clippy", "--message-format=json" },
    },
  },
}

local function is_servo_project(root_dir)
  return vim.fs.basename(root_dir) == "servo"
end

return {
  on_new_config = function(new_config, root_dir)
    if is_servo_project(root_dir) then
      new_config.settings = vim.tbl_deep_extend("force", new_config.settings, servo_settings)
    end
  end,
}
