output "lb_probes_id" {
  description = "Map of id values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.id if v.id != null && length(v.id) > 0 }
}
output "lb_probes_interval_in_seconds" {
  description = "Map of interval_in_seconds values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.interval_in_seconds if v.interval_in_seconds != null }
}
output "lb_probes_load_balancer_rules" {
  description = "Map of load_balancer_rules values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.load_balancer_rules if v.load_balancer_rules != null && length(v.load_balancer_rules) > 0 }
}
output "lb_probes_loadbalancer_id" {
  description = "Map of loadbalancer_id values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.loadbalancer_id if v.loadbalancer_id != null && length(v.loadbalancer_id) > 0 }
}
output "lb_probes_name" {
  description = "Map of name values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.name if v.name != null && length(v.name) > 0 }
}
output "lb_probes_number_of_probes" {
  description = "Map of number_of_probes values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.number_of_probes if v.number_of_probes != null }
}
output "lb_probes_port" {
  description = "Map of port values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.port if v.port != null }
}
output "lb_probes_probe_threshold" {
  description = "Map of probe_threshold values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.probe_threshold if v.probe_threshold != null }
}
output "lb_probes_protocol" {
  description = "Map of protocol values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.protocol if v.protocol != null && length(v.protocol) > 0 }
}
output "lb_probes_request_path" {
  description = "Map of request_path values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.request_path if v.request_path != null && length(v.request_path) > 0 }
}

