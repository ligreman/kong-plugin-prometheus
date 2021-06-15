package = "kong-prometheus-custom-plugin"
version = "1.3.0-1"

source = {
  url = "git://github.com/Kong/kong-plugin-prometheus",
  tag = "1.3.0"
}

supported_platforms = {"linux", "macosx"}
description = {
  summary = "Prometheus metrics for Kong and upstreams configured in Kong",
  license = "Apache 2.0",
}

dependencies = {
  "lua-resty-counter >= 0.2.0",
}

build = {
  type = "builtin",
  modules = {
    ["kong.plugins.prometheus-custom.api"] = "kong/plugins/prometheus-custom/api.lua",
    ["kong.plugins.prometheus-custom.status_api"] = "kong/plugins/prometheus-custom/status_api.lua",
    ["kong.plugins.prometheus-custom.exporter"] = "kong/plugins/prometheus-custom/exporter.lua",
    ["kong.plugins.prometheus-custom.enterprise.exporter"] = "kong/plugins/prometheus-custom/enterprise/exporter.lua",
    ["kong.plugins.prometheus-custom.handler"] = "kong/plugins/prometheus-custom/handler.lua",
    ["kong.plugins.prometheus-custom.prometheus"] = "kong/plugins/prometheus-custom/prometheus.lua",
    ["kong.plugins.prometheus-custom.serve"] = "kong/plugins/prometheus-custom/serve.lua",
    ["kong.plugins.prometheus-custom.schema"] = "kong/plugins/prometheus-custom/schema.lua",
  }
}
