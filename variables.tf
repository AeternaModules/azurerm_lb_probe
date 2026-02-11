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
}

