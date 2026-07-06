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
    interval_in_seconds = optional(number) # Default: 15
    number_of_probes    = optional(number) # Default: 2
    probe_threshold     = optional(number) # Default: 1
    protocol            = optional(string) # Default: "Tcp"
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
        length(v.load_balancer_rules) > 0
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_lb_probe's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: loadbalancer_id
  #   source:    [from loadbalancers.ValidateLoadBalancerID] !ok
  # path: loadbalancer_id
  #   source:    [from loadbalancers.ValidateLoadBalancerID] err != nil
  # path: protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: port
  #   source:    validate.PortNumber: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
}

