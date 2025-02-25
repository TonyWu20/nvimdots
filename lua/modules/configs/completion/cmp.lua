return function()
	local icons = {
		kind = require("modules.utils.icons").get("kind"),
		type = require("modules.utils.icons").get("type"),
		cmp = require("modules.utils.icons").get("cmp"),
	}

	local border = function(hl)
		return {
			{ "┌", hl },
			{ "─", hl },
			{ "┐", hl },
			{ "│", hl },
			{ "┘", hl },
			{ "─", hl },
			{ "└", hl },
			{ "│", hl },
		}
	end

	local compare = require("cmp.config.compare")
	compare.lsp_scores = function(entry1, entry2)
		local diff
		if entry1.completion_item.score and entry2.completion_item.score then
			diff = (entry2.completion_item.score * entry2.score) - (entry1.completion_item.score * entry1.score)
		else
			diff = entry2.score - entry1.score
		end
		return (diff < 0)
	end

	local use_copilot = require("core.settings").use_copilot
	local comparators = use_copilot == true
			and {
				require("copilot_cmp.comparators").prioritize,
				require("copilot_cmp.comparators").score,
				compare.sort_text, -- 将 sort_text 手动提前
				-- require("cmp_tabnine.compare"),
				compare.offset, -- Items closer to cursor will have lower priority
				compare.exact,
				-- compare.scopes,
				compare.lsp_scores,
				compare.score,
				compare.recently_used,
				-- compare.locality, -- Items closer to cursor will have higher priority, conflicts with `offset`
				require("cmp-under-comparator").under,
				compare.kind,
				compare.length,
				compare.order,
			}
		or {
			-- require("cmp_tabnine.compare"),
			compare.sort_text, -- 将 sort_text 手动提前
			compare.offset, -- Items closer to cursor will have lower priority
			compare.exact,
			-- compare.scopes,
			compare.lsp_scores,
			compare.score,
			compare.recently_used,
			-- compare.locality, -- Items closer to cursor will have higher priority, conflicts with `offset`
			require("cmp-under-comparator").under,
			compare.kind,
			compare.length,
			compare.order,
		}

	local cmp = require("cmp")
	require("modules.utils").load_plugin("cmp", {
		preselect = cmp.PreselectMode.None,
		window = {
			completion = {
				border = border("PmenuBorder"),
				winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:PmenuSel",
				scrollbar = false,
			},
			documentation = {
				border = border("CmpDocBorder"),
				winhighlight = "Normal:CmpDoc",
			},
		},
		sorting = {
			priority_weight = 2,
			comparators = comparators,
		},
		formatting = {
			fields = { "abbr", "kind", "menu" },
			format = function(entry, vim_item)
				local lspkind_icons = vim.tbl_deep_extend("force", icons.kind, icons.type, icons.cmp)
				-- load lspkind icons
				vim_item.kind =
					string.format(" %s  %s", lspkind_icons[vim_item.kind] or icons.cmp.undefined, vim_item.kind or "")

				-- set up labels for completion entries
				vim_item.menu = setmetatable({
					cmp_tabnine = "[TN]",
					copilot = "[CPLT]",
					buffer = "[BUF]",
					orgmode = "[ORG]",
					nvim_lsp = "[LSP]",
					nvim_lua = "[LUA]",
					path = "[PATH]",
					tmux = "[TMUX]",
					treesitter = "[TS]",
					latex_symbols = "[LTEX]",
					luasnip = "[SNIP]",
					spell = "[SPELL]",
					pandoc_references = "[PANDOC]",
				}, {
					__index = function()
						return "[BTN]" -- builtin/unknown source names
					end,
				})[entry.source.name]

				-- cut down long results
				local label = vim_item.abbr
				local truncated_label = vim.fn.strcharpart(label, 0, 80)
				if truncated_label ~= label then
					vim_item.abbr = truncated_label .. "..."
				end

				-- deduplicate results from nvim_lsp
				if entry.source.name == "nvim_lsp" then
					vim_item.dup = 0
				end

				return vim_item
			end,
		},
		matching = {
			disallow_partial_fuzzy_matching = false,
		},
		performance = {
			async_budget = 1,
			max_view_entries = 120,
		},
		-- You can set mappings if you want
		mapping = cmp.mapping.preset.insert({
			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-w>"] = cmp.mapping.abort(),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				elseif require("luasnip").expand_or_locally_jumpable() then
					require("luasnip").expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				elseif require("luasnip").jumpable(-1) then
					require("luasnip").jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<CR>"] = cmp.mapping({
				i = function(fallback)
					if cmp.visible() and cmp.get_active_entry() then
						cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false })
					else
						fallback()
					end
				end,
				s = cmp.mapping.confirm({ select = true }),
				c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
			}),
		}),
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		-- You should specify your *installed* sources.
		sources = {
			{ name = "nvim_lsp", max_item_count = 350 },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "treesitter" },
			{ name = "spell" },
			{ name = "tmux" },
			{ name = "orgmode" },
			{
				name = "buffer",
				option = {
					get_bufnrs = function()
						return vim.api.nvim_buf_line_count(0) < 7500 and vim.api.nvim_list_bufs() or {}
					end,
				},
			},
			{ name = "latex_symbols" },
			{ name = "pandoc_references" },
			-- { name = "copilot" },
			-- { name = "codeium" },
			-- { name = "cmp_tabnine" },
		},
		-- experimental = {
		-- 	ghost_text = {
		-- 		hl_group = "Whitespace",
		-- 	},
		-- },
	})

	-- NOTE: there is no 'z' in the alphabet
	-- The alphabet your schema used
	local alphabet = "abcdefghijklmnopqrstuvwxy"

	-- Feed keys with term code
	-- keys: the keys to feed
	-- mode: n for no-remap, m for re-map
	local function feedkeys(keys, mode)
		local termcodes = vim.api.nvim_replace_termcodes(keys, true, true, true)
		vim.api.nvim_feedkeys(termcodes, mode, false)
	end

	-- return true if the content contains Chinese characters
	local function contain_chinese_character(content)
		for i = 1, #content do
			local byte = string.byte(content, i)
			if byte >= 0xE4 and byte <= 0xE9 then
				return true
			end
		end
		return false
	end

	-- Return true if the cmp-entry is acceptable
	-- you can define some other rules here to accept more
	-- in this situation we only think the entry
	-- whose content contains Chinese or is like time is acceptable
	local function rime_entry_acceptable(entry)
		return entry ~= nil
			and entry.source.name == "nvim_lsp"
			and entry.source.source.client.name == "rime_ls"
			and (entry.word:match("%d%d%d%d%-%d%d%-%d%d %d%d:%d%d:%d%d%") or contain_chinese_character(entry.word))
	end

	-- Return the first n entries which make rime_entry_acceptable(entry) return true
	-- we call those entries rime-ls entries below
	local function get_n_rime_ls_entries(n)
		if not cmp.visible() then
			return {}
		end
		local entries = cmp.get_entries()
		local result = {}
		if entries == nil or #entries == 0 then
			return result
		end
		for _, entry in ipairs(entries) do
			if rime_entry_acceptable(entry) then
				result[#result + 1] = entry
				if #result == n then
					break
				end
			end
		end
		return result
	end

	-- Confirm the rime-ls entry
	-- We use nvim_set_current_line to get the completion text,
	-- because cmp.comfirm is slow and configured with throttle
	-- for which make the completion list not pop up when typing fast
	local function confirm_rime_ls_entry(entry)
		local line = vim.api.nvim_get_current_line()
		local cursor_column = vim.api.nvim_win_get_cursor(0)[2]
		local start = entry.source_insert_range.start.character
		local new_line = string.sub(line, 1, start) .. entry.word .. string.sub(line, cursor_column + 1)
		vim.api.nvim_set_current_line(new_line)
		vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1], start + #entry.word })
	end

	-- check if the content of txt is all in allowed
	local function match_alphabet(txt, allowed)
		return string.match(txt, "^[" .. allowed .. "]+$") ~= nil
	end

	-- check if the last character will trigger rime-ls
	local function last_character_in_alphabet()
		local cursor_column = vim.api.nvim_win_get_cursor(0)[2]
		if cursor_column == 0 then
			return false
		end
		local trigger_alphabet = alphabet
		-- INFO:
		-- If you bind number with select_or_confirm_rime(x, false)
		-- uncomment this line to select more than once
		-- trigger_alphabet = trigger_alphabet .. "1234567890"

		return match_alphabet(
			string.sub(vim.api.nvim_get_current_line(), cursor_column, cursor_column),
			trigger_alphabet
		)
	end

	-- index: the index-th rime-ls entry
	-- select_with_no_num: set true to upload the index-th rime-ls entry directly
	--                     set false to feed index as number at first, then upload if only one rime-ls entry
	-- return true if the number of rime-ls entries is enough
	local function select_or_confirm_rime(index, select_with_no_num)
		if not last_character_in_alphabet() then
			return false
		end
		local rime_ls_entries = get_n_rime_ls_entries(index)
		if #rime_ls_entries < index then
			return false
		end
		if select_with_no_num then
			confirm_rime_ls_entry(rime_ls_entries[index])
			return true
		end
		local cursor_column = vim.api.nvim_win_get_cursor(0)[2]
		local line = vim.api.nvim_get_current_line()
		local new_line = string.sub(line, 1, cursor_column) .. tostring(index) .. string.sub(line, cursor_column + 1)
		vim.api.nvim_set_current_line(new_line)
		vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1], cursor_column + 1 })
		-- must trigger complete manually here,
		-- otherwise we can not get the new list after inputting a number
		cmp.complete({ config = { sources = { { name = "nvim_lsp" } } } })
		local first_rime_ls_entry = get_n_rime_ls_entries(2)
		if #first_rime_ls_entry ~= 1 then
			return true
		end
		confirm_rime_ls_entry(first_rime_ls_entry[1])
		return true
	end

	-- When k and v are not equal and v is not nil, feed v with remap mode,
	-- otherwise feed k with no-remap mode.
	-- This function is used when the original key is mapped to other functionality
	local function feed_key_helper(k, v)
		if v == nil or k == v then
			feedkeys(k, "n")
		else
			feedkeys(v, "m")
		end
	end
	local mapped_punc = {
		[","] = "，",
		["."] = "。",
		[":"] = "：",
		[";"] = "；",
		["?"] = "？",
		["\\"] = "、",
		-- ...
		-- add more you want here
	}
	-- Chinese punctuations
	-- let map = require("bind").nvim_load_mapping
	-- for k, v in pairs(mapped_punc) do
	-- 	map.set({ "i" }, k .. "<space>", function()
	-- 		-- when typing comma or period with space,
	-- 		-- upload the first rime_ls entry and make comma and period in Chinese edition
	-- 		-- if you don't want this just comment those lines

	-- 		if k == "," or k == "." then
	-- 			select_or_confirm_rime(1, true)
	-- 		end

	-- 		feed_key_helper(v, v)
	-- 	end, opts())
	-- end
end
