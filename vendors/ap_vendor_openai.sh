alias apinitopenai="ap_func_init_openai"
ap_func_init_openai() {
    if alias apinitopenaishare &>/dev/null; then
        apinitopenaishare
    fi

    if alias apinitopenaicommon &>/dev/null; then
        apinitopenaicommon
    fi

    if alias apinitopenaimain &>/dev/null; then
        apinitopenaimain
    fi
}

alias apcreatedirstructopenai="ap_func_create_dirstruct_openai"
ap_func_create_dirstruct_openai() {
    apshowmsginfo "Generate [codex] bash autocomplete\n"
    codex completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_codex.bash"

    if alias apcreatedirstructopenaishare &>/dev/null; then
        apcreatedirstructopenaishare
    fi

    if alias apcreatedirstructopenaicommon &>/dev/null; then
        apcreatedirstructopenaicommon
    fi

    if alias apcreatedirstructopenaimain &>/dev/null; then
        apcreatedirstructopenaimain
    fi
}

alias aprmdirstructopenai="ap_func_rm_dirstruct_openai"
ap_func_rm_dirstruct_openai() {
    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_codex.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_codex.bash"

    if alias aprmdirstructopenaishare &>/dev/null; then
        aprmdirstructopenaishare
    fi

    if alias aprmdirstructopenaicommon &>/dev/null; then
        aprmdirstructopenaicommon
    fi

    if alias aprmdirstructopenaimain &>/dev/null; then
        aprmdirstructopenaimain
    fi
}

alias apsetupopenai="ap_func_setup_openai"
ap_func_setup_openai() {
    apshowmsginfo "Install [codex]\n"

    pnpm install -g @openai/codex
    apinitopenai

    if alias apcreateglobalsymlinkopenai &>/dev/null; then
        apcreatedirstructopenai
    fi

    if alias apcreatedirstructopenai &>/dev/null; then
        apcreatedirstructopenai
    fi
}

alias aprmopenai="ap_func_rm_openai"
ap_func_rm_openai() {
    apshowmsginfo "Remove [codex]\n"
    pnpm uninstall -g @openai/codex

    if alias aprmdirstructopenai &>/dev/null; then
        aprmdirstructopenai
    fi

    if alias aprmglobalsymlinkopenai &>/dev/null; then
        aprmglobalsymlinkopenai
    fi
}
