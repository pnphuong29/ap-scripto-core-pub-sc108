alias apinitlunarvim="ap_func_init_lunarvim"
ap_func_init_lunarvim() {
    if alias apinitlunarvimshare &>/dev/null; then
        apinitlunarvimshare
    fi

    if alias apinitlunarvimcommon &>/dev/null; then
        apinitlunarvimcommon
    fi

    if alias apinitlunarvimmain &>/dev/null; then
        apinitlunarvimmain
    fi
}

alias apcreatedirstructlunarvim="ap_func_create_dirstruct_lunarvim"
ap_func_create_dirstruct_lunarvim() {
    if alias apcreatedirstructlunarvimshare &>/dev/null; then
        apcreatedirstructlunarvimshare
    fi

    if alias apcreatedirstructlunarvimcommon &>/dev/null; then
        apcreatedirstructlunarvimcommon
    fi

    if alias apcreatedirstructlunarvimmain &>/dev/null; then
        apcreatedirstructlunarvimmain
    fi
}

alias aprmdirstructlunarvim="ap_func_rm_dirstruct_lunarvim"
ap_func_rm_dirstruct_lunarvim() {
    if alias aprmdirstructlunarvimshare &>/dev/null; then
        aprmdirstructlunarvimshare
    fi

    if alias aprmdirstructlunarvimcommon &>/dev/null; then
        aprmdirstructlunarvimcommon
    fi

    if alias aprmdirstructlunarvimmain &>/dev/null; then
        aprmdirstructlunarvimmain
    fi
}

# alias apcreateglobalsymlinklunarvim="ap_func_create_global_symlink_lunarvim"
# ap_func_create_global_symlink_lunarvim() {
#     if [ -f "${AP_SOFT_DIR}/bin/lunarvim" ]; then
#         apshowmsginfo "Create symlink from [/usr/local/bin/lunarvim] to [${AP_SOFT_DIR}/bin/lunarvim]\n"
#         sudo ln -sf "${AP_SOFT_DIR}/bin/lunarvim" "/usr/local/bin/lunarvim"
#     fi
# }

# alias aprmglobalsymlinklunarvim="ap_func_rm_global_symlink_lunarvim"
# ap_func_rm_global_symlink_lunarvim() {
#     if [ -f "/usr/local/bin/lunarvim" ]; then
#         apshowmsginfo "Remove [/usr/local/bin/lunarvim]\n"
#         sudo rm -f "/usr/local/bin/lunarvim"
#     fi
# }

alias apsetuplunarvim="ap_func_setup_lunarvim"
ap_func_setup_lunarvim() {
    apshowmsginfo "Install Lunarvim\n"

    LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
    pnpm install -g tree-sitter-cli

    apinitlunarvim

    apcreateglobalsymlinklunarvim
    if alias apcreateglobalsymlinklunarvim &>/dev/null; then
        apcreatedirstructlunarvim
    fi

    if alias apcreatedirstructlunarvim &>/dev/null; then
        apcreatedirstructlunarvim
    fi
}

alias aprmlunarvim="ap_func_rm_lunarvim"
ap_func_rm_lunarvim() {
    apshowmsginfo "Remove [lunarvim]\n"

    bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/uninstall.sh)
    pnpm uninstall -g tree-sitter-cli

    if alias aprmdirstructlunarvim &>/dev/null; then
        aprmdirstructlunarvim
    fi

    if alias aprmglobalsymlinklunarvim &>/dev/null; then
        aprmglobalsymlinklunarvim
    fi
}
