local pos_equal = function(p1, p2)
	local r1, c1 = unpack(p1)
	local r2, c2 = unpack(p2)
	return r1 == r2 and c1 == c2
end

local goto_next_error_then_hint = function()
	local pos = vim.api.nvim_win_get_cursor(0)
	vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR, wrap = true })
	local pos2 = vim.api.nvim_win_get_cursor(0)
	if pos_equal(pos, pos2) then
		vim.diagnostic.jump({ count = 1, wrap = true })
	end
end

local goto_prev_error_then_hint = function()
	local pos = vim.api.nvim_win_get_cursor(0)
	vim.diagnostic.judp({ count = -1, severity = vim.diagnostic.severity.ERROR, wrap = true })
	local pos2 = vim.api.nvim_win_get_cursor(0)
	if pos_equal(pos, pos2) then
		vim.diagnostic.jump({ count = -1, wrap = true })
	end
end

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
	desc = "Auto-save when leaving a buffer or when the editor loses focus",
	group = vim.api.nvim_create_augroup("auto-save", { clear = true }),
	callback = function()
		if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
			vim.api.nvim_command("silent update")
		end
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
		end
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		-- if
		-- 	not client:supports_method("textDocument/willSaveWaitUntil")
		-- 	and client:supports_method("textDocument/formatting")
		-- then
		-- 	vim.api.nvim_create_autocmd("BufWritePre", {
		-- 		group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
		-- 		buffer = args.buf,
		-- 		callback = function()
		-- 			vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
		-- 		end,
		-- 	})
		-- end
		-- require("fzf-lua")
		-- Jump to the type of the word under your cursor.
		--  Useful when you're not sure what type a variable is and you want to see
		--  the definition of its *type*, not where it was *defined*.
		map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		-- map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("gd", "<cmd>FzfLua lsp_definitions jump1=true ignore_current_line=true<cr>", "[G]oto [D]efinition")
		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map(
			"grr",
			"<cmd>FzfLua lsp_references jump1=true ignore_current_line=true hidden=nohidden<cr>",
			"[G]oto [R]eference"
		)
		map("gj", goto_next_error_then_hint, "[G]oto next diagnostics error")
		map("gk", goto_prev_error_then_hint, "[G]oto previous diagnostics error")
	end,
})
