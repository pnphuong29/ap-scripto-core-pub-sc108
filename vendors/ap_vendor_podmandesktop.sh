alias apinitpodmandesktop="ap_func_init_podmandesktop"
ap_func_init_podmandesktop() {
    if alias apinitpodmandesktopshare &>/dev/null; then
        apinitpodmandesktopshare
    fi

    if alias apinitpodmandesktopcommon &>/dev/null; then
        apinitpodmandesktopcommon
    fi

    if alias apinitpodmandesktopmain &>/dev/null; then
        apinitpodmandesktopmain
    fi
}

alias apcreatedirstructpodmandesktop="ap_func_create_dirstruct_podmandesktop"
ap_func_create_dirstruct_podmandesktop() {
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        if [ -f "${AP_SOFT_DIR}/podman-desktop/podman-desktop" ]; then
            ln -sf "${AP_SOFT_DIR}/podman-desktop/podman-desktop" "${AP_SOFT_DIR}/bin/podman-desktop"
        fi
    fi

    if alias apcreatedirstructpodmandesktopshare &>/dev/null; then
        apcreatedirstructpodmandesktopshare
    fi

    if alias apcreatedirstructpodmandesktopcommon &>/dev/null; then
        apcreatedirstructpodmandesktopcommon
    fi

    if alias apcreatedirstructpodmandesktopmain &>/dev/null; then
        apcreatedirstructpodmandesktopmain
    fi
}

alias aprmdirstructpodmandesktop="ap_func_rm_dirstruct_podmandesktop"
ap_func_rm_dirstruct_podmandesktop() {
    apshowmsginfo "Remove [${AP_SOFT_DIR}/bin/podman-desktop]\n"
    rm -f "${AP_SOFT_DIR}/bin/podman-desktop"

    if alias aprmdirstructpodmandesktopshare &>/dev/null; then
        aprmdirstructpodmandesktopshare
    fi

    if alias aprmdirstructpodmandesktopcommon &>/dev/null; then
        aprmdirstructpodmandesktopcommon
    fi

    if alias aprmdirstructpodmandesktopmain &>/dev/null; then
        aprmdirstructpodmandesktopmain
    fi
}

alias apsetuppodmandesktop="ap_func_setup_podmandesktop"
ap_func_setup_podmandesktop() {
    apshowmsginfo "Install [podman desktop]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/podman-desktop"
    rm -rf "${AP_TMP_DIR}/podman-desktop"

    # Install podmandesktop
    mkdir -p "${AP_TMP_DIR}/podman-desktop"
    cd "${AP_TMP_DIR}/podman-desktop"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/podman-desktop/podman-desktop/releases" | jq -r '.[0].assets[].browser_download_url' | grep "universal" | grep zip | grep -v blockmap)" >podman.zip
        unzip podman.zip
        mv "Podman Desktop.app" /Applications/
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/podman-desktop/podman-desktop/releases" | jq -r '.[0].assets[].browser_download_url' | grep "podman-desktop" | grep "tar.gz" | grep -v arm64)" >podman.tar.gz
        tar -zxf podman.tar.gz
        mv podman-desktop* podman-desktop
        mv podman-desktop "${AP_SOFT_DIR}/"
    fi

    apinitpodmandesktop

    if alias apcreateglobalsymlinkpodmandesktop &>/dev/null; then
        apcreatedirstructpodmandesktop
    fi

    if alias apcreatedirstructpodmandesktop &>/dev/null; then
        apcreatedirstructpodmandesktop
    fi
}

alias aprmpodmandesktop="ap_func_rm_podmandesktop"
ap_func_rm_podmandesktop() {
    apshowmsginfo "Remove [podman desktop]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/Podman Desktop.app"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        rm -rf "${AP_SOFT_DIR}/podman-desktop"
    fi

    if alias aprmdirstructpodmandesktop &>/dev/null; then
        aprmdirstructpodmandesktop
    fi

    if alias aprmglobalsymlinkpodmandesktop &>/dev/null; then
        aprmglobalsymlinkpodmandesktop
    fi
}
