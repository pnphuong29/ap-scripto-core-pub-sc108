alias apinitmarp="ap_func_init_marp"
ap_func_init_marp() {
	if alias apinitmarpshare &>/dev/null; then
		apinitmarpshare
	fi

	if alias apinitmarpcommon &>/dev/null; then
		apinitmarpcommon
	fi

	if alias apinitmarpmain &>/dev/null; then
		apinitmarpmain
	fi
}

alias apcreatedirstructmarp="ap_func_create_dirstruct_marp"
ap_func_create_dirstruct_marp() {
	if alias apcreatedirstructmarpshare &>/dev/null; then
		apcreatedirstructmarpshare
	fi

	if alias apcreatedirstructmarpcommon &>/dev/null; then
		apcreatedirstructmarpcommon
	fi

	if alias apcreatedirstructmarpmain &>/dev/null; then
		apcreatedirstructmarpmain
	fi
}

alias aprmdirstructmarp="ap_func_rm_dirstruct_marp"
ap_func_rm_dirstruct_marp() {
	if alias aprmdirstructmarpshare &>/dev/null; then
		aprmdirstructmarpshare
	fi

	if alias aprmdirstructmarpcommon &>/dev/null; then
		aprmdirstructmarpcommon
	fi

	if alias aprmdirstructmarpmain &>/dev/null; then
		aprmdirstructmarpmain
	fi
}

alias apsetupmarp="ap_func_setup_marp"
ap_func_setup_marp() {
	apshowmsginfo "Install [marp]\n"

	pnpm install -g @marp-team/marp-cli
	apinitmarp

	if alias apcreateglobalsymlinkmarp &>/dev/null; then
		apcreatedirstructmarp
	fi

	if alias apcreatedirstructmarp &>/dev/null; then
		apcreatedirstructmarp
	fi
}

alias aprmmarp="ap_func_rm_marp"
ap_func_rm_marp() {
	apshowmsginfo "Remove [marp]\n"

	pnpm uninstall -g @marp-team/marp-cli

	if alias aprmdirstructmarp &>/dev/null; then
		aprmdirstructmarp
	fi

	if alias aprmglobalsymlinkmarp &>/dev/null; then
		aprmglobalsymlinkmarp
	fi
}
