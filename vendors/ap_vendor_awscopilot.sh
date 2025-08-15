alias apinitawscopilot="ap_func_init_awscopilot"
ap_func_init_awscopilot() {
    if alias apinitawscopilotshare &>/dev/null; then
        apinitawscopilotshare
    fi

    if alias apinitawscopilotcommon &>/dev/null; then
        apinitawscopilotcommon
    fi

    if alias apinitawscopilotmain &>/dev/null; then
        apinitawscopilotmain
    fi
}

alias apcreatedirstructawscopilot="ap_func_create_dirstruct_awscopilot"
ap_func_create_dirstruct_awscopilot() {
    apshowmsginfo "Generate [awscopilot] bash autocomplete\n"
    awscopilot completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_awscopilot.bash"

    if alias apcreatedirstructawscopilotshare &>/dev/null; then
        apcreatedirstructawscopilotshare
    fi

    if alias apcreatedirstructawscopilotcommon &>/dev/null; then
        apcreatedirstructawscopilotcommon
    fi

    if alias apcreatedirstructawscopilotmain &>/dev/null; then
        apcreatedirstructawscopilotmain
    fi
}

alias aprmdirstructawscopilot="ap_func_rm_dirstruct_awscopilot"
ap_func_rm_dirstruct_awscopilot() {
    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_awscopilot.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_awscopilot.bash"

    if alias aprmdirstructawscopilotshare &>/dev/null; then
        aprmdirstructawscopilotshare
    fi

    if alias aprmdirstructawscopilotcommon &>/dev/null; then
        aprmdirstructawscopilotcommon
    fi

    if alias aprmdirstructawscopilotmain &>/dev/null; then
        aprmdirstructawscopilotmain
    fi
}

alias apsetupawscopilot="ap_func_setup_awscopilot"
ap_func_setup_awscopilot() {
    apshowmsginfo "Install [aws copilot]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        # brew install aws/tap/copilot-cli
        if [[ "$(uname -m)" == 'arm64' ]]; then
            sudo curl -Lo /usr/local/bin/awscopilot https://github.com/aws/copilot-cli/releases/latest/download/copilot-darwin-arm64
        elif [[ "$(uname -m)" == 'x86_64' ]]; then
            sudo curl -Lo /usr/local/bin/awscopilot https://github.com/aws/copilot-cli/releases/latest/download/copilot-darwin
        fi
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo curl -Lo /usr/local/bin/awscopilot https://github.com/aws/copilot-cli/releases/latest/download/copilot-linux
    fi

    sudo chmod +x /usr/local/bin/awscopilot
    apinitawscopilot

    if alias apcreateglobalsymlinkawscopilot &>/dev/null; then
        apcreatedirstructawscopilot
    fi

    if alias apcreatedirstructawscopilot &>/dev/null; then
        apcreatedirstructawscopilot
    fi
}

alias aprmawscopilot="ap_func_rm_awscopilot"
ap_func_rm_awscopilot() {
    apshowmsginfo "Remove [aws copilot]\n"

    # brew remove aws/tap/copilot-cli
    sudo rm -f /usr/local/bin/awscopilot

    if alias aprmdirstructawscopilot &>/dev/null; then
        aprmdirstructawscopilot
    fi

    if alias aprmglobalsymlinkawscopilot &>/dev/null; then
        aprmglobalsymlinkawscopilot
    fi
}
