local function validate_shared_dict()
  if not ngx.shared.prometheus_metrics then
    return nil,
           "ngx shared dict 'prometheus_metrics' not found"
  end
  return true
end


return {
  name = "prometheus",
  fields = {
    { config = {
        type = "record",
        fields = {
          { per_consumer = { type = "boolean", default = false }, },
          { latency_buckets = {
              type = "array",
              default = { 1, 2, 5, 7, 10, 15, 20, 25, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 1000, 2000, 5000, 10000, 30000, 60000 },
              elements = { type = "integer", between = { 1, 3600000 } },
              len_min = 1,
              required = true,
          } },
        },
        custom_validator = validate_shared_dict,
    }, },
  },
}
