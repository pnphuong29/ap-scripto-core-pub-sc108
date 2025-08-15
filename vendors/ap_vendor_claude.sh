alias apinitclaude="ap_func_init_claude"
ap_func_init_claude() {
    if alias apinitclaudeshare &>/dev/null; then
        apinitclaudeshare
    fi

    if alias apinitclaudecommon &>/dev/null; then
        apinitclaudecommon
    fi

    if alias apinitclaudemain &>/dev/null; then
        apinitclaudemain
    fi
}

alias apcreatedirstructclaude="ap_func_create_dirstruct_claude"
ap_func_create_dirstruct_claude() {
    if alias apcreatedirstructclaudeshare &>/dev/null; then
        apcreatedirstructclaudeshare
    fi

    if alias apcreatedirstructclaudecommon &>/dev/null; then
        apcreatedirstructclaudecommon
    fi

    if alias apcreatedirstructclaudemain &>/dev/null; then
        apcreatedirstructclaudemain
    fi
}

alias aprmdirstructclaude="ap_func_rm_dirstruct_claude"
ap_func_rm_dirstruct_claude() {
    if alias aprmdirstructclaudeshare &>/dev/null; then
        aprmdirstructclaudeshare
    fi

    if alias aprmdirstructclaudecommon &>/dev/null; then
        aprmdirstructclaudecommon
    fi

    if alias aprmdirstructclaudemain &>/dev/null; then
        aprmdirstructclaudemain
    fi
}

alias apsetupclaude="ap_func_setup_claude"
ap_func_setup_claude() {
    apshowmsginfo "Install [claude]\n"

    pnpm install -g @anthropic-ai/claude-code
    apinitclaude

    if alias apcreateglobalsymlinkclaude &>/dev/null; then
        apcreatedirstructclaude
    fi

    if alias apcreatedirstructclaude &>/dev/null; then
        apcreatedirstructclaude
    fi
}

alias aprmclaude="ap_func_rm_claude"
ap_func_rm_claude() {
    apshowmsginfo "Remove [claude]\n"

    pnpm uninstall -g @anthropic-ai/claude-code

    if alias aprmdirstructclaude &>/dev/null; then
        aprmdirstructclaude
    fi

    if alias aprmglobalsymlinkclaude &>/dev/null; then
        aprmglobalsymlinkclaude
    fi
}
