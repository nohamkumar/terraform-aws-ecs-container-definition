
#----
#CONTAINER DEFENITION
#----
variable "container_name" {
  description = "Name of the container"
  type        = string

}
variable "container_image" {
  description = "Container image URI"
  type        = string
}

variable "container_memory" {
  description = "Container Hard memory limit"
  type        = number
  default     = null
}

variable "container_memory_reservation" {
  description = <<-EOF
  "The soft limit memory (in MiB) to reserve for the container.
  When system memory is under contention, Docker attempts to keep the container memory to this soft limit"
  EOF
  type        = number
  default     = null
}

variable "container_cpu_units" {
  description = <<-EOF
  "The number of cpu units to reserve for the container.
  A container instance has 1,024 cpu units for every CPU core."
  EOF
  default     = null
}

variable "port_mappings" {
  description = <<-EOF
    List of map containing ConatinerPort, Protocol
    Ex: [
        {
        containerPort = 443
        protocol      = tcp
        },
    ]
    EOF

  type = list(object({
    containerPort = number
    protocol      = string
  }))
}

variable "container_env_vars" {
  description = <<-EOF
    List of map containing environment variable "name" "value"
    Ex: [
        {
            name      = "test"
            value     = "an_arn"
        },
    ]
    EOF  

  type = list(object({
    name  = string
    value = string
  }))

  default = []
}

variable "container_secrets" {
  description = <<-EOF
    List of map containing environment secrets "name" "valueFrom"
    Ex: [
        {
            name      = "test"
            valueFrom = "an_arn"
        },
    ]
    EOF  

  type = list(object({
    name      = string
    valueFrom = string
  }))

  default = []
}

variable "essential" {
  description = <<-EOF
If the essential parameter of a container is marked as true, and that container fails or stops for any reason, all other containers that are part of the task are stopped.
If the essential parameter of a container is marked as false, its failure doesn't affect the rest of the containers in a task.

If this parameter is omitted, a container is assumed to be essential.
All tasks must have at least one essential container.
EOF
  default     = false
}

variable "cd_awslogs_region" {
  description = "Containter Definition AWSlogs creation region. Ex: us-east-1"
  type        = string
}
