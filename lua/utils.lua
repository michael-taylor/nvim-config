local Path = require('plenary.path')
local path = Path.path

local utils = {}

function utils.copy_file(file, src_dir, dest_dir)
	source_dir = Path:new(src_dir)
	source_file = source_dir:joinpath(file)
	destination_dir = Path:new(dest_dir)
	destination_file = destination_dir:joinpath(file)

	if destination_file:exists() ~= true then
		print('Copying ' .. file .. ' to ' .. dest_dir)
		destination_dir:mkdir({
			parents = true,
			exists_ok = true
		})
		source_file:copy({
			destination = destination_file:absolute()
		})
	end
end

return utils
