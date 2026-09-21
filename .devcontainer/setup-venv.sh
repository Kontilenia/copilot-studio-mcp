#!/usr/bin/env bash
# Creates/updates a .venv at the repo root and installs src/requirements.txt into it.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VENV_DIR="${REPO_ROOT}/.venv"
REQUIREMENTS_FILE="${REPO_ROOT}/src/requirements.txt"

if [[ ! -d "${VENV_DIR}" ]]; then
  python3 -m venv "${VENV_DIR}"
fi

# shellcheck disable=SC1091
source "${VENV_DIR}/bin/activate"

pip install --upgrade pip
pip install -r "${REQUIREMENTS_FILE}"
