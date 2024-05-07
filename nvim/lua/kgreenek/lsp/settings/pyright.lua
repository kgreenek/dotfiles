return {
  settings = {
    python = {
      analysis = {
        stubPath = vim.fn.stdpath("data") .. "/lazy/python-type-stubs",
        --autoImportCompletions = true,
        --autoSearchPaths = true,
        diagnosticMode = 'openFilesOnly',
        --typeCheckingMode = "off",
        useLibraryCodeForTypes = false,
      },
    },
  },
}
