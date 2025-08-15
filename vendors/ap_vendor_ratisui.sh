# https://github.com/honhimW/ratisui
alias apinitratisui="ap_func_init_ratisui"
ap_func_init_ratisui() {
    if alias apinitratisuishare &>/dev/null; then
        apinitratisuishare
    fi

    if alias apinitratisuicommon &>/dev/null; then
        apinitratisuicommon
    fi

    if alias apinitratisuimain &>/dev/null; then
        apinitratisuimain
    fi
}

alias apcreatedirstructratisui="ap_func_create_dirstruct_ratisui"
ap_func_create_dirstruct_ratisui() {
    if alias apcreatedirstructratisuishare &>/dev/null; then
        apcreatedirstructratisuishare
    fi

    if alias apcreatedirstructratisuicommon &>/dev/null; then
        apcreatedirstructratisuicommon
    fi

    if alias apcreatedirstructratisuimain &>/dev/null; then
        apcreatedirstructratisuimain
    fi
}

alias aprmdirstructratisui="ap_func_rm_dirstruct_ratisui"
ap_func_rm_dirstruct_ratisui() {
    if alias aprmdirstructratisuishare &>/dev/null; then
        aprmdirstructratisuishare
    fi

    if alias aprmdirstructratisuicommon &>/dev/null; then
        aprmdirstructratisuicommon
    fi

    if alias aprmdirstructratisuimain &>/dev/null; then
        aprmdirstructratisuimain
    fi
}

# alias apcreateglobalsymlinkratisui="ap_func_create_global_symlink_ratisui"
# ap_func_create_global_symlink_ratisui() {
#     if [ -f "${AP_SOFT_DIR}/bin/ratisui" ]; then
#         apshowmsginfo "Create symlink from [/usr/local/bin/ratisui] to [${AP_SOFT_DIR}/bin/ratisui]\n"
#         sudo ln -sf "${AP_SOFT_DIR}/bin/ratisui" "/usr/local/bin/ratisui"
#     fi
# }

# alias aprmglobalsymlinkratisui="ap_func_rm_global_symlink_ratisui"
# ap_func_rm_global_symlink_ratisui() {
#     if [ -f "/usr/local/bin/ratisui" ]; then
#         apshowmsginfo "Remove [/usr/local/bin/ratisui]\n"
#         sudo rm -f "/usr/local/bin/ratisui"
#     fi
# }

alias apsetupratisui="ap_func_setup_ratisui"
ap_func_setup_ratisui() {
    apshowmsginfo "Install [ratisui]\n"

    cargo install --git=https://github.com/honhimW/ratisui.git
    apinitratisui

    apcreateglobalsymlinkratisui
    if alias apcreateglobalsymlinkratisui &>/dev/null; then
        apcreatedirstructratisui
    fi

    if alias apcreatedirstructratisui &>/dev/null; then
        apcreatedirstructratisui
    fi
}

alias aprmratisui="ap_func_rm_ratisui"
ap_func_rm_ratisui() {
    apshowmsginfo "Remove [ratisui]\n"
    cargo uninstall ratisui

    if alias aprmdirstructratisui &>/dev/null; then
        aprmdirstructratisui
    fi

    if alias aprmglobalsymlinkratisui &>/dev/null; then
        aprmglobalsymlinkratisui
    fi
}
