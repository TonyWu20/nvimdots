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
local new_comparators = use_copilot == true
		and {
			require("copilot_cmp.comparators").prioritize,
			require("copilot_cmp.comparators").score,
			-- require("cmp_tabnine.compare"),
			compare.sort_text, -- 中文补全顺序显示
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
		compare.sort_text, -- 中文补全顺序显示
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

return {
	sorting = {
		priority_weight = 2,
		comparators = new_comparators,
	},
}
