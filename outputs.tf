output "lb_probes" {
  description = "All lb_probe resources"
  value       = azurerm_lb_probe.lb_probes
}
output "lb_probes_interval_in_seconds" {
  description = "List of interval_in_seconds values across all lb_probes"
  value       = [for k, v in azurerm_lb_probe.lb_probes : v.interval_in_seconds]
}
output "lb_probes_load_balancer_rules" {
  description = "List of load_balancer_rules values across all lb_probes"
  value       = [for k, v in azurerm_lb_probe.lb_probes : v.load_balancer_rules]
}
output "lb_probes_loadbalancer_id" {
  description = "List of loadbalancer_id values across all lb_probes"
  value       = [for k, v in azurerm_lb_probe.lb_probes : v.loadbalancer_id]
}
output "lb_probes_name" {
  description = "List of name values across all lb_probes"
  value       = [for k, v in azurerm_lb_probe.lb_probes : v.name]
}
output "lb_probes_number_of_probes" {
  description = "List of number_of_probes values across all lb_probes"
  value       = [for k, v in azurerm_lb_probe.lb_probes : v.number_of_probes]
}
output "lb_probes_port" {
  description = "List of port values across all lb_probes"
  value       = [for k, v in azurerm_lb_probe.lb_probes : v.port]
}
output "lb_probes_probe_threshold" {
  description = "List of probe_threshold values across all lb_probes"
  value       = [for k, v in azurerm_lb_probe.lb_probes : v.probe_threshold]
}
output "lb_probes_protocol" {
  description = "List of protocol values across all lb_probes"
  value       = [for k, v in azurerm_lb_probe.lb_probes : v.protocol]
}
output "lb_probes_request_path" {
  description = "List of request_path values across all lb_probes"
  value       = [for k, v in azurerm_lb_probe.lb_probes : v.request_path]
}

