variable "location" {
  description = "Región de Azure para los recursos"
  default     = "northcentralus"
}

variable "acr_name" {
  description = "Nombre único para el Azure Container Registry"
  default     = "acrcesargcp2" # Nombre único sin guion
}

variable "vm_size" {
  description = "Tamaño de la VM"
  default     = "Standard_B2ats_v2"  # 2 vCPUs, free tier estudiante
}

variable "aks_node_size" {
  description = "Tamaño del nodo AKS sistema"
  default     = "Standard_D2s_v3"    # 2 vCPUs, compatible con system pool
}

variable "aks_node_count" {
  description = "Número de nodos AKS"
  default     = 1                     # mínimo para no exceder 6 vCPUs
}
