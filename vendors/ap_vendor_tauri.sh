alias apinittauri="ap_func_init_tauri"
ap_func_init_tauri() {
    if alias apinittaurishare &>/dev/null; then
        apinittaurishare
    fi

    if alias apinittauricommon &>/dev/null; then
        apinittauricommon
    fi

    if alias apinittaurimain &>/dev/null; then
        apinittaurimain
    fi
}

alias apcreatedirstructtauri="ap_func_create_dirstruct_tauri"
ap_func_create_dirstruct_tauri() {
    apshowmsginfo "Generate [tauri] bash autocomplete\n"
    cargo-tauri completions --shell bash >"${AP_COMPLETIONS_DIR}/ap_completion_tauri.bash"

    if alias apcreatedirstructtaurishare &>/dev/null; then
        apcreatedirstructtaurishare
    fi

    if alias apcreatedirstructtauricommon &>/dev/null; then
        apcreatedirstructtauricommon
    fi

    if alias apcreatedirstructtaurimain &>/dev/null; then
        apcreatedirstructtaurimain
    fi
}

alias aprmdirstructtauri="ap_func_rm_dirstruct_tauri"
ap_func_rm_dirstruct_tauri() {
    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_tauri.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_tauri.bash"

    if alias aprmdirstructtaurishare &>/dev/null; then
        aprmdirstructtaurishare
    fi

    if alias aprmdirstructtauricommon &>/dev/null; then
        aprmdirstructtauricommon
    fi

    if alias aprmdirstructtaurimain &>/dev/null; then
        aprmdirstructtaurimain
    fi
}

alias apsetuptauri="ap_func_setup_tauri"
ap_func_setup_tauri() {
    apshowmsginfo "Install [tauri]\n"

    cargo install tauri-cli
    apinittauri

    if alias apcreateglobalsymlinktauri &>/dev/null; then
        apcreatedirstructtauri
    fi

    if alias apcreatedirstructtauri &>/dev/null; then
        apcreatedirstructtauri
    fi
}

alias aprmtauri="ap_func_rm_tauri"
ap_func_rm_tauri() {
    apshowmsginfo "Remove [tauri]\n"

    cargo uninstall tauri-cli

    if alias aprmdirstructtauri &>/dev/null; then
        aprmdirstructtauri
    fi

    if alias aprmglobalsymlinktauri &>/dev/null; then
        aprmglobalsymlinktauri
    fi
}
