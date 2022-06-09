local config = {}

function config.swift()
    require'swift_env'.setup {
  --- Normal/Visual Mode leader key
  leader = "<leader>",
  --- Format Configuration
  format = {
    -- path to the swiftformat binary.
    cmd = "swiftformat",
    -- command to run formater manually
    ex = "Sfmt",
    -- mapping to run formater manually
    mapping = "eF",
    -- whether to format on write.
    auto = true,
    -- options to be passed when calling swiftformat from the command line
    options = {},
    -- path to config file from root directory
    config_file = ".swiftformat",
    -- create config format config file when it doesn't exists?
    config_create_if_unreadable = true,
    -- the file content to be generated.
    config_default_content = [[]],
  }
}
end


return config
