alias apinithugo="ap_func_init_hugo"
ap_func_init_hugo() {
    if alias apinithugoshare &>/dev/null; then
        apinithugoshare
    fi

    if alias apinithugocommon &>/dev/null; then
        apinithugocommon
    fi

    if alias apinithugomain &>/dev/null; then
        apinithugomain
    fi
}

alias apcreatedirstructhugo="ap_func_create_dirstruct_hugo"
ap_func_create_dirstruct_hugo() {
    apshowmsginfo "Generate [hugo] bash autocomplete\n"
    hugo completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_hugo.bash"

    apshowmsginfo "Generate [hugo] manpage\n"
    hugo gen man --dir "${AP_MAN_DIR}/man1"

    if alias apcreatedirstructhugoshare &>/dev/null; then
        apcreatedirstructhugoshare
    fi

    if alias apcreatedirstructhugocommon &>/dev/null; then
        apcreatedirstructhugocommon
    fi

    if alias apcreatedirstructhugomain &>/dev/null; then
        apcreatedirstructhugomain
    fi
}

alias aprmdirstructhugo="ap_func_rm_dirstruct_hugo"
ap_func_rm_dirstruct_hugo() {
    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_hugo.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_hugo.bash"

    if alias aprmdirstructhugoshare &>/dev/null; then
        aprmdirstructhugoshare
    fi

    if alias aprmdirstructhugocommon &>/dev/null; then
        aprmdirstructhugocommon
    fi

    if alias aprmdirstructhugomain &>/dev/null; then
        aprmdirstructhugomain
    fi
}

alias apsetuphugo="ap_func_setup_hugo"
ap_func_setup_hugo() {
    apshowmsginfo "Install [hugo]\n"
    CGO_ENABLED=1 go install -tags extended,withdeploy github.com/gohugoio/hugo@latest

    # https://github.com/NiklasPor/prettier-plugin-go-template
    # Fixes prettier formatting for go templates
    pnpm install -g prettier prettier-plugin-go-template

    apinithugo
    if alias apcreatedirstructhugo &>/dev/null; then
        apcreatedirstructhugo
    fi
}

alias aprmhugo="ap_func_rm_hugo"
ap_func_rm_hugo() {
    apshowmsginfo "Remove [hugo]\n"

    rm -rf "${GOPATH}/pkg/mod/github.com/gohugoio/hugo@"*
    rm -f "${GOPATH}/bin/hugo"

    if alias aprmdirstructhugo &>/dev/null; then
        aprmdirstructhugo
    fi

    if alias aprmglobalsymlinkhugo &>/dev/null; then
        aprmglobalsymlinkhugo
    fi
}
