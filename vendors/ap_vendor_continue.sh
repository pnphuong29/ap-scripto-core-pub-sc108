alias apinitcontinue="ap_func_init_continue"
ap_func_init_continue() {
    if alias apinitcontinueshare &>/dev/null; then
        apinitcontinueshare
    fi

    if alias apinitcontinuecommon &>/dev/null; then
        apinitcontinuecommon
    fi

    if alias apinitcontinuemain &>/dev/null; then
        apinitcontinuemain
    fi
}

alias apcreatedirstructcontinue="ap_func_create_dirstruct_continue"
ap_func_create_dirstruct_continue() {
    if alias apcreatedirstructcontinueshare &>/dev/null; then
        apcreatedirstructcontinueshare
    fi

    if alias apcreatedirstructcontinuecommon &>/dev/null; then
        apcreatedirstructcontinuecommon
    fi

    if alias apcreatedirstructcontinuemain &>/dev/null; then
        apcreatedirstructcontinuemain
    fi
}

alias aprmdirstructcontinue="ap_func_rm_dirstruct_continue"
ap_func_rm_dirstruct_continue() {
    if alias aprmdirstructcontinueshare &>/dev/null; then
        aprmdirstructcontinueshare
    fi

    if alias aprmdirstructcontinuecommon &>/dev/null; then
        aprmdirstructcontinuecommon
    fi

    if alias aprmdirstructcontinuemain &>/dev/null; then
        aprmdirstructcontinuemain
    fi
}

alias apsetupcontinue="ap_func_setup_continue"
ap_func_setup_continue() {
    apshowmsginfo "Install [continue]\n"

    apinitcontinue

    if alias apcreateglobalsymlinkcontinue &>/dev/null; then
        apcreatedirstructcontinue
    fi

    if alias apcreatedirstructcontinue &>/dev/null; then
        apcreatedirstructcontinue
    fi
}

alias aprmcontinue="ap_func_rm_continue"
ap_func_rm_continue() {
    apshowmsginfo "Remove [continue]\n"

    if alias aprmdirstructcontinue &>/dev/null; then
        aprmdirstructcontinue
    fi

    if alias aprmglobalsymlinkcontinue &>/dev/null; then
        aprmglobalsymlinkcontinue
    fi
}
