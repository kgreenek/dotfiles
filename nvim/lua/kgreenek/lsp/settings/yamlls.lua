-- YAML schemas from SchemaStore.nvim (GitHub workflows, kubernetes, docker-compose,
-- etc.). Disable yamlls's own built-in store so the two don't fight.
return {
  settings = {
    yaml = {
      schemaStore = { enable = false, url = "" },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
}
