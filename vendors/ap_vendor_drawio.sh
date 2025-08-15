alias apinitdrawio="ap_func_init_drawio"
ap_func_init_drawio() {
    if alias apinitdrawioshare &>/dev/null; then
        apinitdrawioshare
    fi

    if alias apinitdrawiocommon &>/dev/null; then
        apinitdrawiocommon
    fi

    if alias apinitdrawiomain &>/dev/null; then
        apinitdrawiomain
    fi
}

alias apcreatedirstructdrawio="ap_func_create_dirstruct_drawio"
ap_func_create_dirstruct_drawio() {
    if alias apcreatedirstructdrawioshare &>/dev/null; then
        apcreatedirstructdrawioshare
    fi

    if alias apcreatedirstructdrawiocommon &>/dev/null; then
        apcreatedirstructdrawiocommon
    fi

    if alias apcreatedirstructdrawiomain &>/dev/null; then
        apcreatedirstructdrawiomain
    fi
}

alias aprmdirstructdrawio="ap_func_rm_dirstruct_drawio"
ap_func_rm_dirstruct_drawio() {
    if alias aprmdirstructdrawioshare &>/dev/null; then
        aprmdirstructdrawioshare
    fi

    if alias aprmdirstructdrawiocommon &>/dev/null; then
        aprmdirstructdrawiocommon
    fi

    if alias aprmdirstructdrawiomain &>/dev/null; then
        aprmdirstructdrawiomain
    fi
}

alias apsetupdrawio="ap_func_setup_drawio"
ap_func_setup_drawio() {
    apshowmsginfo "Install [drawio]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/drawio"
    rm -rf "${AP_TMP_DIR}/drawio"

    # Install drawio
    mkdir -p "${AP_TMP_DIR}/drawio"
    cd "${AP_TMP_DIR}/drawio"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/jgraph/drawio-desktop/releases" | jq -r '.[0].assets[].browser_download_url' | grep arm64 | grep zip | grep -v blockmap)" >drawio.zip
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/jgraph/drawio-desktop/releases" | jq -r '.[0].assets[].browser_download_url' | grep x64 | grep zip | grep -v blockmap)" >drawio.zip
        fi

        rm -rf "/Applications/draw.io.app"
        unzip drawio.zip
        mv draw.io.app /Applications/
        cd "/Applications"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/jgraph/drawio-desktop/releases" | jq -r '.[0].assets[].browser_download_url' | grep amd64 | grep dev)" >drawio.deb
        sudo dpkg -i drawio.deb
    fi

    apinitdrawio

    if alias apcreateglobalsymlinkdrawio &>/dev/null; then
        apcreatedirstructdrawio
    fi

    if alias apcreatedirstructdrawio &>/dev/null; then
        apcreatedirstructdrawio
    fi
}

alias aprmdrawio="ap_func_rm_drawio"
ap_func_rm_drawio() {
    apshowmsginfo "Remove [drawio]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        rm -rf "/Applications/draw.io.app"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo dpkg --purge draw.io
    fi

    if alias aprmdirstructdrawio &>/dev/null; then
        aprmdirstructdrawio
    fi

    if alias aprmglobalsymlinkdrawio &>/dev/null; then
        aprmglobalsymlinkdrawio
    fi
}
