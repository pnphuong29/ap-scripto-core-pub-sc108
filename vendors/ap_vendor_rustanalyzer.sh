alias apinitrustanalyzer="ap_func_init_rustanalyzer"
ap_func_init_rustanalyzer() {
    if alias apinitrustanalyzershare &>/dev/null; then
        apinitrustanalyzershare
    fi

    if alias apinitrustanalyzercommon &>/dev/null; then
        apinitrustanalyzercommon
    fi

    if alias apinitrustanalyzermain &>/dev/null; then
        apinitrustanalyzermain
    fi
}

alias apcreatedirstructrustanalyzer="ap_func_create_dirstruct_rustanalyzer"
ap_func_create_dirstruct_rustanalyzer() {
    if alias apcreatedirstructrustanalyzershare &>/dev/null; then
        apcreatedirstructrustanalyzershare
    fi

    if alias apcreatedirstructrustanalyzercommon &>/dev/null; then
        apcreatedirstructrustanalyzercommon
    fi

    if alias apcreatedirstructrustanalyzermain &>/dev/null; then
        apcreatedirstructrustanalyzermain
    fi
}

alias aprmdirstructrustanalyzer="ap_func_rm_dirstruct_rustanalyzer"
ap_func_rm_dirstruct_rustanalyzer() {
    if alias aprmdirstructrustanalyzershare &>/dev/null; then
        aprmdirstructrustanalyzershare
    fi

    if alias aprmdirstructrustanalyzercommon &>/dev/null; then
        aprmdirstructrustanalyzercommon
    fi

    if alias aprmdirstructrustanalyzermain &>/dev/null; then
        aprmdirstructrustanalyzermain
    fi
}

alias apsetuprustanalyzer="ap_func_setup_rustanalyzer"
ap_func_setup_rustanalyzer() {
    apshowmsginfo "Install [rust-analyzer]\n"

    curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - >~/.local/bin/rust-analyzer
    chmod +x ~/.local/bin/rust-analyzer
    apinitrustanalyzer

    if alias apcreateglobalsymlinkrustanalyzer &>/dev/null; then
        apcreatedirstructrustanalyzer
    fi

    if alias apcreatedirstructrustanalyzer &>/dev/null; then
        apcreatedirstructrustanalyzer
    fi
}

alias aprmrustanalyzer="ap_func_rm_rustanalyzer"
ap_func_rm_rustanalyzer() {
    apshowmsginfo "Remove [rust-analyzer]\n"

    rm -f "${HOME}/.local/bin/rust-analyzer"

    if alias aprmdirstructrustanalyzer &>/dev/null; then
        aprmdirstructrustanalyzer
    fi

    if alias aprmglobalsymlinkrustanalyzer &>/dev/null; then
        aprmglobalsymlinkrustanalyzer
    fi
}
