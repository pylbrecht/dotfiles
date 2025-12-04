local servo_settings = {
  rustfmt = {
    overrideCommand = { "./mach", "fmt" },
  },
  check = {
    overrideCommand = {
      "./mach",
      "clippy",
      "--message-format=json",
      "--target-dir",
      "target/lsp",
      "--features",
      "tracing,tracing-perfetto",
    },
  },
  cargo = {
    buildScripts = {
      overrideCommand = {
        "./mach",
        "clippy",
        "--message-format=json",
        "--target-dir",
        "target/lsp",
        "--features",
        "tracing,tracing-perfetto",
      },
    },
  },
}

local function is_servo_project(root_dir)
  return vim.fs.basename(root_dir) == "servo"
end

return {
  on_attach = function(client)
    if is_servo_project(client.root_dir) then
      client.settings = vim.tbl_deep_extend("force", client.settings, servo_settings)
    end
  end,
}
