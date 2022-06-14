local lsp = require('lspconfig')
local coq = require('coq')

lsp.texlab.setup{}
lsp.texlab.setup(coq.lsp_ensure_capabilities{})
lsp.pylsp.setup{}
lsp.pylsp.setup(coq.lsp_ensure_capabilities{})

vim.g.coq_settings = {
	auto_start = 'shut-up',
}

