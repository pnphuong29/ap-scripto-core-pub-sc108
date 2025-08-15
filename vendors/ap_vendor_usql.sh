alias apinitusql="ap_func_init_usql"
ap_func_init_usql() {
    if alias apinitusqlshare &>/dev/null; then
        apinitusqlshare
    fi

    if alias apinitusqlcommon &>/dev/null; then
        apinitusqlcommon
    fi

    if alias apinitusqlmain &>/dev/null; then
        apinitusqlmain
    fi
}

alias apcreatedirstructusql="ap_func_create_dirstruct_usql"
ap_func_create_dirstruct_usql() {
    if alias apcreatedirstructusqlshare &>/dev/null; then
        apcreatedirstructusqlshare
    fi

    if alias apcreatedirstructusqlcommon &>/dev/null; then
        apcreatedirstructusqlcommon
    fi

    if alias apcreatedirstructusqlmain &>/dev/null; then
        apcreatedirstructusqlmain
    fi
}

alias aprmdirstructusql="ap_func_rm_dirstruct_usql"
ap_func_rm_dirstruct_usql() {
    if alias aprmdirstructusqlshare &>/dev/null; then
        aprmdirstructusqlshare
    fi

    if alias aprmdirstructusqlcommon &>/dev/null; then
        aprmdirstructusqlcommon
    fi

    if alias aprmdirstructusqlmain &>/dev/null; then
        aprmdirstructusqlmain
    fi
}

alias apsetupusql="ap_func_setup_usql"
ap_func_setup_usql() {
    apshowmsginfo "Install [usql]\n"

    go install -tags 'pg clickhouse' github.com/xo/usql@master
    apinitusql

    if alias apcreateglobalsymlinkusql &>/dev/null; then
        apcreatedirstructusql
    fi

    if alias apcreatedirstructusql &>/dev/null; then
        apcreatedirstructusql
    fi
}

alias aprmusql="ap_func_rm_usql"
ap_func_rm_usql() {
    apshowmsginfo "Remove [usql]\n"

    rm -rf "${GOPATH}/pkg/mod/github.com/xo/usql@"*
    rm -f "${GOPATH}/bin/usql"

    if alias aprmdirstructusql &>/dev/null; then
        aprmdirstructusql
    fi

    if alias aprmglobalsymlinkusql &>/dev/null; then
        aprmglobalsymlinkusql
    fi
}
