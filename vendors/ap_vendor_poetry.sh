alias apinitpoetry="ap_func_init_poetry"
ap_func_init_poetry() {
    if alias apinitpoetryshare &>/dev/null; then
        apinitpoetryshare
    fi

    if alias apinitpoetrycommon &>/dev/null; then
        apinitpoetrycommon
    fi

    if alias apinitpoetrymain &>/dev/null; then
        apinitpoetrymain
    fi
}

alias apcreatedirstructpoetry="ap_func_create_dirstruct_poetry"
ap_func_create_dirstruct_poetry() {
    apshowmsginfo "Generate [poetry] bash autocomplete\n"
    poetry completions bash >"${AP_COMPLETIONS_DIR}/ap_completion_poetry.bash"

    if alias apcreatedirstructpoetryshare &>/dev/null; then
        apcreatedirstructpoetryshare
    fi

    if alias apcreatedirstructpoetrycommon &>/dev/null; then
        apcreatedirstructpoetrycommon
    fi

    if alias apcreatedirstructpoetrymain &>/dev/null; then
        apcreatedirstructpoetrymain
    fi
}

alias aprmdirstructpoetry="ap_func_rm_dirstruct_poetry"
ap_func_rm_dirstruct_poetry() {
    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_poetry.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_poetry.bash"

    if alias aprmdirstructpoetryshare &>/dev/null; then
        aprmdirstructpoetryshare
    fi

    if alias aprmdirstructpoetrycommon &>/dev/null; then
        aprmdirstructpoetrycommon
    fi

    if alias aprmdirstructpoetrymain &>/dev/null; then
        aprmdirstructpoetrymain
    fi
}

alias apsetuppoetry="ap_func_setup_poetry"
ap_func_setup_poetry() {
    apshowmsginfo "Install [poetry]\n"

    curl -sSL https://install.python-poetry.org | python3 -
    apinitpoetry

    if alias apcreateglobalsymlinkpoetry &>/dev/null; then
        apcreatedirstructpoetry
    fi

    if alias apcreatedirstructpoetry &>/dev/null; then
        apcreatedirstructpoetry
    fi
}

alias aprmpoetry="ap_func_rm_poetry"
ap_func_rm_poetry() {
    apshowmsginfo "Remove [poetry]\n"

    curl -sSL https://install.python-poetry.org | python3 - --uninstall

    if alias aprmdirstructpoetry &>/dev/null; then
        aprmdirstructpoetry
    fi

    if alias aprmglobalsymlinkpoetry &>/dev/null; then
        aprmglobalsymlinkpoetry
    fi
}
