#!/bin/bash
# Run the bluesky queueserver host process

CONDA_ENV=bits2511
INSTRUMENT=bits2511
export CONDA_PREFIX=${HOME}/.conda/envs/${CONDA_ENV}
export LD_LIBRARY_PATH="${CONDA_PREFIX}/lib"

BASE_DIR="$(dirname "$(readlink -f "$0/..")")"
QS_DIR="${BASE_DIR}/src/${INSTRUMENT}/qserver"
QS_CONFIG="${QS_DIR}/qs-config.yml"
QS_USER_YAML="${QS_DIR}/user_group_permissions.yaml"
QS_PLANS_YAML="${QS_DIR}/existing_plans_and_devices.yaml"

start-re-manager \
    --config="${QS_CONFIG}" \
    --user-group-permissions="${QS_USER_YAML}" \
    --existing-plans-devices="${QS_PLANS_YAML}"
