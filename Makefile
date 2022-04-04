NAME=$(shell basename `pwd`)
PATTERN=industrial-edge-rhel
COMPONENT=datacenter
SECRETS=~/values-secret.yaml
TARGET_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)
TARGET_REPO=$(shell git remote show origin | grep Push | sed -e 's/.*URL:[[:space:]]*//' -e 's%^git@%%' -e 's%^https://%%' -e 's%:%/%' -e 's%^%https://%')

# Deploy GitOps with Applications defining demo environment
install:
	oc apply -k common/install/overlays/demo/
