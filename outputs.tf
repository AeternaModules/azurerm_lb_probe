output "lb_probes_interval_in_seconds" {
  description = "Map of interval_in_seconds values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.interval_in_seconds }
}
output "lb_probes_load_balancer_rules" {
  description = "Map of load_balancer_rules values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.load_balancer_rules }
}
output "lb_probes_loadbalancer_id" {
  description = "Map of loadbalancer_id values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.loadbalancer_id }
}
output "lb_probes_name" {
  description = "Map of name values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.name }
}
output "lb_probes_number_of_probes" {
  description = "Map of number_of_probes values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.number_of_probes }
}
output "lb_probes_port" {
  description = "Map of port values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.port }
}
output "lb_probes_probe_threshold" {
  description = "Map of probe_threshold values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.probe_threshold }
}
output "lb_probes_protocol" {
  description = "Map of protocol values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.protocol }
}
output "lb_probes_request_path" {
  description = "Map of request_path values across all lb_probes, keyed the same as var.lb_probes"
  value       = { for k, v in azurerm_lb_probe.lb_probes : k => v.request_path }
}

