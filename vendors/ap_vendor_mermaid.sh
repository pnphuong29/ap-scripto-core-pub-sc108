alias apinitmermaid="ap_func_init_mermaid"
ap_func_init_mermaid() {
    if alias apinitmermaidshare &>/dev/null; then
        apinitmermaidshare
    fi

    if alias apinitmermaidcommon &>/dev/null; then
        apinitmermaidcommon
    fi

    if alias apinitmermaidmain &>/dev/null; then
        apinitmermaidmain
    fi
}

alias apcreatedirstructmermaid="ap_func_create_dirstruct_mermaid"
ap_func_create_dirstruct_mermaid() {
    if alias apcreatedirstructmermaidshare &>/dev/null; then
        apcreatedirstructmermaidshare
    fi

    if alias apcreatedirstructmermaidcommon &>/dev/null; then
        apcreatedirstructmermaidcommon
    fi

    if alias apcreatedirstructmermaidmain &>/dev/null; then
        apcreatedirstructmermaidmain
    fi
}

alias aprmdirstructmermaid="ap_func_rm_dirstruct_mermaid"
ap_func_rm_dirstruct_mermaid() {
    if alias aprmdirstructmermaidshare &>/dev/null; then
        aprmdirstructmermaidshare
    fi

    if alias aprmdirstructmermaidcommon &>/dev/null; then
        aprmdirstructmermaidcommon
    fi

    if alias aprmdirstructmermaidmain &>/dev/null; then
        aprmdirstructmermaidmain
    fi
}

alias apsetupmermaid="ap_func_setup_mermaid"
ap_func_setup_mermaid() {
    apshowmsginfo "Install [mermaid]\n"

    pnpm install -g @mermaid-js/mermaid-cli
    apinitmermaid

    if alias apcreateglobalsymlinkmermaid &>/dev/null; then
        apcreatedirstructmermaid
    fi

    if alias apcreatedirstructmermaid &>/dev/null; then
        apcreatedirstructmermaid
    fi
}

alias aprmmermaid="ap_func_rm_mermaid"
ap_func_rm_mermaid() {
    apshowmsginfo "Remove [mermaid]\n"
    pnpm uninstall -g @mermaid-js/mermaid-cli

    if alias aprmdirstructmermaid &>/dev/null; then
        aprmdirstructmermaid
    fi

    if alias aprmglobalsymlinkmermaid &>/dev/null; then
        aprmglobalsymlinkmermaid
    fi
}
