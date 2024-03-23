local M = {}

function M.req (module)
    local ok, options = pcall(require, module)
    if not ok then
        vim.notify_once("Can't load module " .. module, vim.log.levels.ERROR)
    end
end

return M
