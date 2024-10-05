# courtesy: https://gist.github.com/JamieMac96/adf9d3c9fe9aa6cd40a20047efabc9ec
alias k="kubectl"
alias v="vim"

function ns () {
  kubectl config set-context --current --namespace=$1
}

export drc="--dry-run=client -oyaml"
export drs="--dry-run=server -oyaml"

# :set nu 
# :set autoindent


# k shortcuts
# k api-resources
