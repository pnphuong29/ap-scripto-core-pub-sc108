alias apinitmarkitdown="ap_func_init_markitdown"
ap_func_init_markitdown() {
	if alias apinitmarkitdownshare &>/dev/null; then
		apinitmarkitdownshare
	fi

	if alias apinitmarkitdowncommon &>/dev/null; then
		apinitmarkitdowncommon
	fi

	if alias apinitmarkitdownmain &>/dev/null; then
		apinitmarkitdownmain
	fi
}

alias apcreatedirstructmarkitdown="ap_func_create_dirstruct_markitdown"
ap_func_create_dirstruct_markitdown() {
	if alias apcreatedirstructmarkitdownshare &>/dev/null; then
		apcreatedirstructmarkitdownshare
	fi

	if alias apcreatedirstructmarkitdowncommon &>/dev/null; then
		apcreatedirstructmarkitdowncommon
	fi

	if alias apcreatedirstructmarkitdownmain &>/dev/null; then
		apcreatedirstructmarkitdownmain
	fi
}

alias aprmdirstructmarkitdown="ap_func_rm_dirstruct_markitdown"
ap_func_rm_dirstruct_markitdown() {
	if alias aprmdirstructmarkitdownshare &>/dev/null; then
		aprmdirstructmarkitdownshare
	fi

	if alias aprmdirstructmarkitdowncommon &>/dev/null; then
		aprmdirstructmarkitdowncommon
	fi

	if alias aprmdirstructmarkitdownmain &>/dev/null; then
		aprmdirstructmarkitdownmain
	fi
}

alias apsetupmarkitdown="ap_func_setup_markitdown"
ap_func_setup_markitdown() {
	apshowmsginfo "Install [markitdown]\n"

	uv tool install 'markitdown[all]'
	# pip install 'markitdown[all]'

	apinitmarkitdown

	if alias apcreateglobalsymlinkmarkitdown &>/dev/null; then
		apcreatedirstructmarkitdown
	fi

	if alias apcreatedirstructmarkitdown &>/dev/null; then
		apcreatedirstructmarkitdown
	fi
}

alias aprmmarkitdown="ap_func_rm_markitdown"
ap_func_rm_markitdown() {
	apshowmsginfo "Remove [markitdown]\n"

	uv tool uninstall 'markitdown[all]'
	# pip uninstall 'markitdown[all]'

	if alias aprmdirstructmarkitdown &>/dev/null; then
		aprmdirstructmarkitdown
	fi

	if alias aprmglobalsymlinkmarkitdown &>/dev/null; then
		aprmglobalsymlinkmarkitdown
	fi
}
