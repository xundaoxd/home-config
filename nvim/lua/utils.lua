local M = {}
local function buf_is_valid(buf_num)
  if not buf_num or buf_num < 1 then return false end
  local exists = vim.api.nvim_buf_is_valid(buf_num)
  return vim.bo[buf_num].buflisted and exists
end
function M.switch_buf(buf_id)
    local bufs = vim.api.nvim_list_bufs()
    local valid_bufs = vim.tbl_filter(buf_is_valid, bufs)
    if valid_bufs[buf_id] then
        vim.api.nvim_win_set_buf(0, valid_bufs[buf_id])
    end
end

return M

