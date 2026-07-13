variable "lb_probes" {
  description = <<EOT
Map of lb_probes, attributes below
Required:
    - loadbalancer_id
    - name
    - port
Optional:
    - interval_in_seconds
    - number_of_probes
    - probe_threshold
    - protocol
    - request_path
EOT

  type = map(object({
    loadbalancer_id     = string
    name                = string
    port                = number
    interval_in_seconds = optional(number)
    number_of_probes    = optional(number)
    probe_threshold     = optional(number)
    protocol            = optional(string)
    request_path        = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.lb_probes : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.lb_probes : (
        v.probe_threshold == null || (v.probe_threshold >= 1 && v.probe_threshold <= 100)
      )
    ])
    error_message = "must be between 1 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.lb_probes : (
        v.interval_in_seconds == null || (v.interval_in_seconds >= 5)
      )
    ])
    error_message = "must be at least 5"
  }
  validation {
    condition = alltrue([
      for k, v in var.lb_probes : (
        alltrue([for x in v.load_balancer_rules : length(x) > 0])
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

