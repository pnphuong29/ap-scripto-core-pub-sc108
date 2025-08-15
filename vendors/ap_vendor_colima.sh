alias apinitcolima="ap_func_init_colima"
ap_func_init_colima() {
    if alias apinitcolimashare &>/dev/null; then
        apinitcolimashare
    fi

    if alias apinitcolimacommon &>/dev/null; then
        apinitcolimacommon
    fi

    if alias apinitcolimamain &>/dev/null; then
        apinitcolimamain
    fi
}

alias apcreatedirstructcolima="ap_func_create_dirstruct_colima"
ap_func_create_dirstruct_colima() {
    apshowmsginfo "Generate [colima] bash autocomplete\n"
    colima completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_colima.bash"

    if alias apcreatedirstructcolimashare &>/dev/null; then
        apcreatedirstructcolimashare
    fi

    if alias apcreatedirstructcolimacommon &>/dev/null; then
        apcreatedirstructcolimacommon
    fi

    if alias apcreatedirstructcolimamain &>/dev/null; then
        apcreatedirstructcolimamain
    fi
}

alias aprmdirstructcolima="ap_func_rm_dirstruct_colima"
ap_func_rm_dirstruct_colima() {
    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_colima.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_colima.bash"

    if alias aprmdirstructcolimashare &>/dev/null; then
        aprmdirstructcolimashare
    fi

    if alias aprmdirstructcolimacommon &>/dev/null; then
        aprmdirstructcolimacommon
    fi

    if alias aprmdirstructcolimamain &>/dev/null; then
        aprmdirstructcolimamain
    fi
}

# alias apcreateglobalsymlinkcolima="ap_func_create_global_symlink_colima"
# ap_func_create_global_symlink_colima() {
#     if [ -f "${AP_SOFT_DIR}/bin/colima" ]; then
#         apshowmsginfo "Create symlink from [/usr/local/bin/colima] to [${AP_SOFT_DIR}/bin/colima]\n"
#         sudo ln -sf "${AP_SOFT_DIR}/bin/colima" "/usr/local/bin/colima"
#     fi
# }

# alias aprmglobalsymlinkcolima="ap_func_rm_global_symlink_colima"
# ap_func_rm_global_symlink_colima() {
#     if [ -f "/usr/local/bin/colima" ]; then
#         apshowmsginfo "Remove [/usr/local/bin/colima]\n"
#         sudo rm -f "/usr/local/bin/colima"
#     fi
# }

alias apsetupcolima="ap_func_setup_colima"
ap_func_setup_colima() {
    apshowmsginfo "Install [colima]\n"

    cd "${AP_SOFT_DIR}/bin"

    local ap_dl_link
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            ap_dl_link="$(curl --silent "https://api.github.com/repos/abiosoft/colima/releases" | jq -r '.[0].assets[].browser_download_url' | grep "Darwin" | grep arm64 | grep -v sha256)"
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            ap_dl_link="$(curl --silent "https://api.github.com/repos/abiosoft/colima/releases" | jq -r '.[0].assets[].browser_download_url' | grep "Darwin" | grep x86_64 | grep -v sha256)"
        fi
        apshowmsginfo "Downloading [colima] for macos from ${ap_dl_link}\n"
        curl -SL "${ap_dl_link}" >colima
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_dl_link="$(curl --silent "https://api.github.com/repos/abiosoft/colima/releases" | jq -r '.[0].assets[].browser_download_url' | grep "Linux" | grep x86_64 | grep -v sha256)"
        apshowmsginfo "Downloading [colima] for linux from ${ap_dl_link}\n"
        curl -SL "${ap_dl_link}" >colima
    fi

    chmod +x "${AP_SOFT_DIR}/bin/colima"
    apinitcolima

    if alias apcreateglobalsymlinkcolima &>/dev/null; then
        apcreatedirstructcolima
    fi

    if alias apcreatedirstructcolima &>/dev/null; then
        apcreatedirstructcolima
    fi
}

alias aprmcolima="ap_func_rm_colima"
ap_func_rm_colima() {
    apshowmsginfo "Remove [colima]\n"

    rm -f "${AP_SOFT_DIR}/bin/colima"

    if alias aprmdirstructcolima &>/dev/null; then
        aprmdirstructcolima
    fi

    if alias aprmglobalsymlinkcolima &>/dev/null; then
        aprmglobalsymlinkcolima
    fi
}
