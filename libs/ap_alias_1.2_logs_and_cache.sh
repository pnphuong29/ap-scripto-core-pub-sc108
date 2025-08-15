# Logs
alias enablelogdebug='echo "Enable debug log"; export AP_LOGS_DEBUG_ENABLED=1'
alias disablelogdebug='echo "Disable debug log"; export AP_LOGS_DEBUG_ENABLED=0'
alias islogdebugenabled='echo "AP_LOGS_DEBUG_ENABLED=${AP_LOGS_DEBUG_ENABLED}"'

alias enableloggeneral='echo "Enable geneal log"; export AP_LOGS_GENERAL_ENABLED=1'
alias disableloggeneral='echo "Enable geneal log"; export AP_LOGS_GENERAL_ENABLED=0'
alias isloggeneralenabled='echo "AP_LOGS_GENERAL_ENABLED=${AP_LOGS_GENERAL_ENABLED}"'

# Cache
alias e='echo "Enable scripto cache"; printf "1" >"${AP_CACHE_FLAG}"'
alias enablecache='echo "Enable scripto cache"; printf "1" >"${AP_CACHE_FLAG}"'
alias d='echo "Disable scripto cache"; printf "0" >"${AP_CACHE_FLAG}"'
alias disablecache='echo "Disable scripto cache"; printf "0" >"${AP_CACHE_FLAG}"'
alias r='echo "Renew scripto cache"; printf "2" >"${AP_CACHE_FLAG}"'
alias renewcache='echo "Renew scripto cache"; printf "2" >"${AP_CACHE_FLAG}"'
alias iscacheenabled="cat \${AP_CACHE_FLAG};echo"
alias clearcache='rm -rf "${AP_CACHE_DIR}"/*'
