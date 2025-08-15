alias apinitlima="ap_func_init_lima"
ap_func_init_lima() {
    apaddpath "${AP_SOFT_DIR}/lima/bin"
    apaddpath -m "${AP_SOFT_DIR}/lima/share/man"

    if alias apinitlimashare &>/dev/null; then
        apinitlimashare
    fi

    if alias apinitlimacommon &>/dev/null; then
        apinitlimacommon
    fi

    if alias apinitlimamain &>/dev/null; then
        apinitlimamain
    fi
}

alias apcreatedirstructlima="ap_func_create_dirstruct_lima"
ap_func_create_dirstruct_lima() {
    apshowmsginfo "Generate [lima] bash autocomplete\n"
    limactl completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_lima.bash"

    # apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/lima] to [${AP_SOFT_DIR}/lima/bin/lima]\n"
    # ln -sf "${AP_SOFT_DIR}/lima/bin/lima" "${AP_SOFT_DIR}/bin/lima"

    # apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/limactl] to [${AP_SOFT_DIR}/lima/bin/limactl]\n"
    # ln -sf "${AP_SOFT_DIR}/lima/bin/limactl" "${AP_SOFT_DIR}/bin/limactl"

    if alias apcreatedirstructlimashare &>/dev/null; then
        apcreatedirstructlimashare
    fi

    if alias apcreatedirstructlimacommon &>/dev/null; then
        apcreatedirstructlimacommon
    fi

    if alias apcreatedirstructlimamain &>/dev/null; then
        apcreatedirstructlimamain
    fi
}

alias aprmdirstructlima="ap_func_rm_dirstruct_lima"
ap_func_rm_dirstruct_lima() {
    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_lima.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_lima.bash"

    # apshowmsginfo "Remove [${AP_SOFT_DIR}/bin/lima*]\n"
    # rm -f "${AP_SOFT_DIR}/bin/lima"*

    if alias aprmdirstructlimashare &>/dev/null; then
        aprmdirstructlimashare
    fi

    if alias aprmdirstructlimacommon &>/dev/null; then
        aprmdirstructlimacommon
    fi

    if alias aprmdirstructlimamain &>/dev/null; then
        aprmdirstructlimamain
    fi
}

alias apcreateglobalsymlinklima="ap_func_create_global_symlink_lima"
ap_func_create_global_symlink_lima() {
    if [ -f "${AP_SOFT_DIR}/bin/lima" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/lima] to [${AP_SOFT_DIR}/bin/lima]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/lima" "/usr/local/bin/lima"
    fi
}

alias aprmglobalsymlinklima="ap_func_rm_global_symlink_lima"
ap_func_rm_global_symlink_lima() {
    if [ -f "/usr/local/bin/lima" ]; then
        apshowmsginfo "Remove [/usr/local/bin/lima]\n"
        sudo rm -f "/usr/local/bin/lima"
    fi
}

alias apsetuplima="ap_func_setup_lima"
ap_func_setup_lima() {
    apshowmsginfo "Install [lima]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/lima"
    rm -rf "${AP_TMP_DIR}/lima"

    # Install lima
    mkdir -p "${AP_TMP_DIR}/lima"
    mkdir -p "${AP_SOFT_DIR}/lima"
    cd "${AP_TMP_DIR}/lima"

    local ap_dl_link
    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        if [[ "$(uname -m)" == 'arm64' ]]; then
            ap_dl_link="$(curl --silent "https://api.github.com/repos/lima-vm/lima/releases" | jq -r '.[0].assets[].browser_download_url' | grep "Darwin" | grep arm64 | grep -v guestagents)"
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            ap_dl_link="$(curl --silent "https://api.github.com/repos/lima-vm/lima/releases" | jq -r '.[0].assets[].browser_download_url' | grep "Darwin" | grep x86_64 | grep -v guestagents)"
        fi
        apshowmsginfo "Downloading [lima] for macos from ${ap_dl_link}\n"
        curl -SL "${ap_dl_link}" >lima.tar.gz
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_dl_link="$(curl --silent "https://api.github.com/repos/lima-vm/lima/releases" | jq -r '.[0].assets[].browser_download_url' | grep "Linux" | grep x86_64 | grep -v guestagents)"
        apshowmsginfo "Downloading [lima] for linux from ${ap_dl_link}\n"
        curl -SL "${ap_dl_link}" >lima.tar.gz
    fi

    tar -zxf lima.tar.gz
    # rm -f lima.tar.gz

    cd share/lima
    gunzip lima-guestagent.Linux-aarch64.gz
    chmod +x lima-guestagent.Linux-aarch64
    mv lima-guestagent.Linux-aarch64 ../../bin/
    cd ../../

    mv bin "${AP_SOFT_DIR}/lima/"
    mv share "${AP_SOFT_DIR}/lima/"
    cd "${AP_SOFT_DIR}/lima"
    # rm -rf "${AP_TMP_DIR}/lima"

    apinitlima

    if alias apcreateglobalsymlinklima &>/dev/null; then
        apcreatedirstructlima
    fi

    if alias apcreatedirstructlima &>/dev/null; then
        apcreatedirstructlima
    fi
}

alias aprmlima="ap_func_rm_lima"
ap_func_rm_lima() {
    apshowmsginfo "Remove [lima]\n"

    rm -rf "${AP_SOFT_DIR}/lima"

    if alias aprmdirstructlima &>/dev/null; then
        aprmdirstructlima
    fi

    if alias aprmglobalsymlinklima &>/dev/null; then
        aprmglobalsymlinklima
    fi
}
