alias apinitdocker="ap_func_init_docker"
ap_func_init_docker() {
    if alias apinitdockershare &>/dev/null; then
        apinitdockershare
    fi

    if alias apinitdockercommon &>/dev/null; then
        apinitdockercommon
    fi
}

alias apcreatedirstructdocker="ap_func_create_dirstruct_docker"
ap_func_create_dirstruct_docker() {
    apshowmsginfo "Generate [docker] bash autocomplete\n"
    docker completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_docker.bash"

    if alias apcreatedirstructdockershare &>/dev/null; then
        apcreatedirstructdockershare
    fi

    if alias apcreatedirstructdockercommon &>/dev/null; then
        apcreatedirstructdockercommon
    fi
}

alias aprmdirstructdocker="ap_func_rm_dirstruct_docker"
ap_func_rm_dirstruct_docker() {
    if alias aprmdirstructdockershare &>/dev/null; then
        aprmdirstructdockershare
    fi

    if alias aprmdirstructdockercommon &>/dev/null; then
        aprmdirstructdockercommon
    fi
}

alias apsetupdocker="ap_func_setup_docker"
ap_func_setup_docker() {
    # https://docs.docker.com/engine/install/ubuntu/
    # https://docs.docker.com/compose/install/
    apshowmsginfo "Install [docker]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install --cask docker
        # curl -SOL https://desktop.docker.com/mac/main/amd64/Docker.dmg # Intel chip
        # curl -SOL https://desktop.docker.com/mac/main/arm64/Docker.dmg # Apple chip
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt update
        sudo apt install -y \
            ca-certificates \
            curl \
            gnupg \
            lsb-release

        sudo mkdir -m 0755 -p /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        sudo chmod a+r /etc/apt/keyrings/docker.gpg

        echo \
            "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
			$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

        # Remove old versions (keep data)
        sudo apt remove -y docker docker-engine docker.io containerd runc

        # Install docker
        sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

        # cd "${AP_TMP_DIR}"
        # curl -fsSL https://get.docker.com -o get-docker.sh
        # DRY_RUN=1 sudo sh get-docker.sh

        # Install docker-compose v2
        # DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
        # mkdir -p $DOCKER_CONFIG/cli-plugins
        # curl -SL https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
        # chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
    fi

    apinitdocker
    if alias apcreatedirstructdocker &>/dev/null; then
        apcreatedirstructdocker
    fi
}

alias aprmdocker="ap_func_rm_docker"
ap_func_rm_docker() {
    apshowmsginfo "Remove [docker]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask docker
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt purge -y docker-ce docker-ce-cli containerd.io
        sudo rm -rf /var/lib/docker
        sudo rm -rf /var/lib/containerd
    fi

    if alias aprmdirstructdocker &>/dev/null; then
        aprmdirstructdocker
    fi
}
