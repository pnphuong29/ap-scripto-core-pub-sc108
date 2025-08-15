alias apinitair="ap_func_init_air"
ap_func_init_air() {
    if alias apinitairshare &>/dev/null; then
        apinitairshare
    fi

    if alias apinitaircommon &>/dev/null; then
        apinitaircommon
    fi

    if alias apinitairmain &>/dev/null; then
        apinitairmain
    fi
}

alias apcreatedirstructair="ap_func_create_dirstruct_air"
ap_func_create_dirstruct_air() {
    if alias apcreatedirstructairshare &>/dev/null; then
        apcreatedirstructairshare
    fi

    if alias apcreatedirstructaircommon &>/dev/null; then
        apcreatedirstructaircommon
    fi

    if alias apcreatedirstructairmain &>/dev/null; then
        apcreatedirstructairmain
    fi
}

alias aprmdirstructair="ap_func_rm_dirstruct_air"
ap_func_rm_dirstruct_air() {
    if alias aprmdirstructairshare &>/dev/null; then
        aprmdirstructairshare
    fi

    if alias aprmdirstructaircommon &>/dev/null; then
        aprmdirstructaircommon
    fi

    if alias aprmdirstructairmain &>/dev/null; then
        aprmdirstructairmain
    fi
}

alias apsetupair="ap_func_setup_air"
ap_func_setup_air() {
    apshowmsginfo "Install [air]\n"

    go install github.com/air-verse/air@latest
    apinitair

    if alias apcreateglobalsymlinkair &>/dev/null; then
        apcreatedirstructair
    fi

    if alias apcreatedirstructair &>/dev/null; then
        apcreatedirstructair
    fi
}

alias aprmair="ap_func_rm_air"
ap_func_rm_air() {
    apshowmsginfo "Remove [air]\n"
    rm -rf "${GOPATH}/pkg/mod/github.com/air-verse/air@"*

    if alias aprmdirstructair &>/dev/null; then
        aprmdirstructair
    fi

    if alias aprmglobalsymlinkair &>/dev/null; then
        aprmglobalsymlinkair
    fi
}
