alias apinithttpyac="ap_func_init_httpyac"
ap_func_init_httpyac() {
    if alias apinithttpyacshare &>/dev/null; then
        apinithttpyacshare
    fi

    if alias apinithttpyaccommon &>/dev/null; then
        apinithttpyaccommon
    fi

    if alias apinithttpyacmain &>/dev/null; then
        apinithttpyacmain
    fi
}

alias apcreatedirstructhttpyac="ap_func_create_dirstruct_httpyac"
ap_func_create_dirstruct_httpyac() {
    if alias apcreatedirstructhttpyacshare &>/dev/null; then
        apcreatedirstructhttpyacshare
    fi

    if alias apcreatedirstructhttpyaccommon &>/dev/null; then
        apcreatedirstructhttpyaccommon
    fi

    if alias apcreatedirstructhttpyacmain &>/dev/null; then
        apcreatedirstructhttpyacmain
    fi
}

alias aprmdirstructhttpyac="ap_func_rm_dirstruct_httpyac"
ap_func_rm_dirstruct_httpyac() {
    if alias aprmdirstructhttpyacshare &>/dev/null; then
        aprmdirstructhttpyacshare
    fi

    if alias aprmdirstructhttpyaccommon &>/dev/null; then
        aprmdirstructhttpyaccommon
    fi

    if alias aprmdirstructhttpyacmain &>/dev/null; then
        aprmdirstructhttpyacmain
    fi
}

alias apsetuphttpyac="ap_func_setup_httpyac"
ap_func_setup_httpyac() {
    apshowmsginfo "Install [httpyac]\n"

    pnpm install -g httpyac
    apinithttpyac

    if alias apcreateglobalsymlinkhttpyac &>/dev/null; then
        apcreatedirstructhttpyac
    fi

    if alias apcreatedirstructhttpyac &>/dev/null; then
        apcreatedirstructhttpyac
    fi
}

alias aprmhttpyac="ap_func_rm_httpyac"
ap_func_rm_httpyac() {
    apshowmsginfo "Remove [httpyac]\n"

    pnpm uninstall -g httpyac

    if alias aprmdirstructhttpyac &>/dev/null; then
        aprmdirstructhttpyac
    fi

    if alias aprmglobalsymlinkhttpyac &>/dev/null; then
        aprmglobalsymlinkhttpyac
    fi
}
