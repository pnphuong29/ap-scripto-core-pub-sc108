alias apinitmise="ap_func_init_mise"
ap_func_init_mise() {
    if alias apinitmiseshare &>/dev/null; then
        apinitmiseshare
    fi

    if alias apinitmisecommon &>/dev/null; then
        apinitmisecommon
    fi

    if alias apinitmisemain &>/dev/null; then
        apinitmisemain
    fi
}

alias apcreatedirstructmise="ap_func_create_dirstruct_mise"
ap_func_create_dirstruct_mise() {
    # https://mise.jdx.dev/installing-mise.html#autocompletion
    apshowmsginfo "Generate [mise] bash autocomplete\n"
    ~/.local/bin/mise completion bash --include-bash-completion-lib >"${AP_COMPLETIONS_DIR}/ap_completion_mise.bash"

    if alias apcreatedirstructmiseshare &>/dev/null; then
        apcreatedirstructmiseshare
    fi

    if alias apcreatedirstructmisecommon &>/dev/null; then
        apcreatedirstructmisecommon
    fi

    if alias apcreatedirstructmisemain &>/dev/null; then
        apcreatedirstructmisemain
    fi
}

alias aprmdirstructmise="ap_func_rm_dirstruct_mise"
ap_func_rm_dirstruct_mise() {
    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_mise.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_mise.bash"

    if alias aprmdirstructmiseshare &>/dev/null; then
        aprmdirstructmiseshare
    fi

    if alias aprmdirstructmisecommon &>/dev/null; then
        aprmdirstructmisecommon
    fi

    if alias aprmdirstructmisemain &>/dev/null; then
        aprmdirstructmisemain
    fi
}

alias apsetupmise="ap_func_setup_mise"
ap_func_setup_mise() {
    apshowmsginfo "Install [mise]\n"

    curl https://mise.run | sh
    ~/.local/bin/mise use -g usage
    apinitmise

    if alias apcreateglobalsymlinkmise &>/dev/null; then
        apcreatedirstructmise
    fi

    if alias apcreatedirstructmise &>/dev/null; then
        apcreatedirstructmise
    fi
}

alias aprmmise="ap_func_rm_mise"
ap_func_rm_mise() {
    apshowmsginfo "Remove [mise]\n"

    rm -f "${HOME}/.local/bin/mise"

    if alias aprmdirstructmise &>/dev/null; then
        aprmdirstructmise
    fi

    if alias aprmglobalsymlinkmise &>/dev/null; then
        aprmglobalsymlinkmise
    fi
}
