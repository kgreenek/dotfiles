-- JSON schemas come from SchemaStore.nvim, which mirrors the whole
-- schemastore.org catalog (tsconfig, package.json, eslint, etc.) and stays up to
-- date -- replacing the old hand-maintained list + nlsp-settings.nvim.
return {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}
