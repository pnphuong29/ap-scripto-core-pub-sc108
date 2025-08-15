alias apinitreact="ap_func_init_react"
ap_func_init_react() {
    if alias apinitreactshare &>/dev/null; then
        apinitreactshare
    fi

    if alias apinitreactcommon &>/dev/null; then
        apinitreactcommon
    fi

    if alias apinitreactmain &>/dev/null; then
        apinitreactmain
    fi
}

alias apcreatedirstructreact="ap_func_create_dirstruct_react"
ap_func_create_dirstruct_react() {
    if alias apcreatedirstructreactshare &>/dev/null; then
        apcreatedirstructreactshare
    fi

    if alias apcreatedirstructreactcommon &>/dev/null; then
        apcreatedirstructreactcommon
    fi

    if alias apcreatedirstructreactmain &>/dev/null; then
        apcreatedirstructreactmain
    fi
}

alias aprmdirstructreact="ap_func_rm_dirstruct_react"
ap_func_rm_dirstruct_react() {
    if alias aprmdirstructreactshare &>/dev/null; then
        aprmdirstructreactshare
    fi

    if alias aprmdirstructreactcommon &>/dev/null; then
        aprmdirstructreactcommon
    fi

    if alias aprmdirstructreactmain &>/dev/null; then
        aprmdirstructreactmain
    fi
}

alias apsetupreact="ap_func_setup_react"
ap_func_setup_react() {
    apshowmsginfo "Install [create-react-app]\n"

    pnpm install -g create-react-app
    apinitreact

    if alias apcreateglobalsymlinkreact &>/dev/null; then
        apcreatedirstructreact
    fi

    if alias apcreatedirstructreact &>/dev/null; then
        apcreatedirstructreact
    fi
}

alias aprmreact="ap_func_rm_react"
ap_func_rm_react() {
    apshowmsginfo "Remove [react]\n"
    pnpm uninstall -g create-react-app

    if alias aprmdirstructreact &>/dev/null; then
        aprmdirstructreact
    fi

    if alias aprmglobalsymlinkreact &>/dev/null; then
        aprmglobalsymlinkreact
    fi
}
