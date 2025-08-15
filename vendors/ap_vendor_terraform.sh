alias apinitterraform="ap_func_init_terraform"
ap_func_init_terraform() {
    if alias apinitterraformshare &>/dev/null; then
        apinitterraformshare
    fi

    if alias apinitterraformcommon &>/dev/null; then
        apinitterraformcommon
    fi

    if alias apinitterraformmain &>/dev/null; then
        apinitterraformmain
    fi
}

alias apcreatedirstructterraform="ap_func_create_dirstruct_terraform"
ap_func_create_dirstruct_terraform() {
    apshowmsginfo "Generate [terraform] bash autocomplete\n"
    terraform -install-autocomplete

    if alias apcreatedirstructterraformshare &>/dev/null; then
        apcreatedirstructterraformshare
    fi

    if alias apcreatedirstructterraformcommon &>/dev/null; then
        apcreatedirstructterraformcommon
    fi

    if alias apcreatedirstructterraformmain &>/dev/null; then
        apcreatedirstructterraformmain
    fi
}

alias aprmdirstructterraform="ap_func_rm_dirstruct_terraform"
ap_func_rm_dirstruct_terraform() {
    apshowmsginfo "Remove [terraform] bash autocomplete\n"
    terraform -uninstall-autocomplete

    if alias aprmdirstructterraformshare &>/dev/null; then
        aprmdirstructterraformshare
    fi

    if alias aprmdirstructterraformcommon &>/dev/null; then
        aprmdirstructterraformcommon
    fi

    if alias aprmdirstructterraformmain &>/dev/null; then
        aprmdirstructterraformmain
    fi
}

alias apsetupterraform="ap_func_setup_terraform"
ap_func_setup_terraform() {
    apshowmsginfo "Install [terraform]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew tap hashicorp/tap
        brew install hashicorp/tap/terraform
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
        sudo apt update && sudo apt install terraform
    fi

    apinitterraform

    if alias apcreateglobalsymlinkterraform &>/dev/null; then
        apcreatedirstructterraform
    fi

    if alias apcreatedirstructterraform &>/dev/null; then
        apcreatedirstructterraform
    fi
}

alias aprmterraform="ap_func_rm_terraform"
ap_func_rm_terraform() {
    apshowmsginfo "Remove [terraform]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove terraform
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo apt remove --purge -y terraform
        sudo apt autoremove --purge -y
    fi

    if alias aprmdirstructterraform &>/dev/null; then
        aprmdirstructterraform
    fi

    if alias aprmglobalsymlinkterraform &>/dev/null; then
        aprmglobalsymlinkterraform
    fi
}
