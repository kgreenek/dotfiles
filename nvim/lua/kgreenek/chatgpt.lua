local chatgpt_status_ok, chatgpt = pcall(require, "chatgpt")
if not chatgpt_status_ok then
  vim.notify("chatgpt not found!")
  return
end

chatgpt.setup()
