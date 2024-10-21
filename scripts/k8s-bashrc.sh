# courtesy: https://gist.github.com/JamieMac96/adf9d3c9fe9aa6cd40a20047efabc9ec and many others
alias k="kubectl"
alias v="vim"
alias c="clear"
alias kgp="kubectl get pod"
alias kgd="kubectl get deploy"
alias kgs="kubectl get svc"
alias kgn="kubectl get nodes"
alias kdp="kubectl delete pod --grace-period 0 --force"

# Enable auto completion
source <(kubectl completion bash)
# source <(kubectl completion bash | sed 's/kubectl/k/g' )

function ns () {
  kubectl config set-context --current --namespace=$1
}

export drc="--dry-run=client -oyaml"
export drs="--dry-run=server -oyaml"

# :set nu 
# :set autoindent


# kubectl shortcuts
# k api-resources
# k explain <command>
# k replace --force -f /tmp/kubectl-edit-67890789.yml
