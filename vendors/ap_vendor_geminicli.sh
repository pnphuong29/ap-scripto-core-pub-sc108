# https://github.com/google-gemini/gemini-cli
alias apinitgeminicli="ap_func_init_geminicli"
ap_func_init_geminicli() {
    if alias apinitgeminiclishare &>/dev/null; then
        apinitgeminiclishare
    fi

    if alias apinitgeminiclicommon &>/dev/null; then
        apinitgeminiclicommon
    fi

    if alias apinitgeminiclimain &>/dev/null; then
        apinitgeminiclimain
    fi
}

alias apcreatedirstructgeminicli="ap_func_create_dirstruct_geminicli"
ap_func_create_dirstruct_geminicli() {
    if alias apcreatedirstructgeminiclishare &>/dev/null; then
        apcreatedirstructgeminiclishare
    fi

    if alias apcreatedirstructgeminiclicommon &>/dev/null; then
        apcreatedirstructgeminiclicommon
    fi

    if alias apcreatedirstructgeminiclimain &>/dev/null; then
        apcreatedirstructgeminiclimain
    fi
}

alias aprmdirstructgeminicli="ap_func_rm_dirstruct_geminicli"
ap_func_rm_dirstruct_geminicli() {
    if alias aprmdirstructgeminiclishare &>/dev/null; then
        aprmdirstructgeminiclishare
    fi

    if alias aprmdirstructgeminiclicommon &>/dev/null; then
        aprmdirstructgeminiclicommon
    fi

    if alias aprmdirstructgeminiclimain &>/dev/null; then
        aprmdirstructgeminiclimain
    fi
}

alias apsetupgeminicli="ap_func_setup_geminicli"
ap_func_setup_geminicli() {
    apshowmsginfo "Install [gemini cli]\n"

    pnpm install -g @google/gemini-cli
    apinitgeminicli

    if alias apcreateglobalsymlinkgeminicli &>/dev/null; then
        apcreatedirstructgeminicli
    fi

    if alias apcreatedirstructgeminicli &>/dev/null; then
        apcreatedirstructgeminicli
    fi
}

alias aprmgeminicli="ap_func_rm_geminicli"
ap_func_rm_geminicli() {
    apshowmsginfo "Remove [gemini cli]\n"

    pnpm uninstall -g geminicli

    if alias aprmdirstructgeminicli &>/dev/null; then
        aprmdirstructgeminicli
    fi

    if alias aprmglobalsymlinkgeminicli &>/dev/null; then
        aprmglobalsymlinkgeminicli
    fi
}
