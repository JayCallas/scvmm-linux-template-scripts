#!/bin/bash

# Kubernetes prep for Konvoy nodes (master or worker)
# ------------------------------------------------------


# Custom steps
sh ./k8s-prep.sh
sh ./cv-prep.sh
sh ./standard-prep.sh