local prometheus = require "kong.plugins.prometheus-custom.exporter"


return {
  ["/metrics"] = {
    GET = function()
      prometheus.collect()
    end,
  },
}
