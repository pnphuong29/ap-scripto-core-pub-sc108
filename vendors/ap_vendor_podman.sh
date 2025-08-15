alias apinitpodman="ap_func_init_podman"
ap_func_init_podman() {
    if alias apinitpodmanshare &>/dev/null; then
        apinitpodmanshare
    fi

    if alias apinitpodmancommon &>/dev/null; then
        apinitpodmancommon
    fi

    if alias apinitpodmanmain &>/dev/null; then
        apinitpodmanmain
    fi
}

alias apcreatedirstructpodman="ap_func_create_dirstruct_podman"
ap_func_create_dirstruct_podman() {
    apshowmsginfo "Generate [podman] bash autocomplete\n"
    podman completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_podman.bash"

    # Find and append " pm" at the end of lines containing "__start_podman podman"
    if [ -f "${AP_COMPLETIONS_DIR}/ap_completion_podman.bash" ]; then
        gsed -i.bak 's/\(__start_podman podman\)$/\1 pm/g' "${AP_COMPLETIONS_DIR}/ap_completion_podman.bash"
        rm -f "${AP_COMPLETIONS_DIR}/ap_completion_podman.bash.bak"
    fi

    # https://podman-desktop.io/docs/troubleshooting/troubleshooting-podman-on-macos
    if [ -f "${HOME}/scripto-share/vendors/podman/containers.conf" ]; then
        apshowmsginfo "Create symlink from [${HOME}/.config/containers/containers.conf] to [${HOME}/scripto-share/vendors/podman/containers.conf]\n"
        ln -sf "${HOME}/scripto-share/vendors/podman/containers.conf" "${HOME}/.config/containers/containers.conf"
    fi

    if alias apcreatedirstructpodmanshare &>/dev/null; then
        apcreatedirstructpodmanshare
    fi

    if alias apcreatedirstructpodmancommon &>/dev/null; then
        apcreatedirstructpodmancommon
    fi

    if alias apcreatedirstructpodmanmain &>/dev/null; then
        apcreatedirstructpodmanmain
    fi
}

alias aprmdirstructpodman="ap_func_rm_dirstruct_podman"
ap_func_rm_dirstruct_podman() {
    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_podman.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_podman.bash"

    if alias aprmdirstructpodmanshare &>/dev/null; then
        aprmdirstructpodmanshare
    fi

    if alias aprmdirstructpodmancommon &>/dev/null; then
        aprmdirstructpodmancommon
    fi

    if alias aprmdirstructpodmanmain &>/dev/null; then
        aprmdirstructpodmanmain
    fi
}

alias apsetuppodman="ap_func_setup_podman"
ap_func_setup_podman() {
    apshowmsginfo "Install [podman]\n"

    # Remove old app dir if any
    rm -rf "${AP_TMP_DIR}/podman"

    # Install podman
    mkdir -p "${AP_TMP_DIR}/podman"
    cd "${AP_TMP_DIR}/podman"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # https://podman-desktop.io/docs/troubleshooting/troubleshooting-podman-on-macos
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/containers/gvisor-tap-vsock/releases" | jq -r '.[0].assets[].browser_download_url' | grep "darwin")" >gvproxy
        chmod +x gvproxy
        sudo mv gvproxy /usr/local/bin/

        # https://github.com/crc-org/vfkit
        curl -SL \
            "$(curl --silent "https://api.github.com/repos/crc-org/vfkit/releases" | jq -r '.[0].assets[].browser_download_url' | grep "vfkit" | grep -v "unsigned")" >vfkit
        chmod +x vfkit
        sudo mv vfkit /usr/local/bin/

        if [[ "$(uname -m)" == 'arm64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/containers/podman/releases" | jq -r '.[0].assets[].browser_download_url' | grep "darwin" | grep arm64)" >podman.zip
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            curl -SL \
                "$(curl --silent "https://api.github.com/repos/containers/podman/releases" | jq -r '.[0].assets[].browser_download_url' | grep "darwin" | grep amd64)" >podman.zip
        fi

        unzip podman.zip
        rm -f podman.zip

        mv podman* podman
        mv podman/usr/bin/* "${AP_SOFT_DIR}/bin/"
        mv podman/docs/* "${AP_MAN_DIR}/man1/"
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        # Install required libraries
        # https://gitlab.com/virtio-fs/virtiofsd
        sudo apt-get install -y qemu-system-x86 libcap-ng-dev libseccomp-dev virtiofsd

        git clone https://gitlab.com/virtio-fs/virtiofsd
        cd virtiofsd
        cargo build --release
        sudo cp target/release/virtiofsd /usr/local/bin/

        cd "${AP_TMP_DIR}/podman"

        curl -SL \
            "$(curl --silent "https://api.github.com/repos/containers/gvisor-tap-vsock/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep "amd64")" >gvproxy
        chmod +x gvproxy
        sudo mv gvproxy /usr/local/bin/

        curl -SL \
            "$(curl --silent "https://api.github.com/repos/containers/podman/releases" | jq -r '.[0].assets[].browser_download_url' | grep "linux" | grep amd64)" >podman.tar.gz
        tar -zxf podman.tar.gz
        rm -f podman.tar.gz
        sudo mv bin/podman* "${AP_SOFT_DIR}/bin/podman"
    fi

    # Install podman-compose
    uv tool install podman-compose

    apinitpodman

    if alias apcreateglobalsymlinkpodman &>/dev/null; then
        apcreatedirstructpodman
    fi

    if alias apcreatedirstructpodman &>/dev/null; then
        apcreatedirstructpodman
    fi
}

alias aprmpodman="ap_func_rm_podman"
ap_func_rm_podman() {
    apshowmsginfo "Remove [podman]\n"

    sudo rm -f /usr/local/bin/podman*
    sudo rm -f /usr/local/man/man1/podman*
    sudo rm -f /usr/local/bin/gvproxy
    sudo rm -f /usr/local/bin/vfkit

    if alias aprmdirstructpodman &>/dev/null; then
        aprmdirstructpodman
    fi

    if alias aprmglobalsymlinkpodman &>/dev/null; then
        aprmglobalsymlinkpodman
    fi
}
