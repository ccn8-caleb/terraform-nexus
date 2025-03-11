#!/bin/bash

terraform init \
    -backend-config="address=${TF_VAR_backend_address}" \
    -backend-config="path=${TF_VAR_backend_path}" \
    -backend-config="scheme=https" \
    -backend-config="bucket=${TF_VAR_backend_bucket}" \
    -backend-config="key=${TF_VAR_backend_key}" \
    -backend-config="region=${TF_VAR_backend_region}"