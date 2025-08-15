# https://github.com/apache/openwhisk/blob/master/docs/cli.md
alias apinitopenwhisk="ap_func_init_openwhisk"
ap_func_init_openwhisk() {
    if alias apinitopenwhiskshare &>/dev/null; then
        apinitopenwhiskshare
    fi

    if alias apinitopenwhiskcommon &>/dev/null; then
        apinitopenwhiskcommon
    fi

    if alias apinitopenwhiskmain &>/dev/null; then
        apinitopenwhiskmain
    fi
}

alias apcreatedirstructopenwhisk="ap_func_create_dirstruct_openwhisk"
ap_func_create_dirstruct_openwhisk() {
    if [ -f "${AP_SOFT_DIR}/openwhisk/wsk" ]; then
        apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/wsk] to [${AP_SOFT_DIR}/openwhisk/wsk]\n"
        ln -sf "${AP_SOFT_DIR}/openwhisk/wsk" "${AP_SOFT_DIR}/bin/wsk"
    fi

    apshowmsginfo "Generate [wsk] bash autocomplete\n"
    wsk sdk install bashauto --stdout | sed 's/-o nospace//' >"${AP_COMPLETIONS_DIR}/ap_completion_wsk.bash"

    if alias apcreatedirstructopenwhiskshare &>/dev/null; then
        apcreatedirstructopenwhiskshare
    fi

    if alias apcreatedirstructopenwhiskcommon &>/dev/null; then
        apcreatedirstructopenwhiskcommon
    fi

    if alias apcreatedirstructopenwhiskmain &>/dev/null; then
        apcreatedirstructopenwhiskmain
    fi
}

alias aprmdirstructopenwhisk="ap_func_rm_dirstruct_openwhisk"
ap_func_rm_dirstruct_openwhisk() {
    if alias aprmdirstructopenwhiskshare &>/dev/null; then
        aprmdirstructopenwhiskshare
    fi

    if alias aprmdirstructopenwhiskcommon &>/dev/null; then
        aprmdirstructopenwhiskcommon
    fi

    if alias aprmdirstructopenwhiskmain &>/dev/null; then
        aprmdirstructopenwhiskmain
    fi
}

alias apcreateglobalsymlinkopenwhisk="ap_func_create_global_symlink_openwhisk"
ap_func_create_global_symlink_openwhisk() {
    if [ -f "${AP_SOFT_DIR}/bin/wsk" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/wsk] to [${AP_SOFT_DIR}/bin/wsk]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/wsk" "/usr/local/bin/wsk"
    fi
}

alias aprmglobalsymlinkopenwhisk="ap_func_rm_global_symlink_openwhisk"
ap_func_rm_global_symlink_openwhisk() {
    if [ -f "/usr/local/bin/wsk" ]; then
        apshowmsginfo "Remove [/usr/local/bin/wsk]\n"
        sudo rm -f "/usr/local/bin/wsk"
    fi
}

alias apsetupopenwhisk="ap_func_setup_openwhisk"
ap_func_setup_openwhisk() {
    apshowmsginfo "Install [openwhisk]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/openwhisk"
    rm -rf "${AP_TMP_DIR}/openwhisk"

    # Install openwhisk
    mkdir -p "${AP_TMP_DIR}/openwhisk"
    cd "${AP_TMP_DIR}/openwhisk"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/apache/openwhisk-cli/releases" | jq -r '.[0].assets[].browser_download_url' | grep "mac" | grep amd)" >openwhisk.zip

        unzip openwhisk.zip
        rm -f openwhisk.zip
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/apache/openwhisk-cli/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep amd64)" >openwhisk.tgz
        tar -zxf openwhisk.tgz
        rm -f openwhisk.tgz
    fi

    cd "${AP_SOFT_DIR}"
    mv "${AP_TMP_DIR}/openwhisk" "${AP_SOFT_DIR}/"

    apinitopenwhisk

    if alias apcreateglobalsymlinkopenwhisk &>/dev/null; then
        apcreatedirstructopenwhisk
    fi

    if alias apcreatedirstructopenwhisk &>/dev/null; then
        apcreatedirstructopenwhisk
    fi
}

alias aprmopenwhisk="ap_func_rm_openwhisk"
ap_func_rm_openwhisk() {
    apshowmsginfo "Remove [openwhisk]\n"

    rm -rf "${AP_SOFT_DIR}/openwhisk"

    if alias aprmdirstructopenwhisk &>/dev/null; then
        aprmdirstructopenwhisk
    fi

    if alias aprmglobalsymlinkopenwhisk &>/dev/null; then
        aprmglobalsymlinkopenwhisk
    fi
}
