local M = {}

function M.merge_tables(t1, t2)
    local result = {}
    if t1 ~= nil then
        for k, v in pairs(t1) do
            result[k] = v
        end
    end
    if t2 ~= nil then
        for k, v in pairs(t2) do
            result[k] = v
        end
    end
    return result
end

function M.valid_bufs()
    local bufs = vim.api.nvim_list_bufs()
    return vim.tbl_filter(function(buf)
        return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted
    end, bufs)
end

function M.switch_buf(buf_idx)
    local valid_bufs = M.valid_bufs()
    if valid_bufs[buf_idx] then
        vim.api.nvim_win_set_buf(0, valid_bufs[buf_idx])
    end
end

function M.hidden_buf(buf_idx)
    local valid_bufs = M.valid_bufs()
    if valid_bufs[buf_idx] then
        vim.bo[valid_bufs[buf_idx]].buflisted = false
        M.switch_buf(buf_idx)
    end
end

return M

