# https://jdk.java.net/archive/
alias apinitopenjdk="ap_func_init_openjdk"
ap_func_init_openjdk() {
    export AP_OPENJDK_SETUP_VERSION='23.0.2'
    export AP_URL_OPENJDK_DL="https://jdk.java.net/archive/"

    local ap_openjdk_dir="${AP_SOFT_DIR}/openjdk/jdk-${AP_OPENJDK_SETUP_VERSION}.jdk"
    export AP_OPENJDK_BIN_DIR="${ap_openjdk_dir}/Contents/Home/bin"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        export JAVA_HOME="${ap_openjdk_dir}/Contents/Home"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        export JAVA_HOME="${ap_openjdk_dir}"
        export AP_OPENJDK_BIN_DIR="${ap_openjdk_dir}/bin"
    fi

    if [ -d "${AP_OPENJDK_BIN_DIR}" ]; then
        apaddpath "${AP_OPENJDK_BIN_DIR}"
    fi

    if alias apinitopenjdkshare &>/dev/null; then
        apinitopenjdkshare
    fi

    if alias apinitopenjdkcommon &>/dev/null; then
        apinitopenjdkcommon
    fi

    if alias apinitopenjdkmain &>/dev/null; then
        apinitopenjdkmain
    fi
}

alias apcreatedirstructopenjdk="ap_func_create_dirstruct_openjdk"
ap_func_create_dirstruct_openjdk() {
    if alias apcreatedirstructopenjdkshare &>/dev/null; then
        apcreatedirstructopenjdkshare
    fi

    if alias apcreatedirstructopenjdkcommon &>/dev/null; then
        apcreatedirstructopenjdkcommon
    fi

    if alias apcreatedirstructopenjdkmain &>/dev/null; then
        apcreatedirstructopenjdkmain
    fi
}

alias aprmdirstructopenjdk="ap_func_rm_dirstruct_openjdk"
ap_func_rm_dirstruct_openjdk() {
    if alias aprmdirstructopenjdkshare &>/dev/null; then
        aprmdirstructopenjdkshare
    fi

    if alias aprmdirstructopenjdkcommon &>/dev/null; then
        aprmdirstructopenjdkcommon
    fi

    if alias aprmdirstructopenjdkmain &>/dev/null; then
        aprmdirstructopenjdkmain
    fi
}

alias apcreateglobalsymlinkopenjdk="ap_func_create_global_symlink_openjdk"
ap_func_create_global_symlink_openjdk() {
    if [ -f "${AP_OPENJDK_BIN_DIR}/java" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/java] to [${AP_OPENJDK_BIN_DIR}/java]\n"
        sudo ln -sf "${AP_OPENJDK_BIN_DIR}/java" "/usr/local/bin/java"
    fi
}

alias aprmglobalsymlinkopenjdk="ap_func_rm_global_symlink_openjdk"
ap_func_rm_global_symlink_openjdk() {
    if [ -f "/usr/local/bin/java" ]; then
        apshowmsginfo "Remove [/usr/local/bin/java]\n"
        sudo rm -f "/usr/local/bin/java"
    fi
}

alias apsetupopenjdk="ap_func_setup_openjdk"
ap_func_setup_openjdk() {
    # Use param 9.0.4 to install openjdk 9.0.4
    local ap_openjdk_setup_version="${AP_OPENJDK_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_openjdk_setup_version="$1"
    fi

    apshowmsginfo "Install [OpenJDK] version [${ap_openjdk_setup_version}]\n"

    local ap_os="macos"
    if [[ "${ap_openjdk_setup_version}" == "9.0.4" && "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]]; then
        ap_os="osx"
    fi

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    cd "${AP_TMP_DIR}"

    apshowmsginfo "List download links for OpenJDK version [${ap_openjdk_setup_version}]\n"
    ap_func_crawl_web_url "${AP_URL_OPENJDK_DL}" | grep "${ap_openjdk_setup_version}"

    curl -SL "$(ap_func_crawl_web_url "${AP_URL_OPENJDK_DL}" | grep "${ap_openjdk_setup_version}" | grep "${ap_os}" | grep x64 | grep -v sha)" >"openjdk.tar.gz"
    tar -zxf "openjdk.tar.gz"

    rm -rf "${AP_SOFT_DIR}/openjdk/jdk-${ap_openjdk_setup_version}.jdk"
    mkdir -p "${AP_SOFT_DIR}/openjdk"
    # rm -f "jdk-${ap_openjdk_setup_version}_${ap_os}-x64_bin.tar.gz"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        mv "jdk-${ap_openjdk_setup_version}"*.jdk "jdk-${ap_openjdk_setup_version}.jdk"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        mv "jdk-${ap_openjdk_setup_version}"* "jdk-${ap_openjdk_setup_version}.jdk"
    fi

    mv "jdk-${ap_openjdk_setup_version}.jdk" "${AP_SOFT_DIR}/openjdk/"

    apinitopenjdk

    if alias apcreateglobalsymlinkopenjdk &>/dev/null; then
        apcreatedirstructopenjdk
    fi

    if alias apcreatedirstructopenjdk &>/dev/null; then
        apcreatedirstructopenjdk
    fi
}

alias aprmopenjdk="ap_func_rm_openjdk"
ap_func_rm_openjdk() {
    apshowmsginfo "Remove [openjdk]\n"
    rm -rf "${AP_SOFT_DIR}/openjdk"

    if alias aprmdirstructopenjdk &>/dev/null; then
        aprmdirstructopenjdk
    fi

    if alias aprmglobalsymlinkopenjdk &>/dev/null; then
        aprmglobalsymlinkopenjdk
    fi
}
