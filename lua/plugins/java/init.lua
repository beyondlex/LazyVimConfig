-- https://github.com/nvim-java/nvim-java

return {
  "nvim-java/nvim-java",
  enabled = false,
  dependencies = {
    "nvim-java/lua-async-await",
    "nvim-java/nvim-java-refactor",
    "nvim-java/nvim-java-core",
    "nvim-java/nvim-java-test",
    "nvim-java/nvim-java-dap",
    "MunifTanjim/nui.nvim",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    {
      "williamboman/mason.nvim",
      opts = {
        registries = {
          "github:nvim-java/mason-registry",
          "github:mason-org/mason-registry",
        },
      },
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        handlers = {
          ["jdtls"] = function()
            require("java").setup({
              root_markers = {
                ".git",
                "settings.gradle",
                "settings.gradle.kts",
                -- "pom.xml", -- comment for multiple maven module, using .git instead of pom.xml
                "build.gradle",
                "mvnw",
                "gradlew",
                "build.gradle",
                "build.gradle.kts",
              },
              java_debug_adapter = {
                enable = true,
              },
              notifications = {
                dap = true,
              },
            })
            require("lspconfig").jdtls.setup({})
          end,
        },
      },
    },
  },
  opts = {},
}
