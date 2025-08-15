alias apinittwilio="ap_func_init_twilio"
ap_func_init_twilio() {
    if alias apinittwilioshare &>/dev/null; then
        apinittwilioshare
    fi

    if alias apinittwiliocommon &>/dev/null; then
        apinittwiliocommon
    fi

    if alias apinittwiliomain &>/dev/null; then
        apinittwiliomain
    fi
}

alias apcreatedirstructtwilio="ap_func_create_dirstruct_twilio"
ap_func_create_dirstruct_twilio() {
    apshowmsginfo "Generate [twilio] bash autocomplete\n"
    twilio autocomplete bash
    printf "eval $(twilio autocomplete:script bash)" >"${AP_COMPLETIONS_DIR}/ap_completion_twilio.bash"
    echo >>"${AP_COMPLETIONS_DIR}/ap_completion_twilio.bash"
    echo "complete -F _twilio_autocomplete tw" >>"${AP_COMPLETIONS_DIR}/ap_completion_twilio.bash"

    if alias apcreatedirstructtwilioshare &>/dev/null; then
        apcreatedirstructtwilioshare
    fi

    if alias apcreatedirstructtwiliocommon &>/dev/null; then
        apcreatedirstructtwiliocommon
    fi

    if alias apcreatedirstructtwiliomain &>/dev/null; then
        apcreatedirstructtwiliomain
    fi
}

alias aprmdirstructtwilio="ap_func_rm_dirstruct_twilio"
ap_func_rm_dirstruct_twilio() {
    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_twilio.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_twilio.bash"

    if alias aprmdirstructtwilioshare &>/dev/null; then
        aprmdirstructtwilioshare
    fi

    if alias aprmdirstructtwiliocommon &>/dev/null; then
        aprmdirstructtwiliocommon
    fi

    if alias aprmdirstructtwiliomain &>/dev/null; then
        aprmdirstructtwiliomain
    fi
}

alias apsetuptwilio="ap_func_setup_twilio"
ap_func_setup_twilio() {
    apshowmsginfo "Install [twilio]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew tap twilio/brew && brew install twilio
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        wget -qO- https://twilio-cli-prod.s3.amazonaws.com/twilio_pub.asc | sudo apt-key add -
        sudo touch /etc/apt/sources.list.d/twilio.list
        echo 'deb https://twilio-cli-prod.s3.amazonaws.com/apt/ /' | sudo tee /etc/apt/sources.list.d/twilio.list
        sudo apt update
        sudo apt install -y twilio
    fi

    apinittwilio

    if alias apcreateglobalsymlinktwilio &>/dev/null; then
        apcreatedirstructtwilio
    fi

    if alias apcreatedirstructtwilio &>/dev/null; then
        apcreatedirstructtwilio
    fi
}

alias aprmtwilio="ap_func_rm_twilio"
ap_func_rm_twilio() {
    apshowmsginfo "Remove [twilio]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove twilio
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y twilio
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructtwilio &>/dev/null; then
        aprmdirstructtwilio
    fi

    if alias aprmglobalsymlinktwilio &>/dev/null; then
        aprmglobalsymlinktwilio
    fi
}
