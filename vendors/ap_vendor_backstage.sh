alias apinitbackstage="ap_func_init_backstage"
ap_func_init_backstage() {
    if alias apinitbackstageshare &>/dev/null; then
        apinitbackstageshare
    fi

    if alias apinitbackstagecommon &>/dev/null; then
        apinitbackstagecommon
    fi

    if alias apinitbackstagemain &>/dev/null; then
        apinitbackstagemain
    fi
}

alias apcreatedirstructbackstage="ap_func_create_dirstruct_backstage"
ap_func_create_dirstruct_backstage() {
    if alias apcreatedirstructbackstageshare &>/dev/null; then
        apcreatedirstructbackstageshare
    fi

    if alias apcreatedirstructbackstagecommon &>/dev/null; then
        apcreatedirstructbackstagecommon
    fi

    if alias apcreatedirstructbackstagemain &>/dev/null; then
        apcreatedirstructbackstagemain
    fi
}

alias aprmdirstructbackstage="ap_func_rm_dirstruct_backstage"
ap_func_rm_dirstruct_backstage() {
    if alias aprmdirstructbackstageshare &>/dev/null; then
        aprmdirstructbackstageshare
    fi

    if alias aprmdirstructbackstagecommon &>/dev/null; then
        aprmdirstructbackstagecommon
    fi

    if alias aprmdirstructbackstagemain &>/dev/null; then
        aprmdirstructbackstagemain
    fi
}
