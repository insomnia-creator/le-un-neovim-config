local function cd(global, path)
    vim.cmd((global and "cd " or "lcd ") .. vim.fn.fnameescape(path))
end

local dir = vim.v.argv[2]
if not dir then
    --ignore
elseif dir == '.' then
    cd(false, vim.fn.getcwd())    
else
    if not (vim.fn.isdirectory(dir) == 0) then
        cd(false, dir)
    end
    -- else do nothing
end