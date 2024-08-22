-- Automatically inserts a closing pair for a paired delimiter characters like
-- brackets, paranthesis or quotes
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = true,

  config = function()
    local npairs = require("nvim-autopairs")

    npairs.setup()
    npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
  end
}
