#!/bin/bash

BASE="terraform-files"

mkdir -p "$BASE/modules"

touch "$BASE/modules/main.tf" \
      "$BASE/modules/variables.tf" \
      "$BASE/modules/output.tf"



for ENV in dev staging prod; do
  mkdir -p "$BASE/environments/vm"
  ssh 
  mkdir -p "$BASE/environments/$ENV"
  touch "$BASE/environments/$ENV/main.tf" \
        "$BASE/environments/$ENV/variables.tf" \
        "$BASE/environments/$ENV/terraform.tfvars"
done

mkdir -p "$BASE/scripts"
touch "$BASE/scripts/user_data.sh"

# create key ssh in vm folder at root
mkdir -p "$BASE/vm"
touch "$BASE/vm/key.pem"

echo "Terraform project structure created successfully."
