alias apinitxo="ap_func_init_xo"
ap_func_init_xo() {
    if alias apinitxoshare &>/dev/null; then
        apinitxoshare
    fi

    if alias apinitxocommon &>/dev/null; then
        apinitxocommon
    fi

    if alias apinitxomain &>/dev/null; then
        apinitxomain
    fi
}

alias apcreatedirstructxo="ap_func_create_dirstruct_xo"
ap_func_create_dirstruct_xo() {
    apshowmsginfo "Generate [xo] bash autocomplete\n"
    xo completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_xo.bash"

    if alias apcreatedirstructxoshare &>/dev/null; then
        apcreatedirstructxoshare
    fi

    if alias apcreatedirstructxocommon &>/dev/null; then
        apcreatedirstructxocommon
    fi

    if alias apcreatedirstructxomain &>/dev/null; then
        apcreatedirstructxomain
    fi
}

alias aprmdirstructxo="ap_func_rm_dirstruct_xo"
ap_func_rm_dirstruct_xo() {
    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_xo.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_xo.bash"

    if alias aprmdirstructxoshare &>/dev/null; then
        aprmdirstructxoshare
    fi

    if alias aprmdirstructxocommon &>/dev/null; then
        aprmdirstructxocommon
    fi

    if alias aprmdirstructxomain &>/dev/null; then
        aprmdirstructxomain
    fi
}

alias apsetupxo="ap_func_setup_xo"
ap_func_setup_xo() {
    apshowmsginfo "Install [xo]\n"

    go install github.com/xo/xo@latest
    apinitxo

    if alias apcreateglobalsymlinkxo &>/dev/null; then
        apcreatedirstructxo
    fi

    if alias apcreatedirstructxo &>/dev/null; then
        apcreatedirstructxo
    fi
}

alias aprmxo="ap_func_rm_xo"
ap_func_rm_xo() {
    apshowmsginfo "Remove [xo]\n"

    rm -rf "${GOPATH}/pkg/mod/github.com/xo/xo@"*
    rm -f "${GOPATH}/bin/xo"

    if alias aprmdirstructxo &>/dev/null; then
        aprmdirstructxo
    fi

    if alias aprmglobalsymlinkxo &>/dev/null; then
        aprmglobalsymlinkxo
    fi
}
