alias apinitharlequin="ap_func_init_harlequin"
ap_func_init_harlequin() {
    if alias apinitharlequinshare &>/dev/null; then
        apinitharlequinshare
    fi

    if alias apinitharlequincommon &>/dev/null; then
        apinitharlequincommon
    fi

    if alias apinitharlequinmain &>/dev/null; then
        apinitharlequinmain
    fi
}

alias apcreatedirstructharlequin="ap_func_create_dirstruct_harlequin"
ap_func_create_dirstruct_harlequin() {
    if alias apcreatedirstructharlequinshare &>/dev/null; then
        apcreatedirstructharlequinshare
    fi

    if alias apcreatedirstructharlequincommon &>/dev/null; then
        apcreatedirstructharlequincommon
    fi

    if alias apcreatedirstructharlequinmain &>/dev/null; then
        apcreatedirstructharlequinmain
    fi
}

alias aprmdirstructharlequin="ap_func_rm_dirstruct_harlequin"
ap_func_rm_dirstruct_harlequin() {
    if alias aprmdirstructharlequinshare &>/dev/null; then
        aprmdirstructharlequinshare
    fi

    if alias aprmdirstructharlequincommon &>/dev/null; then
        aprmdirstructharlequincommon
    fi

    if alias aprmdirstructharlequinmain &>/dev/null; then
        aprmdirstructharlequinmain
    fi
}

alias apsetupharlequin="ap_func_setup_harlequin"
ap_func_setup_harlequin() {
    apshowmsginfo "Install [harlequin]\n"

    uv tool install harlequin --with harlequin-odbc
    uv tool install 'harlequin[postgres,s3]'
    apinitharlequin

    if alias apcreateglobalsymlinkharlequin &>/dev/null; then
        apcreatedirstructharlequin
    fi

    if alias apcreatedirstructharlequin &>/dev/null; then
        apcreatedirstructharlequin
    fi
}

alias aprmharlequin="ap_func_rm_harlequin"
ap_func_rm_harlequin() {
    apshowmsginfo "Remove [harlequin]\n"

    uv tool uninstall harlequin
    uv tool uninstall 'harlequin[postgres,s3]'

    if alias aprmdirstructharlequin &>/dev/null; then
        aprmdirstructharlequin
    fi

    if alias aprmglobalsymlinkharlequin &>/dev/null; then
        aprmglobalsymlinkharlequin
    fi
}
