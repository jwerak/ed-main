# Edge Demo 

This is main repo describing how to setup and run Edge Demo. 

The purpose of the Demo is to demonstrate capabilities of Red Hat technologies for the management of Edge environments and workloads.

Many concepts are adopted from [Red Hat industrial edge demos](https://hybrid-cloud-patterns.io/industrial-edge/).

- [Edge Demo](#edge-demo)
  - [Repositories](#repositories)
  - [Setup Demo](#setup-demo)
    - [Prerequisites](#prerequisites)
    - [Setup OCP Cluster](#setup-ocp-cluster)
    - [Architecture of this repo](#architecture-of-this-repo)

## Repositories

- **[ed-main](https://github.com/jwerak/ed-main)**
  - This repository. 
- **[ed-app](https://github.com/jwerak/ed-app)**
  - Simple application to be deployed on edge nodes.
- **[ed-ansible](https://github.com/jwerak/ed-ansible-controller)**
  - Ansible Controller configuration

## Setup Demo

### Prerequisites

Tools:
- *oc*

Environments:
- OpenShift Cluster (Tested on OCP 4.9)
- Ansible Controller with Linux hosts

### Setup OCP Cluster

- Authenticate to cluster
  - `oc login --token=sha256~TOKEN --server=https://api.cluster.example.com:6443`
- Setup Operator and application
  - `make install`
- Setup Ansible Controller part
  - Currently documented in [app repo](https://github.com/jwerak/ed-app)

### Architecture of this repo

- Main kustomizations files are under *./overlays/*, e.g. *./overlays/demo/*
- overlays should ideally deploy entire demo environment
- The scope of kustomize in *./overlays* should be: 
  - Deploy OpenShift GitOps - *base*
  - Deploy other components via Application CRD (GitOps)
  - GitOps will sync applications to provision other demo components.
- The customize in `./products` don't need to be in this repo, it is here only for convenience
