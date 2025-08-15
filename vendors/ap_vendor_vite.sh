alias apinitvite="ap_func_init_vite"
ap_func_init_vite() {
    if alias apinitviteshare &>/dev/null; then
        apinitviteshare
    fi

    if alias apinitvitecommon &>/dev/null; then
        apinitvitecommon
    fi

    if alias apinitvitemain &>/dev/null; then
        apinitvitemain
    fi
}

alias apcreatedirstructvite="ap_func_create_dirstruct_vite"
ap_func_create_dirstruct_vite() {
    if alias apcreatedirstructviteshare &>/dev/null; then
        apcreatedirstructviteshare
    fi

    if alias apcreatedirstructvitecommon &>/dev/null; then
        apcreatedirstructvitecommon
    fi

    if alias apcreatedirstructvitemain &>/dev/null; then
        apcreatedirstructvitemain
    fi
}

alias aprmdirstructvite="ap_func_rm_dirstruct_vite"
ap_func_rm_dirstruct_vite() {
    if alias aprmdirstructviteshare &>/dev/null; then
        aprmdirstructviteshare
    fi

    if alias aprmdirstructvitecommon &>/dev/null; then
        aprmdirstructvitecommon
    fi

    if alias aprmdirstructvitemain &>/dev/null; then
        aprmdirstructvitemain
    fi
}

alias apsetupvite="ap_func_setup_vite"
ap_func_setup_vite() {
    apshowmsginfo "Install [vite]\n"

    pnpm install -g vite create-vite
    apinitvite

    if alias apcreateglobalsymlinkvite &>/dev/null; then
        apcreatedirstructvite
    fi

    if alias apcreatedirstructvite &>/dev/null; then
        apcreatedirstructvite
    fi
}

alias aprmvite="ap_func_rm_vite"
ap_func_rm_vite() {
    apshowmsginfo "Remove [vite]\n"

    pnpm uninstall -g vite create-vite

    if alias aprmdirstructvite &>/dev/null; then
        aprmdirstructvite
    fi

    if alias aprmglobalsymlinkvite &>/dev/null; then
        aprmglobalsymlinkvite
    fi
}
