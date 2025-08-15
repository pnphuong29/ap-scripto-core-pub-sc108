alias apinitgotask="ap_func_init_gotask"
ap_func_init_gotask() {
    if alias apinitgotaskshare &>/dev/null; then
        apinitgotaskshare
    fi

    if alias apinitgotaskcommon &>/dev/null; then
        apinitgotaskcommon
    fi

    if alias apinitgotaskmain &>/dev/null; then
        apinitgotaskmain
    fi
}

alias apcreatedirstructgotask="ap_func_create_dirstruct_gotask"
ap_func_create_dirstruct_gotask() {
    apshowmsginfo "Generate [gotask] bash autocomplete\n"
    task --completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_gotask.bash"

    if alias apcreatedirstructgotaskshare &>/dev/null; then
        apcreatedirstructgotaskshare
    fi

    if alias apcreatedirstructgotaskcommon &>/dev/null; then
        apcreatedirstructgotaskcommon
    fi

    if alias apcreatedirstructgotaskmain &>/dev/null; then
        apcreatedirstructgotaskmain
    fi
}

alias aprmdirstructgotask="ap_func_rm_dirstruct_gotask"
ap_func_rm_dirstruct_gotask() {
    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_gotask.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_gotask.bash"

    if alias aprmdirstructgotaskshare &>/dev/null; then
        aprmdirstructgotaskshare
    fi

    if alias aprmdirstructgotaskcommon &>/dev/null; then
        aprmdirstructgotaskcommon
    fi

    if alias aprmdirstructgotaskmain &>/dev/null; then
        aprmdirstructgotaskmain
    fi
}

alias apsetupgotask="ap_func_setup_gotask"
ap_func_setup_gotask() {
    apshowmsginfo "Install [gotask]\n"

    # go install github.com/go-task/task/v3/cmd/task@latest
    sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/scripto-data/software/bin
    apinitgotask

    if alias apcreateglobalsymlinkgotask &>/dev/null; then
        apcreatedirstructgotask
    fi

    if alias apcreatedirstructgotask &>/dev/null; then
        apcreatedirstructgotask
    fi
}

alias aprmgotask="ap_func_rm_gotask"
ap_func_rm_gotask() {
    apshowmsginfo "Remove [gotask]\n"

    rm -rf "${GOPATH}/pkg/mod/github.com/go-task/task/v3/cmd/task@"*
    rm -f "${GOPATH}/bin/task"

    if alias aprmdirstructgotask &>/dev/null; then
        aprmdirstructgotask
    fi

    if alias aprmglobalsymlinkgotask &>/dev/null; then
        aprmglobalsymlinkgotask
    fi
}
