# Not working because of error. Instead apply the file manually:
# $ kubectl apply -f app/ingress.yaml

# kubernetes_ingress.ingress: Creating...
# ╷
# │ Error: Failed to create Ingress 'nginx/ingress' because: the server could not find the requested resource (post ingresses.extensions)

# resource "kubernetes_ingress" "ingress" {
#   metadata {
#     name      = "ingress"
#     namespace = kubernetes_namespace.test.metadata.0.name
#     annotations = {
#       "kubernetes.io/ingress.class"                = "nginx"
#       "nginx.ingress.kubernetes.io/rewrite-target" = "/"
#     }
#   }

#   spec {
#     backend {
#       service_name = "error"
#       service_port = 9000
#     }

#     rule {
#       http {
#         path {
#           path = "/nginx"
#           backend {
#             service_name = "demo"
#             service_port = 80
#           }
#         }
#       }
#     }
#   }
# }