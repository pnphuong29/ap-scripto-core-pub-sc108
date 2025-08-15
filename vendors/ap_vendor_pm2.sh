alias apinitpm2="ap_func_init_pm2"
ap_func_init_pm2() {
    if alias apinitpm2share &>/dev/null; then
        apinitpm2share
    fi

    if alias apinitpm2common &>/dev/null; then
        apinitpm2common
    fi

    if alias apinitpm2main &>/dev/null; then
        apinitpm2main
    fi
}

alias apcreatedirstructpm2="ap_func_create_dirstruct_pm2"
ap_func_create_dirstruct_pm2() {
    apshowmsginfo "Generate [pm2] bash autocomplete\n"
    pm2 completion >"${AP_COMPLETIONS_DIR}/ap_completion_pm2.bash"

    if alias apcreatedirstructpm2share &>/dev/null; then
        apcreatedirstructpm2share
    fi

    if alias apcreatedirstructpm2common &>/dev/null; then
        apcreatedirstructpm2common
    fi

    if alias apcreatedirstructpm2main &>/dev/null; then
        apcreatedirstructpm2main
    fi
}

alias aprmdirstructpm2="ap_func_rm_dirstruct_pm2"
ap_func_rm_dirstruct_pm2() {
    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_pm2.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_pm2.bash"

    if alias aprmdirstructpm2share &>/dev/null; then
        aprmdirstructpm2share
    fi

    if alias aprmdirstructpm2common &>/dev/null; then
        aprmdirstructpm2common
    fi

    if alias aprmdirstructpm2main &>/dev/null; then
        aprmdirstructpm2main
    fi
}

# alias apcreateglobalsymlinkpm2="ap_func_create_global_symlink_pm2"
# ap_func_create_global_symlink_pm2() {
#     if [ -f "${AP_SOFT_DIR}/bin/pm2" ]; then
#         apshowmsginfo "Create symlink from [/usr/local/bin/pm2] to [${AP_SOFT_DIR}/bin/pm2]\n"
#         sudo ln -sf "${AP_SOFT_DIR}/bin/pm2" "/usr/local/bin/pm2"
#     fi
# }

# alias aprmglobalsymlinkpm2="ap_func_rm_global_symlink_pm2"
# ap_func_rm_global_symlink_pm2() {
#     if [ -f "/usr/local/bin/pm2" ]; then
#         apshowmsginfo "Remove [/usr/local/bin/pm2]\n"
#         sudo rm -f "/usr/local/bin/pm2"
#     fi
# }

alias apsetuppm2="ap_func_setup_pm2"
ap_func_setup_pm2() {
    apshowmsginfo "Install [pm2]\n"

    pnpm install -g pm2
    apinitpm2

    if alias apcreateglobalsymlinkpm2 &>/dev/null; then
        apcreatedirstructpm2
    fi

    if alias apcreatedirstructpm2 &>/dev/null; then
        apcreatedirstructpm2
    fi
}

alias aprmpm2="ap_func_rm_pm2"
ap_func_rm_pm2() {
    apshowmsginfo "Remove [pm2]\n"

    pnpm uninstall -g pm2

    if alias aprmdirstructpm2 &>/dev/null; then
        aprmdirstructpm2
    fi

    if alias aprmglobalsymlinkpm2 &>/dev/null; then
        aprmglobalsymlinkpm2
    fi
}
