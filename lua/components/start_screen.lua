local status, db = pcall(require, "dashboard")
if not status then
	return
end

-- https://fsymbols.com/text-art/
-- https://xflea.github.io/nv-dashboard-header-maker/

db.custom_header = {
	'▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒',
	'▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒',
	'▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒',
	'▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒',
	'▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒',
	'▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄░░░░▒▒▒▒▒▒▒▒▒▒',
	'▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░████▌░░░░░▒▒▒▒▒▒▒▒',
	'▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄██████▀▀░░░░░░░░▒▒▒▒▒▒',
	'▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░██████████░░▄▄██░░░░░░░░▒▒▒▒',
	'▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄████████████████▀▀░░░░░░░░▒▒▒▒',
	'▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄██████████████████░░░░░░░░░░░░░░▒▒',
	'▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄██████████████▌░░░░░░░░░░░░░░░▒▒',
	'▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄██████████████████░░░░░░░░░░░░░░░░▒▒',
	'▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄██████████████████████▌░░░░░░░░░░░░░░░░░▒▒',
	'▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄▄▄▄▄████████████████████████████▌░░░░░░░░░░░░░░░░░▒▒',
	'▒▒░░░░░░░░░░░░░░░░░░░░░░▄▄▄▄██████████████████████████████████████▌░░░░░░░░░░░░░░░░░░░▒▒',
	'▒▒░░░░░░░░░░░░░░░░░░▄▄████████████████████████████████████████████▌░░░░░░░░░░░░░░░░░░░▒▒',
	'▒▒░░░░░░░░░░░░░░░░████████████████████████████████████████████████░░░░░░░░░░░░░░░░░░░░▒▒',
	'▒▒██░░░░░░░░░░▐█████████████████████▌░░░▀▀▀▀██████████████████████░░░░░░░░░░░░░░░░░░░░▒▒',
	'▐█████░░░░░░▄▄████████████████████▌░░░░░░░░░░░░░░░░░░░▀▀████▐███▌░░░░░░░░░░░░░░░░░░░▒▒▒▒',
	'▒▒████████████░░██████████████████░░░░░░░░░░░░░░░░░░░░░░▐███▐███▌░░░░░░░░░░░░░░░░░░░▒▒▒▒',
	'▒▒▒▒▀▀▀▀▀▀▀▀░░░░░░████████████▀▀░░░░░░░░░░░░░░░░░░░░░░░░▐███▐███▌░░░░░░░░░░░░░░░░░▒▒▒▒▒▒',
	'▒▒▒▒▒▒▒▒▒▒░░░░░░░░▐███████████▌░░░░░░░░░░░░░░░░░░░░░░░░░▐███▐███▌░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒',
	'▒▒▒▒▒▒▒▒▒▒▒▒░░░░░░░░██████▀▀████░░░░░░░░░░░░░░░░░░░░░░░░░░██░░██▌░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒',
	'▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░▐█████░░░░░░████░░░░░░░░░░░░░░░░▄▄▄▄████████████████▄▄▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒',
	'▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒████▌░░░░░░░░░██▄▄░░░░░░░░░░░░▄▄██████████████████████████████████████',
	'▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐█████▒▒▒▒░░░░░░████▄▄▄▄██████████████████████████████████████████████',
	'▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▐█████▒▒▒▒▄▄████████████████████████████████████████████████████████',
	'▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▄▄▄▄████████████████████████████████████████████████████████████████',
	'████████████████████████████████████████████████████████████████████████████████████████',
	'',
}

db.custom_center = { {
	icon = "  ",
	desc = "Projects              ",
	action = "Telescope projects"
}, {
	icon = "  ",
	desc = "Recently files        ",
	action = "Telescope oldfiles"
}, {
	icon = "  ",
	desc = "Find file             ",
	action = "Telescope find_files"
}, {
	icon = "  ",
	desc = "Find text             ",
	action = "Telescope live_grep"
}, {
	icon = "  ",
	desc = "Edit keymaps          ",
	action = "edit ~/.config/nvim/lua/keymaps.lua"
}, {
	icon = "  ",
	desc = "Quit                  ",
	action = "q"
} }

db.custom_footer = {}
