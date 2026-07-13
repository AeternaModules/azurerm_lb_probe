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
  # --- Unconfirmed validation candidates, derived from azurerm_lb_probe's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: loadbalancer_id
  #   source:    [from loadbalancers.ValidateLoadBalancerID] !ok
  # path: loadbalancer_id
  #   source:    [from loadbalancers.ValidateLoadBalancerID] err != nil
  # path: protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: port
  #   source:    validate.PortNumber: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: probe_threshold
  #   condition: value >= 1 && value <= 100
  #   message:   must be between 1 and 100
  # path: interval_in_seconds
  #   condition: value >= 5
  #   message:   must be at least 5
  # path: load_balancer_rules[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
}

