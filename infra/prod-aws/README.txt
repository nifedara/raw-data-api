README
======

This directory contains Terraform files that stand up raw-data services
on AWS. The following components are managed:

1. module.vpc - Networking components, subnets, gateways, routes
2. module.db - AWS RDS Aurora serverless database with bells and whistles.
3. resource.aws_ecs_cluster - An ECS cluster to contain the services
4. module.alb - Application load balancer for the API
5. module.alb-flower - Application load balancer for the monitoring service.
6. module.ecs-api - API containers
7. module.ecs-worker-daemon - Containers for daemon workers
8. module.ecs-worker-ondemand - Containers for on-demand workers
9. module.ecs-flower - Containers for flower: the queue monitoring service.
10. redis resources - Managed by AWS Elasticache and associated services.
11. An ECS instance (VM) running the backend service.
12. An ECS instance for SSH tunnels (jump-hosts)
13. Route53 resources for DNS mapping for the load balancers.

RUNNING TERRAFORM
=================

TBD

Variables
---------

- TBD

TODO
====

- Remove OSM app credentials from worker containers
- Event-driven scaling for workers
- ...
