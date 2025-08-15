alias apinitgcp="ap_func_init_gcp"
ap_func_init_gcp() {
    if [ -f "${AP_SOFT_DIR}/google-cloud-sdk/path.bash.inc" ]; then
        source "${AP_SOFT_DIR}/google-cloud-sdk/path.bash.inc"
    fi

    if alias apinitgcpshare &>/dev/null; then
        apinitgcpshare
    fi

    if alias apinitgcpcommon &>/dev/null; then
        apinitgcpcommon
    fi

    if alias apinitgcpmain &>/dev/null; then
        apinitgcpmain
    fi
}

alias apcreatedirstructgcp="ap_func_create_dirstruct_gcp"
ap_func_create_dirstruct_gcp() {
    if [ -f "${AP_SOFT_DIR}/google-cloud-sdk/completion.bash.inc" ]; then
        apshowmsginfo "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_gcp.bash] to [${AP_SOFT_DIR}/google-cloud-sdk/completion.bash.inc]\n"
        ln -sf "${AP_SOFT_DIR}/google-cloud-sdk/completion.bash.inc" "${AP_COMPLETIONS_DIR}/ap_completion_gcp.bash"
    fi

    if alias apcreatedirstructgcpshare &>/dev/null; then
        apcreatedirstructgcpshare
    fi

    if alias apcreatedirstructgcpcommon &>/dev/null; then
        apcreatedirstructgcpcommon
    fi

    if alias apcreatedirstructgcpmain &>/dev/null; then
        apcreatedirstructgcpmain
    fi
}

alias aprmdirstructgcp="ap_func_rm_dirstruct_gcp"
ap_func_rm_dirstruct_gcp() {
    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_gcp.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_gcp.bash"

    if alias aprmdirstructgcpshare &>/dev/null; then
        aprmdirstructgcpshare
    fi

    if alias aprmdirstructgcpcommon &>/dev/null; then
        aprmdirstructgcpcommon
    fi

    if alias aprmdirstructgcpmain &>/dev/null; then
        aprmdirstructgcpmain
    fi
}

alias apsetupgcp="ap_func_setup_gcp"
ap_func_setup_gcp() {
    apshowmsginfo "Install [gcp]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/google-cloud-sdk"
    rm -rf "${AP_TMP_DIR}/gcp"

    # Install gcp
    mkdir -p "${AP_TMP_DIR}/gcp"
    cd "${AP_TMP_DIR}/gcp"

    local ap_dl_link
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            ap_dl_link="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-darwin-arm.tar.gz"
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            ap_dl_link="https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-darwin-x86_64.tar.gz"
        fi
        apshowmsginfo "Downloading [gcp] for macos from ${ap_dl_link}\n"
        curl -SL "${ap_dl_link}" >gcp.tar.gz
        tar -xf gcp.tar.gz
        mv google-cloud-sdk "${AP_SOFT_DIR}/"
        cd "${AP_SOFT_DIR}"
        ./google-cloud-sdk/install.sh --command-completion false --path-update false --install-python false --quite
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt-get install apt-transport-https ca-certificates gnupg curl
        curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
        echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
        sudo apt-get update && sudo apt-get install google-cloud-cli
    fi

    apinitgcp

    if alias apcreateglobalsymlinkgcp &>/dev/null; then
        apcreatedirstructgcp
    fi

    if alias apcreatedirstructgcp &>/dev/null; then
        apcreatedirstructgcp
    fi
}

alias aprmgcp="ap_func_rm_gcp"
ap_func_rm_gcp() {
    apshowmsginfo "Remove [gcp]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "${AP_SOFT_DIR}/google-cloud-sdk"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y google-cloud-cli
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructgcp &>/dev/null; then
        aprmdirstructgcp
    fi

    if alias aprmglobalsymlinkgcp &>/dev/null; then
        aprmglobalsymlinkgcp
    fi
}
