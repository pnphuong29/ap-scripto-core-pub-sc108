alias apinitgnuparallel="ap_func_init_gnuparallel"
ap_func_init_gnuparallel() {
    if [ -d "${AP_SOFT_DIR}/gnu-parallel/share/man" ]; then
        apaddpath -m "${AP_SOFT_DIR}/gnu-parallel/share/man"
    fi

    if alias apinitgnuparallelshare &>/dev/null; then
        apinitgnuparallelshare
    fi

    if alias apinitgnuparallelcommon &>/dev/null; then
        apinitgnuparallelcommon
    fi

    if alias apinitgnuparallelmain &>/dev/null; then
        apinitgnuparallelmain
    fi
}

alias apcreatedirstructgnuparallel="ap_func_create_dirstruct_gnuparallel"
ap_func_create_dirstruct_gnuparallel() {
    if [ -f "${AP_SOFT_DIR}/gnu-parallel/bin/parallel" ]; then
        apshowmsginfo "Create symlink from [${AP_SOFT_DIR}/bin/parallel] to [${AP_SOFT_DIR}/gnu-parallel/bin/parallel]\n"
        ln -sf "${AP_SOFT_DIR}/gnu-parallel/bin/parallel" "${AP_SOFT_DIR}/bin/parallel"
    fi

    if alias apcreatedirstructgnuparallelshare &>/dev/null; then
        apcreatedirstructgnuparallelshare
    fi

    if alias apcreatedirstructgnuparallelcommon &>/dev/null; then
        apcreatedirstructgnuparallelcommon
    fi

    if alias apcreatedirstructgnuparallelmain &>/dev/null; then
        apcreatedirstructgnuparallelmain
    fi
}

alias aprmdirstructgnuparallel="ap_func_rm_dirstruct_gnuparallel"
ap_func_rm_dirstruct_gnuparallel() {
    apshowmsginfo "Remove [${AP_SOFT_DIR}/bin/parallel]\n"
    rm -f "${AP_SOFT_DIR}/bin/parallel"

    if alias aprmdirstructgnuparallelshare &>/dev/null; then
        aprmdirstructgnuparallelshare
    fi

    if alias aprmdirstructgnuparallelcommon &>/dev/null; then
        aprmdirstructgnuparallelcommon
    fi

    if alias aprmdirstructgnuparallelmain &>/dev/null; then
        aprmdirstructgnuparallelmain
    fi
}

alias apcreateglobalsymlinkgnuparallel="ap_func_create_global_symlink_gnuparallel"
ap_func_create_global_symlink_gnuparallel() {
    if [ -f "${AP_SOFT_DIR}/gnu-parallel/bin/parallel" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/parallel] to [${AP_SOFT_DIR}/gnu-parallel/bin/parallel]\n"
        sudo ln -sf "${AP_SOFT_DIR}/gnu-parallel/bin/parallel" "/usr/local/bin/parallel"
    fi
}

alias aprmglobalsymlinkgnuparallel="ap_func_rm_global_symlink_gnuparallel"
ap_func_rm_global_symlink_gnuparallel() {
    if [ -f "/usr/local/bin/parallel" ]; then
        apshowmsginfo "Remove [/usr/local/bin/parallel]\n"
        sudo rm -f "/usr/local/bin/parallel"
    fi
}

alias apsetupgnuparallel="ap_func_setup_gnuparallel"
ap_func_setup_gnuparallel() {
    apshowmsginfo "Install [GNU parallel]\n"

    # Remove old app dir if any
    rm -rf "${AP_SOFT_DIR}/gnu-parallel"
    rm -rf "${AP_TMP_DIR}/gnu-parallel"

    # Install gnuparallel
    mkdir -p "${AP_TMP_DIR}/gnu-parallel"
    cd "${AP_TMP_DIR}/gnu-parallel"

    curl -SL "https://ftpmirror.gnu.org/parallel/parallel-latest.tar.bz2" >parallel.tar.bz2

    tar -xjf parallel.tar.bz2
    rm -f parallel.tar.bz2

    mv parallel-* gnu-parallel
    cd "gnu-parallel"
    ./configure --prefix="${AP_SOFT_DIR}/gnu-parallel"
    make
    make install

    cd "${AP_SOFT_DIR}/gnu-parallel"
    # rm -rf "${AP_TMP_DIR}/gnu-parallel"

    apinitgnuparallel

    if alias apcreateglobalsymlinkgnuparallel &>/dev/null; then
        apcreatedirstructgnuparallel
    fi

    if alias apcreatedirstructgnuparallel &>/dev/null; then
        apcreatedirstructgnuparallel
    fi
}

alias aprmgnuparallel="ap_func_rm_gnuparallel"
ap_func_rm_gnuparallel() {
    apshowmsginfo "Remove [GNU parallel]\n"
    rm -rf "${AP_SOFT_DIR}/gnu-parallel"

    if alias aprmdirstructgnuparallel &>/dev/null; then
        aprmdirstructgnuparallel
    fi

    if alias aprmglobalsymlinkgnuparallel &>/dev/null; then
        aprmglobalsymlinkgnuparallel
    fi
}
