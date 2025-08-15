alias apinitk8s="ap_func_init_k8s"
ap_func_init_k8s() {
    if alias apinitk8sshare &>/dev/null; then
        apinitk8sshare
    fi

    if alias apinitk8scommon &>/dev/null; then
        apinitk8scommon
    fi

    if alias apinitk8smain &>/dev/null; then
        apinitk8smain
    fi
}

alias apcreatedirstructk8s="ap_func_create_dirstruct_k8s"
ap_func_create_dirstruct_k8s() {
    apshowmsginfo "Generate [kubectl and minikube] bash autocomplete\n"

    kubectl completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_kubectl.bash"

    # Find and append " mkb" at the end of lines containing "__start_kubectl kubectl"
    if [ -f "${AP_COMPLETIONS_DIR}/ap_completion_kubectl.bash" ]; then
        gsed -i.bak 's/\(__start_kubectl kubectl\)$/\1 kb/g' "${AP_COMPLETIONS_DIR}/ap_completion_kubectl.bash"
        rm -f "${AP_COMPLETIONS_DIR}/ap_completion_kubectl.bash.bak"
    fi

    minikube completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_minikube.bash"

    # Find and append " mkb" at the end of lines containing "__start_minikube minikube"
    if [ -f "${AP_COMPLETIONS_DIR}/ap_completion_minikube.bash" ]; then
        gsed -i.bak 's/\(__start_minikube minikube\)$/\1 mkb/g' "${AP_COMPLETIONS_DIR}/ap_completion_minikube.bash"
        rm -f "${AP_COMPLETIONS_DIR}/ap_completion_minikube.bash.bak"
    fi

    kind completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_kind.bash"

    if alias apcreatedirstructk8sshare &>/dev/null; then
        apcreatedirstructk8sshare
    fi

    if alias apcreatedirstructk8scommon &>/dev/null; then
        apcreatedirstructk8scommon
    fi

    if alias apcreatedirstructk8smain &>/dev/null; then
        apcreatedirstructk8smain
    fi
}

alias aprmdirstructk8s="ap_func_rm_dirstruct_k8s"
ap_func_rm_dirstruct_k8s() {
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_kubectl.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_minikube.bash"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_kind.bash"

    if alias aprmdirstructk8sshare &>/dev/null; then
        aprmdirstructk8sshare
    fi

    if alias aprmdirstructk8scommon &>/dev/null; then
        aprmdirstructk8scommon
    fi

    if alias aprmdirstructk8smain &>/dev/null; then
        aprmdirstructk8smain
    fi
}

alias apsetupk8s="ap_func_setup_k8s"
ap_func_setup_k8s() {
    apshowmsginfo "Install [kubectl, minikube, kind]\n"

    cd "${AP_TMP_DIR}"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/arm64/kubectl"
            curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-darwin-arm64
            sudo install minikube-darwin-arm64 /usr/local/bin/minikube
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"
            curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-darwin-amd64
            sudo install minikube-darwin-amd64 /usr/local/bin/minikube
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
        curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
        sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
    fi

    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
    sudo chown root: /usr/local/bin/kubectl
    rm kubectl.sha256

    go install sigs.k8s.io/kind@latest
    # kind create cluster

    apinitk8s

    if alias apcreateglobalsymlinkk8s &>/dev/null; then
        apcreatedirstructk8s
    fi

    if alias apcreatedirstructk8s &>/dev/null; then
        apcreatedirstructk8s
    fi
}

alias aprmk8s="ap_func_rm_k8s"
ap_func_rm_k8s() {
    apshowmsginfo "Remove [kubectl, minikube, kind]\n"

    rm -f /usr/local/bin/kubectl
    rm -f /usr/local/bin/minikube
    rm -f /usr/local/bin/kind

    if alias aprmdirstructk8s &>/dev/null; then
        aprmdirstructk8s
    fi

    if alias aprmglobalsymlinkk8s &>/dev/null; then
        aprmglobalsymlinkk8s
    fi
}
