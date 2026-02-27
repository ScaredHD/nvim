return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup()
    vim.diagnostic.config({ virtual_text = false })

    local ok_renderer, renderer = pcall(require, "tiny-inline-diagnostic.renderer")
    if not ok_renderer or type(renderer.render) ~= "function" then
      return
    end

    local raw_render = renderer.render
    local blob_warned = false

    renderer.render = function(opts, bufnr)
      local ok, err = pcall(raw_render, opts, bufnr)
      if ok then
        return
      end

      local msg = tostring(err)
      if msg:find("E976: Using a Blob as a String", 1, true) then
        if not blob_warned then
          blob_warned = true
          vim.schedule(function()
            vim.notify(
              "tiny-inline-diagnostic: skipped rendering for Blob text (E976).",
              vim.log.levels.WARN
            )
          end)
        end
        return
      end

      error(err)
    end
  end,
}
