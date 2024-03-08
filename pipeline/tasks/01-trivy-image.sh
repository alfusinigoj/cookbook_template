#!/usr/bin/env sh

set -u
: ${VERSION:?VERSION is not set}

trivy image ${CI_REGISTRY}/rapidportfoliomod/rpm-explorer:${VERSION}
