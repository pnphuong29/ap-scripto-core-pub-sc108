alias apinitelectron="ap_func_init_electron"
ap_func_init_electron() {
    if alias apinitelectronshare &>/dev/null; then
        apinitelectronshare
    fi

    if alias apinitelectroncommon &>/dev/null; then
        apinitelectroncommon
    fi

    if alias apinitelectronmain &>/dev/null; then
        apinitelectronmain
    fi
}

alias apcreatedirstructelectron="ap_func_create_dirstruct_electron"
ap_func_create_dirstruct_electron() {
    if alias apcreatedirstructelectronshare &>/dev/null; then
        apcreatedirstructelectronshare
    fi

    if alias apcreatedirstructelectroncommon &>/dev/null; then
        apcreatedirstructelectroncommon
    fi

    if alias apcreatedirstructelectronmain &>/dev/null; then
        apcreatedirstructelectronmain
    fi
}

alias aprmdirstructelectron="ap_func_rm_dirstruct_electron"
ap_func_rm_dirstruct_electron() {
    if alias aprmdirstructelectronshare &>/dev/null; then
        aprmdirstructelectronshare
    fi

    if alias aprmdirstructelectroncommon &>/dev/null; then
        aprmdirstructelectroncommon
    fi

    if alias aprmdirstructelectronmain &>/dev/null; then
        aprmdirstructelectronmain
    fi
}

alias apsetupelectron="ap_func_setup_electron"
ap_func_setup_electron() {
    apshowmsginfo "Install [electron]\n"

    # pnpm install -g electron
    apinitelectron

    if alias apcreateglobalsymlinkelectron &>/dev/null; then
        apcreatedirstructelectron
    fi

    if alias apcreatedirstructelectron &>/dev/null; then
        apcreatedirstructelectron
    fi
}

alias aprmelectron="ap_func_rm_electron"
ap_func_rm_electron() {
    apshowmsginfo "Remove [electron]\n"
    # pnpm uninstall -g electron

    if alias aprmdirstructelectron &>/dev/null; then
        aprmdirstructelectron
    fi

    if alias aprmglobalsymlinkelectron &>/dev/null; then
        aprmglobalsymlinkelectron
    fi
}
