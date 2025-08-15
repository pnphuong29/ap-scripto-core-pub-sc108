alias apinitgo="ap_func_init_go"
ap_func_init_go() {
    # https://go.dev/doc/gopath_code
    # https://github.com/golang/go/wiki/SettingGOPATH
    # https://pkg.go.dev/cmd/go#hdr-GOPATH_environment_variable
    export AP_GO_SETUP_VERSION='1.24.2'

    export GOROOT="${AP_SOFT_DIR}/go"
    export GOPATH="${HOME}/go"

    apaddpath "${GOROOT}/bin"
    apaddpath "${GOPATH}/bin"

    alias zgopath="cd \${GOPATH}"
    alias zgomodules="cd \${GOPATH}/pkg/mod"
    alias zgobin="cd \${GOPATH}/bin"

    alias goclean='go clean'
    alias gocleandryrun='go clean -n'
    alias gocleancache='go clean -cache'

    if alias apinitgoshare &>/dev/null; then
        apinitgoshare
    fi

    if alias apinitgocommon &>/dev/null; then
        apinitgocommon
    fi

    if alias apinitgomain &>/dev/null; then
        apinitgomain
    fi
}

alias apcreatedirstructgo="ap_func_create_dirstruct_go"
ap_func_create_dirstruct_go() {
    if alias apcreatedirstructgoshare &>/dev/null; then
        apcreatedirstructgoshare
    fi

    if alias apcreatedirstructgocommon &>/dev/null; then
        apcreatedirstructgocommon
    fi

    if alias apcreatedirstructgomain &>/dev/null; then
        apcreatedirstructgomain
    fi
}

alias aprmdirstructgo="ap_func_rm_dirstruct_go"
ap_func_rm_dirstruct_go() {
    if alias aprmdirstructgoshare &>/dev/null; then
        aprmdirstructgoshare
    fi

    if alias aprmdirstructgocommon &>/dev/null; then
        aprmdirstructgocommon
    fi

    if alias aprmdirstructgomain &>/dev/null; then
        aprmdirstructgomain
    fi
}

alias apcreateglobalsymlinkgo="ap_func_create_global_symlink_go"
ap_func_create_global_symlink_go() {
    if [ -f "${AP_SOFT_DIR}/go/bin/go" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/go] to [${AP_SOFT_DIR}/go/bin/go]\n"
        sudo ln -sf "${AP_SOFT_DIR}/go/bin/go" "/usr/local/bin/go"
    fi

    if [ -f "${AP_SOFT_DIR}/go/bin/gofmt" ]; then
        apshowmsginfo "Create symlink from [/usr/local/bin/gofmt] to [${AP_SOFT_DIR}/go/bin/gofmt]\n"
        sudo ln -sf "${AP_SOFT_DIR}/go/bin/gofmt" "/usr/local/bin/gofmt"
    fi
}

alias aprmglobalsymlinkgo="ap_func_rm_global_symlink_go"
ap_func_rm_global_symlink_go() {
    if [ -f "/usr/local/bin/go" ]; then
        apshowmsginfo "Remove [/usr/local/bin/go]\n"
        sudo rm -f "/usr/local/bin/go"
    fi

    if [ -f "/usr/local/bin/gofmt" ]; then
        apshowmsginfo "Remove [/usr/local/bin/gofmt]\n"
        sudo rm -f "/usr/local/bin/gofmt"
    fi
}

alias apsetupgo="ap_func_setup_go"
ap_func_setup_go() {
    # https://go.dev/doc/install
    # https://go.dev/doc/manage-install
    # https://stackoverflow.com/questions/1210664/no-module-named-sqlite3

    local ap_go_setup_version="${AP_GO_SETUP_VERSION}"
    if [ -n "$1" ]; then
        ap_go_setup_version="$1"
    fi

    apshowmsginfo "Install [go] version [${ap_go_setup_version}]\n"

    local ap_go_dir_name="go"
    local ap_go_src_file_name="go${ap_go_setup_version}.darwin-amd64.tar.gz"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        ap_go_src_file_name="go${ap_go_setup_version}.linux-amd64.tar.gz"
    fi

    local ap_vendors_go_dir="${AP_SOFT_DIR}/go"
    rm -rf "${ap_vendors_go_dir}" # Remove old go directory if any

    export GOROOT="${AP_SOFT_DIR}/go"
    export GOPATH="${HOME}/go"
    ap_go_url="https://golang.org/dl/${ap_go_src_file_name}"

    cd "${AP_TMP_DIR}"
    rm -rf "${ap_go_dir_name}"

    curl -LO "${ap_go_url}"
    tar -zxf "${ap_go_src_file_name}"

    [ ! -d "${ap_vendors_go_dir}" ] && mkdir -p "${ap_vendors_go_dir}"
    cp -R "${ap_go_dir_name}"/. "${ap_vendors_go_dir}/"
    rm -rf "${ap_go_dir_name}"

    apaddpath -a "${GOROOT}/bin"
    apaddpath -a "${GOPATH}/bin"
}

alias aprmgo="ap_func_rm_go"
ap_func_rm_go() {
    apshowmsginfo "Remove [go]\n"

    local ap_go_path, ap_go_root
    ap_go_path="$(go env GOPATH)"
    ap_go_root="$(go env GOROOT)"

    # Remove go libraries
    rm -rf "${ap_go_path}"

    # Remove main go dir
    rm -rf "${ap_go_root}"
}
