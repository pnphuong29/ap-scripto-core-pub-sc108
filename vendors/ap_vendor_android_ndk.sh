# https://developer.android.com/ndk/downloads
alias apinitandroidndk="ap_func_init_android_ndk"
ap_func_init_android_ndk() {
    export AP_ANDROID_NDK_SETUP_VERSION='r27c'

    if alias apinitandroidndkshare &>/dev/null; then
        apinitandroidndkshare
    fi

    if alias apinitandroidndkcommon &>/dev/null; then
        apinitandroidndkcommon
    fi

    if alias apinitandroidndkmain &>/dev/null; then
        apinitandroidndkmain
    fi
}

alias apcreatedirstructandroidndk="ap_func_create_dirstruct_android_ndk"
ap_func_create_dirstruct_android_ndk() {
    if alias apcreatedirstructandroidndkshare &>/dev/null; then
        apcreatedirstructandroidndkshare
    fi

    if alias apcreatedirstructandroidndkcommon &>/dev/null; then
        apcreatedirstructandroidndkcommon
    fi

    if alias apcreatedirstructandroidndkmain &>/dev/null; then
        apcreatedirstructandroidndkmain
    fi
}

alias aprmdirstructandroidndk="ap_func_rm_dirstruct_android_ndk"
ap_func_rm_dirstruct_android_ndk() {
    if alias aprmdirstructandroidndkshare &>/dev/null; then
        aprmdirstructandroidndkshare
    fi

    if alias aprmdirstructandroidndkcommon &>/dev/null; then
        aprmdirstructandroidndkcommon
    fi

    if alias aprmdirstructandroidndkmain &>/dev/null; then
        aprmdirstructandroidndkmain
    fi
}

alias apsetupandroidndk="ap_func_setup_android_ndk"
ap_func_setup_android_ndk() {
    local ap_android_ndk_setup_version="${AP_ANDROID_NDK_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_android_ndk_setup_version="$1"
    fi

    apshowmsginfo "Install [android_ndk] version [${ap_android_ndk_setup_version}]\n"

    # Remove old app dir if any
    rm -rf "${AP_DATA_DIR}/android/ndk"
    rm -rf "${AP_TMP_DIR}/android-ndk"

    # Install ndk
    mkdir -p "${AP_TMP_DIR}/android-ndk"
    mkdir -p "${AP_DATA_DIR}/android"
    cd "${AP_TMP_DIR}/android-ndk"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        curl -SL "https://dl.google.com/android/repository/android-ndk-${AP_ANDROID_NDK_SETUP_VERSION}-darwin.dmg" >ndk.dmg
        hdiutil attach -nobrowse ndk.dmg
        cd "/Volumes/Android NDK ${AP_ANDROID_NDK_SETUP_VERSION}"
        cp -R AndroidNDK*.app "${AP_TMP_DIR}/android-ndk/"
        mv "${AP_TMP_DIR}/android-ndk/Contents/NDK" "${AP_DATA_DIR}/android/"
        mv "${AP_DATA_DIR}/android/NDK" "${AP_DATA_DIR}/android/ndk"
        cd "${AP_SOFT_DIR}/android/ndk"
        hdiutil detach "/Volumes/Android NDK ${AP_ANDROID_NDK_SETUP_VERSION}"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        curl -SL "https://dl.google.com/android/repository/android-ndk-${AP_ANDROID_NDK_SETUP_VERSION}-linux.zip" >ndk.zip
        unzip ndk.zip
        mv android-ndk-${AP_ANDROID_NDK_SETUP_VERSION} "${AP_DATA_DIR}/android/ndk"
    fi

    apinitandroidndk

    if alias apcreateglobalsymlinkandroidndk &>/dev/null; then
        apcreatedirstructandroidndk
    fi

    if alias apcreatedirstructandroidndk &>/dev/null; then
        apcreatedirstructandroidndk
    fi
}

alias aprmandroidndk="ap_func_rm_android_ndk"
ap_func_rm_android_ndk() {
    local ap_android_ndk_remove_version="${AP_ANDROID_NDK_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_android_ndk_remove_version="$1"
    fi

    apshowmsginfo "Remove [android_ndk] v${ap_android_ndk_remove_version}\n"
    rm -rf "${AP_DATA_DIR}/android/ndk"

    if alias aprmdirstructandroidndk &>/dev/null; then
        aprmdirstructandroidndk
    fi

    if alias aprmglobalsymlinkandroidndk &>/dev/null; then
        aprmglobalsymlinkandroidndk
    fi
}
