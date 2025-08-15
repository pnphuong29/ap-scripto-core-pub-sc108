# https://github.com/dotenvx/
alias apinitdotenvx="ap_func_init_dotenvx"
ap_func_init_dotenvx() {
    if alias apinitdotenvxshare &>/dev/null; then
        apinitdotenvxshare
    fi

    if alias apinitdotenvxcommon &>/dev/null; then
        apinitdotenvxcommon
    fi

    if alias apinitdotenvxmain &>/dev/null; then
        apinitdotenvxmain
    fi
}

alias apcreatedirstructdotenvx="ap_func_create_dirstruct_dotenvx"
ap_func_create_dirstruct_dotenvx() {
    if alias apcreatedirstructdotenvxshare &>/dev/null; then
        apcreatedirstructdotenvxshare
    fi

    if alias apcreatedirstructdotenvxcommon &>/dev/null; then
        apcreatedirstructdotenvxcommon
    fi

    if alias apcreatedirstructdotenvxmain &>/dev/null; then
        apcreatedirstructdotenvxmain
    fi
}

alias aprmdirstructdotenvx="ap_func_rm_dirstruct_dotenvx"
ap_func_rm_dirstruct_dotenvx() {
    if alias aprmdirstructdotenvxshare &>/dev/null; then
        aprmdirstructdotenvxshare
    fi

    if alias aprmdirstructdotenvxcommon &>/dev/null; then
        aprmdirstructdotenvxcommon
    fi

    if alias aprmdirstructdotenvxmain &>/dev/null; then
        aprmdirstructdotenvxmain
    fi
}

# alias apcreateglobalsymlinkdotenvx="ap_func_create_global_symlink_dotenvx"
# ap_func_create_global_symlink_dotenvx() {
#     if [ -f "${AP_SOFT_DIR}/bin/dotenvx" ]; then
#         apshowmsginfo "Create symlink from [/usr/local/bin/dotenvx] to [${AP_SOFT_DIR}/bin/dotenvx]\n"
#         sudo ln -sf "${AP_SOFT_DIR}/bin/dotenvx" "/usr/local/bin/dotenvx"
#     fi
# }

# alias aprmglobalsymlinkdotenvx="ap_func_rm_global_symlink_dotenvx"
# ap_func_rm_global_symlink_dotenvx() {
#     if [ -f "/usr/local/bin/dotenvx" ]; then
#         apshowmsginfo "Remove [/usr/local/bin/dotenvx]\n"
#         sudo rm -f "/usr/local/bin/dotenvx"
#     fi
# }

alias apsetupdotenvx="ap_func_setup_dotenvx"
ap_func_setup_dotenvx() {
    apshowmsginfo "Install [dotenvx]\n"

    curl -sfS "https://dotenvx.sh?directory=${AP_SOFT_DIR}/bin" | sh
    apinitdotenvx

    if alias apcreateglobalsymlinkdotenvx &>/dev/null; then
        apcreatedirstructdotenvx
    fi

    if alias apcreatedirstructdotenvx &>/dev/null; then
        apcreatedirstructdotenvx
    fi
}

alias aprmdotenvx="ap_func_rm_dotenvx"
ap_func_rm_dotenvx() {
    apshowmsginfo "Remove [dotenvx]\n"

    rm -f "${AP_SOFT_DIR}/bin/dotenvx"

    if alias aprmdirstructdotenvx &>/dev/null; then
        aprmdirstructdotenvx
    fi

    if alias aprmglobalsymlinkdotenvx &>/dev/null; then
        aprmglobalsymlinkdotenvx
    fi
}
