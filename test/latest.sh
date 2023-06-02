#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

source='https://sourceforge.net/projects/torrentcheck/files/latest/download'
expected='a839f9ac9669d942f83af33db96ce9902d84f85592c99b568ef0f5232ff318c5'

sha256="$(curl -f -L -s "${source}" | shasum -a 256 -b | cut -d' ' -f1)"
if [[ "${sha256}" == "${expected}" ]]; then
	echo "Verified sha256"
else
	echo "Unexpect sha256: ${sha256}"
	exit 1
fi
