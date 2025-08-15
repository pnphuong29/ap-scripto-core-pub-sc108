# https://www.oracle.com/java/technologies/downloads/
# Prefer using OpenJDK
# https://openjdk.java.net/install/
alias apinitjdk="ap_func_init_jdk"
ap_func_init_jdk() {
    export AP_JDK_SETUP_VERSION='23'

    local ap_jdk_dir="${AP_SOFT_DIR}/jdk/jdk-${AP_JDK_SETUP_VERSION}.jdk"
    export AP_JDK_BIN_DIR="${ap_jdk_dir}/Contents/Home/bin"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        export JAVA_HOME="${ap_jdk_dir}/Contents/Home"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        export JAVA_HOME="${ap_jdk_dir}"
        export AP_JDK_BIN_DIR="${ap_jdk_dir}/bin"
    fi

    if [ -d "${AP_JDK_BIN_DIR}" ]; then
        apaddpath "${AP_JDK_BIN_DIR}"
    fi

    if alias apinitjdkshare &>/dev/null; then
        apinitjdkshare
    fi

    if alias apinitjdkcommon &>/dev/null; then
        apinitjdkcommon
    fi
}

alias apcreatedirstructjdk="ap_func_create_dirstruct_jdk"
ap_func_create_dirstruct_jdk() {
    if alias apcreatedirstructjdkshare &>/dev/null; then
        apcreatedirstructjdkshare
    fi

    if alias apcreatedirstructjdkcommon &>/dev/null; then
        apcreatedirstructjdkcommon
    fi
}

alias aprmdirstructjdk="ap_func_rm_dirstruct_jdk"
ap_func_rm_dirstruct_jdk() {
    if alias aprmdirstructjdkshare &>/dev/null; then
        aprmdirstructjdkshare
    fi

    if alias aprmdirstructjdkcommon &>/dev/null; then
        aprmdirstructjdkcommon
    fi
}

alias apcreateglobalsymlinkjdk="ap_func_create_global_symlink_jdk"
ap_func_create_global_symlink_jdk() {
    if [ -f "${AP_JDK_BIN_DIR}/java" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/java] to [${AP_JDK_BIN_DIR}/java]\n"
        sudo ln -sf "${AP_JDK_BIN_DIR}/java" "/usr/local/bin/java"
    fi
}

alias aprmglobalsymlinkjdk="ap_func_rm_global_symlink_jdk"
ap_func_rm_global_symlink_jdk() {
    if [ -f "/usr/local/bin/java" ]; then
        apshowmsginfo "Remove [/usr/local/bin/java]\n"
        sudo rm -f "/usr/local/bin/java"
    fi
}

alias apsetupjdk="ap_func_setup_jdk"
ap_func_setup_jdk() {
    local ap_jdk_setup_version="${AP_JDK_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_jdk_setup_version="$1"
    fi

    apshowmsginfo "Install [JDK] version [${ap_jdk_setup_version}]\n"

    local ap_os="macos"
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_os="linux"
    fi

    cd "${AP_TMP_DIR}"
    rm -rf "jdk-${ap_jdk_setup_version}_${ap_os}-x64_bin.tar.gz" "jdk-${ap_jdk_setup_version}"*.jdk
    curl -SL "https://download.oracle.com/java/${ap_jdk_setup_version}/latest/jdk-${ap_jdk_setup_version}_${ap_os}-x64_bin.tar.gz" >"jdk.tar.gz"
    tar -zxf "jdk.tar.gz"

    rm -rf "${AP_SOFT_DIR}/jdk/jdk-${ap_jdk_setup_version}.jdk"
    mkdir -p "${AP_SOFT_DIR}/jdk"
    # rm -f "jdk.tar.gz"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        mv "jdk-${ap_jdk_setup_version}"*.jdk "jdk-${ap_jdk_setup_version}.jdk"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        mv "jdk-${ap_jdk_setup_version}"* "jdk-${ap_jdk_setup_version}.jdk"
    fi

    mv "jdk-${ap_jdk_setup_version}.jdk" "${AP_SOFT_DIR}/jdk/"

    apinitjdk

    if alias apcreateglobalsymlinkjdk &>/dev/null; then
        apcreatedirstructjdk
    fi

    if alias apcreatedirstructjdk &>/dev/null; then
        apcreatedirstructjdk
    fi
}

alias aprmjdk="ap_func_rm_jdk"
ap_func_rm_jdk() {
    aplogshow "Remove [jdk]\n"
    rm -rf "${AP_SOFT_DIR}/jdk"

    if alias aprmdirstructjdk &>/dev/null; then
        aprmdirstructjdk
    fi

    if alias aprmglobalsymlinkjdk &>/dev/null; then
        aprmglobalsymlinkjdk
    fi
}
