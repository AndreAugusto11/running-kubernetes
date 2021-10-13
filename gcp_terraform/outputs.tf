output "region" {
  value       = var.region
  description = "GCloud Region"
}

output "project_id" {
  value       = var.project_id
  description = "GCloud Project ID"
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_endpoint" {
  value       = google_container_cluster.primary.endpoint
  description = "GKE Cluster Endpoint"
}

output "kubernetes_cluster_host" {
  value       = "https://${google_container_cluster.primary.endpoint}"
  description = "GKE Cluster Host"
}

output "loadbalancer_demo_ip" {
  value       = kubernetes_service.demo.status.0.load_balancer.0.ingress.0.ip
  description = "GKE Cluster Host"
}

output "loadbalancer_demo2_ip" {
  value       = kubernetes_service.demo2.status.0.load_balancer.0.ingress.0.ip
  description = "GKE Cluster Host"
}

output "loadbalancer_error_ip" {
  value       = kubernetes_service.error.status.0.load_balancer.0.ingress.0.ip
  description = "GKE Cluster Host"
}