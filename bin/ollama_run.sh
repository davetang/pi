#!/usr/bin/env bash

set -euo pipefail

IP=192.168.0.126
PORT=11434
MODEL='llama3.2'

if [[ $# -eq 0 ]]; then
   >&2 echo "Usage: $0 <prompt>"
   exit 1
fi

QUERY="{
   \"model\": \"${MODEL}\",
   \"prompt\": \"${@}\"
}"

curl http://${IP}:${PORT}/api/generate -d "${QUERY}"
