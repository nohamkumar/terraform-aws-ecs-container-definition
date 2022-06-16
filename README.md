# Purpose:
To generate ECS Container Definition in json file. 
Setup CloudWatch log group for ECS.                                      

## Variable Inputs:

REQUIRED: 

- namespace             (ex: project name)
- environment           (ex: dev/prod)
- container_name        Name the container.
- container_image 
- cd_awslogs_region     ECS log creation region. (ex: us-east-1)
- port_mappings         Containter port mappings. 
  ex: [
    {
      "containerPort" = 80
      "protocol"      = "tcp"
    }
  ]

- essential:
  If the essential parameter of a container is marked as true, and that container fails or stops for any reason, all other containers that are part of the task are stopped.
  If the essential parameter of a container is marked as false, its failure doesn't affect the rest of the containers in a task.

  If this parameter is omitted, a container is assumed to be essential.
  All tasks must have at least one essential container.

  Default     = false              

OPTIONAL:

- container_memory      Container Hard memory limit. (ex: 512)
                        Default     = null

- container_memory_reservation:
  The soft limit memory (in MiB) to reserve for the container.
  When system memory is under contention, Docker attempts to keep the container memory to this soft limit.
  
  Default     = null

- container_cpu_units:
  The number of cpu units to reserve for the container.
  A container instance has 1,024 cpu units for every CPU core.
 
  Default     = null


## Resources created:

- cloudwatch log group                             

## Resources naming convention:

- CloudWatch log group: /ecs/namespace-environment
    ex: /ecs/sg-dev

# Steps to create the resources

1. Call the "ecs-container-deninition" module from your tf code.
3. Specifying Variable Inputs along the module call.
4. Apply.

Example:

```
module "ecs-container-definition" {
  namespace = "sg"
  source    = "git@github.com:nohamkumar/aws-ecs-container-definition.git"

  container_name               = "server"
  container_image              = "httpd:2.4"
  essential                    = true

  port_mappings = [
    {
      "containerPort" = 80
      "protocol"      = "tcp"
    }
  ]

  cd_awslogs_region = "us-east-1"
}

```

3. From terminal: 

```
terraform init
```
```
terraform plan
```
```
terraform apply
```


---


##OUTPUTS

```
- cd_json
  description = "Container Defenition in json"

```
