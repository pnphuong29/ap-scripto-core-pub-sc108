alias apinitnx="ap_func_init_nx"
ap_func_init_nx() {
    if alias apinitnxshare &>/dev/null; then
        apinitnxshare
    fi

    if alias apinitnxcommon &>/dev/null; then
        apinitnxcommon
    fi

    if alias apinitnxmain &>/dev/null; then
        apinitnxmain
    fi
}

alias apcreatedirstructnx="ap_func_create_dirstruct_nx"
ap_func_create_dirstruct_nx() {
    if alias apcreatedirstructnxshare &>/dev/null; then
        apcreatedirstructnxshare
    fi

    if alias apcreatedirstructnxcommon &>/dev/null; then
        apcreatedirstructnxcommon
    fi

    if alias apcreatedirstructnxmain &>/dev/null; then
        apcreatedirstructnxmain
    fi
}

alias aprmdirstructnx="ap_func_rm_dirstruct_nx"
ap_func_rm_dirstruct_nx() {
    if alias aprmdirstructnxshare &>/dev/null; then
        aprmdirstructnxshare
    fi

    if alias aprmdirstructnxcommon &>/dev/null; then
        aprmdirstructnxcommon
    fi

    if alias aprmdirstructnxmain &>/dev/null; then
        aprmdirstructnxmain
    fi
}

alias apsetupnx="ap_func_setup_nx"
ap_func_setup_nx() {
    apshowmsginfo "Install [nx]\n"

    pnpm install -g nx
    apinitnx

    if alias apcreateglobalsymlinknx &>/dev/null; then
        apcreatedirstructnx
    fi

    if alias apcreatedirstructnx &>/dev/null; then
        apcreatedirstructnx
    fi
}

alias aprmnx="ap_func_rm_nx"
ap_func_rm_nx() {
    apshowmsginfo "Remove [nx]\n"

    pnpm uninstall -g nx

    if alias aprmdirstructnx &>/dev/null; then
        aprmdirstructnx
    fi

    if alias aprmglobalsymlinknx &>/dev/null; then
        aprmglobalsymlinknx
    fi
}
