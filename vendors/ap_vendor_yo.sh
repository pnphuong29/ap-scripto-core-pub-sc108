alias apinityo="ap_func_init_yo"
ap_func_init_yo() {
    if alias apinityoshare &>/dev/null; then
        apinityoshare
    fi

    if alias apinityocommon &>/dev/null; then
        apinityocommon
    fi

    if alias apinityomain &>/dev/null; then
        apinityomain
    fi
}

alias apcreatedirstructyo="ap_func_create_dirstruct_yo"
ap_func_create_dirstruct_yo() {
    if alias apcreatedirstructyoshare &>/dev/null; then
        apcreatedirstructyoshare
    fi

    if alias apcreatedirstructyocommon &>/dev/null; then
        apcreatedirstructyocommon
    fi

    if alias apcreatedirstructyomain &>/dev/null; then
        apcreatedirstructyomain
    fi
}

alias aprmdirstructyo="ap_func_rm_dirstruct_yo"
ap_func_rm_dirstruct_yo() {
    if alias aprmdirstructyoshare &>/dev/null; then
        aprmdirstructyoshare
    fi

    if alias aprmdirstructyocommon &>/dev/null; then
        aprmdirstructyocommon
    fi

    if alias aprmdirstructyomain &>/dev/null; then
        aprmdirstructyomain
    fi
}

alias apsetupyo="ap_func_setup_yo"
ap_func_setup_yo() {
    apshowmsginfo "Install [yeoman and it's generators]\n"

    pnpm install -g yo generator-code
    apinityo

    if alias apcreateglobalsymlinkyo &>/dev/null; then
        apcreatedirstructyo
    fi

    if alias apcreatedirstructyo &>/dev/null; then
        apcreatedirstructyo
    fi
}

alias aprmyo="ap_func_rm_yo"
ap_func_rm_yo() {
    apshowmsginfo "Remove [yeoman and it's generators]\n"

    pnpm uninstall -g yo generator-code

    if alias aprmdirstructyo &>/dev/null; then
        aprmdirstructyo
    fi

    if alias aprmglobalsymlinkyo &>/dev/null; then
        aprmglobalsymlinkyo
    fi
}
