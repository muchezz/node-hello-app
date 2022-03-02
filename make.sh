#!/bin/bash

install-kubectl() {
    if [[ -z $(which kubectl) ]]
    then
        log install eksctl
        warn warn sudo is required
        local VERSION=$(curl --silent https://storage.googleapis.com/kubernetes-release/release/stable.txt)
        cd /usr/local/bin
        sudo curl https://storage.googleapis.com/kubernetes-release/release/$VERSION/bin/linux/amd64/kubectl \
            --progress-bar \
            --location \
            --remote-name
        sudo chmod +x kubectl
    else
        log skip kubectl already installed
    fi
}


install-eksctl() {
    if [[ -z $(which eksctl) ]]
    then
        log install eksctl
        warn warn sudo is required
        sudo wget -q -O - https://api.github.com/repos/weaveworks/eksctl/releases \
            | jq --raw-output 'map( select(.prerelease==false) | .assets[].browser_download_url ) | .[]' \
            | grep inux \
            | head -n 1 \
            | wget -q --show-progress -i - -O - \
            | sudo tar -xz -C /usr/local/bin

        # bash completion
        [[ -z $(grep eksctl_init_completion ~/.bash_completion 2>/dev/null) ]] \
            && eksctl completion bash >> ~/.bash_completion
    else
        log skip eksctl already installed
    fi
}
# # create the EKS cluster
# cluster-create() {
#     # check if cluster already exists (return something if the cluster exists, otherwise return nothing)
#     local exists=$(aws eks describe-cluster \
#         --name $PROJECT_NAME \
#         --profile $AWS_PROFILE \
#         --region $AWS_REGION \
#         2>/dev/null)
        
#     [[ -n "$exists" ]] && { error abort cluster $PROJECT_NAME already exists; return; }

#     # create a cluster named $PROJECT_NAME
#     log create eks cluster $PROJECT_NAME

#     eksctl create cluster \
#         --name $PROJECT_NAME \
#         --region $AWS_REGION \
#         --managed \
#         --node-type t2.small \
#         --nodes 1 \
#         --profile $AWS_PROFILE
# }

# # get the cluster ELB URL
# cluster-elb() {
#     kubectl get svc \
#         --namespace $PROJECT_NAME \
#         --output jsonpath="{.items[?(@.metadata.name=='website')].status.loadBalancer.ingress[].hostname}"
# }

# # delete the EKS cluster
# cluster-delete() {
#     eksctl delete cluster \
#         --name $PROJECT_NAME \
#         --region $AWS_REGION \
#         --profile $AWS_PROFILE
# }
