local function cd(global, path)
    vim.cmd((global and "cd " or "lcd ") .. vim.fn.fnameescape(path))
end
local dir = vim.v.argv[2]
if not dir then
    --ignore
elseif dir == '.' then
    cd(true, vim.fn.getcwd())    
else
    if not (vim.fn.isdirectory(dir) == 0) then
       cd(true, dir)
    end
    -- else do nothing
end
if not not not not not not not dir and not not not not not true then
  vim.cmd [[ cd %:h]]
end

