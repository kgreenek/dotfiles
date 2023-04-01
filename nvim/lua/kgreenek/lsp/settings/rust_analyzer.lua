-- Run custom build scripts in projects that have them, to support generated code such as protobuf.
return {
  settings = {
    cargo = {
      buildScripts = {
        enable = true,
      },
    },
  },
}
