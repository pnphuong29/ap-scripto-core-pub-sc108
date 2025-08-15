alias apinitposting="ap_func_init_posting"
ap_func_init_posting() {
    if alias apinitpostingshare &>/dev/null; then
        apinitpostingshare
    fi

    if alias apinitpostingcommon &>/dev/null; then
        apinitpostingcommon
    fi

    if alias apinitpostingmain &>/dev/null; then
        apinitpostingmain
    fi
}

alias apcreatedirstructposting="ap_func_create_dirstruct_posting"
ap_func_create_dirstruct_posting() {
    if alias apcreatedirstructpostingshare &>/dev/null; then
        apcreatedirstructpostingshare
    fi

    if alias apcreatedirstructpostingcommon &>/dev/null; then
        apcreatedirstructpostingcommon
    fi

    if alias apcreatedirstructpostingmain &>/dev/null; then
        apcreatedirstructpostingmain
    fi
}

alias aprmdirstructposting="ap_func_rm_dirstruct_posting"
ap_func_rm_dirstruct_posting() {
    if alias aprmdirstructpostingshare &>/dev/null; then
        aprmdirstructpostingshare
    fi

    if alias aprmdirstructpostingcommon &>/dev/null; then
        aprmdirstructpostingcommon
    fi

    if alias aprmdirstructpostingmain &>/dev/null; then
        aprmdirstructpostingmain
    fi
}

alias apsetupposting="ap_func_setup_posting"
ap_func_setup_posting() {
    apshowmsginfo "Install [posting]\n"

    uv tool install posting
    apinitposting

    if alias apcreateglobalsymlinkposting &>/dev/null; then
        apcreatedirstructposting
    fi

    if alias apcreatedirstructposting &>/dev/null; then
        apcreatedirstructposting
    fi
}

alias aprmposting="ap_func_rm_posting"
ap_func_rm_posting() {
    apshowmsginfo "Remove [posting]\n"

    uv tool uninstall posting

    if alias aprmdirstructposting &>/dev/null; then
        aprmdirstructposting
    fi

    if alias aprmglobalsymlinkposting &>/dev/null; then
        aprmglobalsymlinkposting
    fi
}
