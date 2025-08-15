alias apinittranslateshell="ap_func_init_translateshell"
ap_func_init_translateshell() {
    if alias apinittranslateshellshare &>/dev/null; then
        apinittranslateshellshare
    fi

    if alias apinittranslateshellcommon &>/dev/null; then
        apinittranslateshellcommon
    fi

    if alias apinittranslateshellmain &>/dev/null; then
        apinittranslateshellmain
    fi
}

alias apcreatedirstructtranslateshell="ap_func_create_dirstruct_translateshell"
ap_func_create_dirstruct_translateshell() {
    if alias apcreatedirstructtranslateshellshare &>/dev/null; then
        apcreatedirstructtranslateshellshare
    fi

    if alias apcreatedirstructtranslateshellcommon &>/dev/null; then
        apcreatedirstructtranslateshellcommon
    fi

    if alias apcreatedirstructtranslateshellmain &>/dev/null; then
        apcreatedirstructtranslateshellmain
    fi
}

alias aprmdirstructtranslateshell="ap_func_rm_dirstruct_translateshell"
ap_func_rm_dirstruct_translateshell() {
    if alias aprmdirstructtranslateshellshare &>/dev/null; then
        aprmdirstructtranslateshellshare
    fi

    if alias aprmdirstructtranslateshellcommon &>/dev/null; then
        aprmdirstructtranslateshellcommon
    fi

    if alias aprmdirstructtranslateshellmain &>/dev/null; then
        aprmdirstructtranslateshellmain
    fi
}

alias apsetuptranslateshell="ap_func_setup_translateshell"
ap_func_setup_translateshell() {
    apshowmsginfo "Install [translate-shell]\n"

    curl -SL "https://raw.githubusercontent.com/soimort/translate-shell/gh-pages/trans" >"${AP_SOFT_DIR}/bin/trans"
    chmod +x "${AP_SOFT_DIR}/bin/trans"
    apinittranslateshell

    if alias apcreateglobalsymlinktranslateshell &>/dev/null; then
        apcreatedirstructtranslateshell
    fi

    if alias apcreatedirstructtranslateshell &>/dev/null; then
        apcreatedirstructtranslateshell
    fi
}

alias aprmtranslateshell="ap_func_rm_translateshell"
ap_func_rm_translateshell() {
    apshowmsginfo "Remove [translate-shell]\n"

    rm -f "${AP_SOFT_DIR}/bin/trans"

    if alias aprmdirstructtranslateshell &>/dev/null; then
        aprmdirstructtranslateshell
    fi

    if alias aprmglobalsymlinktranslateshell &>/dev/null; then
        aprmglobalsymlinktranslateshell
    fi
}
