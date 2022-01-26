vim.g.startify_custom_header = {
  "                                       ██",
  "                                      ░░",
  "    ███████   █████   ██████  ██    ██ ██ ██████████",
  "   ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██",
  "    ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██",
  "    ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██",
  "    ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██",
  "   ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░",
}
vim.g.webdevicons_enable_startify = 1
vim.g.startify_session_persistence = 1
vim.g.startify_lists = {
  { type = "sessions", header = { "   Sessions" } },
  { type = "files", header = { "   MRU" } },
  { type = "dir", header = { "   MRU " .. vim.fn.getcwd() } },
  { type = "bookmarks", header = { "   Bookmarks" } },
  { type = "commands", header = { "   Commands" } },
}
