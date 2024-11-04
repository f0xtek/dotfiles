return {
	"nvim-neo-tree/neo-tree.nvim",
	tag = "3.26",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>nt", "<Cmd>Neotree<CR>", { silent = true })
	end,
}
