# https://www.jbang.dev/download/
alias apinitjbang="ap_func_init_jbang"
ap_func_init_jbang() {
    if [ -d "${HOME}/.jbang/bin" ]; then
        apaddpath "${HOME}/.jbang/bin"
    fi

    if alias apinitjbangshare &>/dev/null; then
        apinitjbangshare
    fi

    if alias apinitjbangcommon &>/dev/null; then
        apinitjbangcommon
    fi

    if alias apinitjbangmain &>/dev/null; then
        apinitjbangmain
    fi
}

alias apcreatedirstructjbang="ap_func_create_dirstruct_jbang"
ap_func_create_dirstruct_jbang() {
    if alias apcreatedirstructjbangshare &>/dev/null; then
        apcreatedirstructjbangshare
    fi

    if alias apcreatedirstructjbangcommon &>/dev/null; then
        apcreatedirstructjbangcommon
    fi

    if alias apcreatedirstructjbangmain &>/dev/null; then
        apcreatedirstructjbangmain
    fi
}

alias aprmdirstructjbang="ap_func_rm_dirstruct_jbang"
ap_func_rm_dirstruct_jbang() {
    if alias aprmdirstructjbangshare &>/dev/null; then
        aprmdirstructjbangshare
    fi

    if alias aprmdirstructjbangcommon &>/dev/null; then
        aprmdirstructjbangcommon
    fi

    if alias aprmdirstructjbangmain &>/dev/null; then
        aprmdirstructjbangmain
    fi
}

alias apsetupjbang="ap_func_setup_jbang"
ap_func_setup_jbang() {
    apshowmsginfo "Install [jbang]\n"

    curl -Ls https://sh.jbang.dev | bash -s - app setup
    apinitjbang
    apshowmsginfo "Please check and remove all jbang related codes in ~/.bash_profile or ~/.bashrc or ~/.profile\n"

    if alias apcreateglobalsymlinkjbang &>/dev/null; then
        apcreatedirstructjbang
    fi

    if alias apcreatedirstructjbang &>/dev/null; then
        apcreatedirstructjbang
    fi
}

alias aprmjbang="ap_func_rm_jbang"
ap_func_rm_jbang() {
    apshowmsginfo "Remove [jbang]\n"

    if alias aprmdirstructjbang &>/dev/null; then
        aprmdirstructjbang
    fi

    if alias aprmglobalsymlinkjbang &>/dev/null; then
        aprmglobalsymlinkjbang
    fi
}
