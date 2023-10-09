vim.api.nvim_create_user_command("TOrtf", function()
	vim.cmd([[
    TSBufDisable highlight
    TOhtml
    w !textutil -format html -convert rtf -stdin -stdout | pbcopy
    TSBufEnable highlight
    bdelete!
  ]])
end, {})
