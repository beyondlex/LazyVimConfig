
return {
  "mfussenegger/nvim-jdtls",
  enabled = false,
  config = function(_, opts) 
    local config = {
      cmd = { '/Users/lex/.local/share/nvim/mason/bin/jdtls -configuration /Users/lex/.cache/jdtls/config -data /Users/lex/.cache/jdtls/workspace --jvm-arg=-javaagent:/Users/lex/Tools/nvim/lsp/lombok.jar' },
      root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    }
    require('jdtls').start_or_attach(config)
  end,
}

