BOOTSTRAP=1
NAME=$(shell basename `pwd`)
PATTERN=industrial-edge-rhel
COMPONENT=datacenter
SECRETS=~/values-secret.yaml
TARGET_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)
TARGET_REPO=$(shell git remote show origin | grep Push | sed -e 's/.*URL:[[:space:]]*//' -e 's%^git@%%' -e 's%^https://%%' -e 's%:%/%' -e 's%^%https://%')

load-secrets:
	common/scripts/ansible-push-vault-secrets.sh

pipeline-setup:
ifeq ($(BOOTSTRAP),1)
	helm install $(NAME)-secrets charts/secrets/pipeline-setup $(HELM_OPTS)
endif

# Deploy GitOps with Applications defining demo environment
install: crds
	oc create -k common/install/demo/
# ifeq ($(BOOTSTRAP),1)
# 	make argosecret
# endif
	

crds: 
	oc create -f common/install/crds/