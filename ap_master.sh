source "${HOME}/scripto/core/ap_core.sh"

if [ -s "${AP_CACHE_DIR}/sc108_ap_master_part_1.sh" ] && [ "$(cat "${AP_CACHE_FLAG}")" == '1' ]; then
    echo "Using cache file [sc108_ap_master_part_1.sh]"
    source "${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
elif [ -s "${AP_CACHE_DIR}/sc108_ap_master_part_1.sh" ] && [ "$(cat "${AP_CACHE_FLAG}")" == '2' ]; then
    echo "Renewing cache file [sc108_ap_master_part_1.sh]"
    true >"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"

    # Load scripto share server environment variables
    if [ -d "${HOME}/scripto-share/libs" ]; then
        while read -r ap_env; do
            # source "${ap_env}"
            cat "${ap_env}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
        done < <(gfind "${HOME}/scripto-share/libs" -maxdepth 1 -type f -name "ap_servers*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto main server environment variables
    if [ -d "${HOME}/scripto-main/libs" ]; then
        while read -r ap_env; do
            # source "${ap_env}"
            cat "${ap_env}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
        done < <(gfind "${HOME}/scripto-main/libs" -maxdepth 1 -type f -name "ap_servers*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto environment variables
    if [ -d "${HOME}/scripto/libs" ]; then
        while read -r ap_env; do
            # source "${ap_env}"
            cat "${ap_env}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
        done < <(gfind "${HOME}/scripto/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto share environment variables
    if [ -d "${HOME}/scripto-share/libs" ]; then
        while read -r ap_env; do
            # source "${ap_env}"
            cat "${ap_env}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
        done < <(gfind "${HOME}/scripto-share/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto common environment variables
    if [ -d "${HOME}/scripto-common/libs" ]; then
        while read -r ap_env; do
            # source "${ap_env}"
            cat "${ap_env}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
        done < <(gfind "${HOME}/scripto-common/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto main environment variables
    if [ -d "${HOME}/scripto-main/libs" ]; then
        while read -r ap_env; do
            # source "${ap_env}"
            cat "${ap_env}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
        done < <(gfind "${HOME}/scripto-main/libs" -maxdepth 1 -type f -name "ap_env_*.sh" | grep -v -e "7s" | sort)
    fi

    source "${AP_CACHE_DIR}/sc108_ap_master_part_1.sh"
fi

# Load scripto core libraries
source "${HOME}/scripto/libs/ap_core.sh"

# Try to simulate macOS GNU commands
# Using symbolic links instead of aliases for all users including root cannot access to below commands
if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    [ ! -L /usr/local/bin/gfind ] && sudo ln -sf /usr/bin/find /usr/local/bin/gfind
    [ ! -L /usr/local/bin/gdate ] && sudo ln -sf /usr/bin/date /usr/local/bin/gdate
    [ ! -L /usr/local/bin/gsed ] && sudo ln -sf /usr/bin/sed /usr/local/bin/gsed
    [ ! -L /usr/local/bin/gxargs ] && sudo ln -sf /usr/bin/xargs /usr/local/bin/gxargs
    [ ! -L /usr/local/bin/md5 ] && sudo ln -sf /usr/bin/md5sum /usr/local/bin/md5
fi

if [ -s "${AP_CACHE_DIR}/sc108_ap_master_part_2.sh" ] && [ "$(cat "${AP_CACHE_FLAG}")" == '1' ]; then
    echo "Using cache file [sc108_ap_master_part_2.sh]"
    source "${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
else
    echo "Renewing cache file [sc108_ap_master_part_2.sh]"
    true >"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"

    # Load scripto aliases
    if [ -d "${HOME}/scripto/libs" ]; then
        while read -r ap_alias; do
            # source "${ap_alias}"
            cat "${ap_alias}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto/libs" -maxdepth 1 -type f -name "ap_alias_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto functions
    if [ -d "${HOME}/scripto/libs" ]; then
        while read -r ap_func; do
            # source "${ap_func}"
            cat "${ap_func}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto/libs" -maxdepth 1 -type f -name "ap_func_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto share aliases
    if [ -d "${HOME}/scripto-share/libs" ]; then
        while read -r ap_alias; do
            # source "${ap_alias}"
            cat "${ap_alias}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-share/libs" -maxdepth 1 -type f -name "ap_alias_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto common aliases
    if [ -d "${HOME}/scripto-common/libs" ]; then
        while read -r ap_alias; do
            # source "${ap_alias}"
            cat "${ap_alias}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-common/libs" -maxdepth 1 -type f -name "ap_alias_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto main aliases
    if [ -d "${HOME}/scripto-main/libs" ]; then
        while read -r ap_alias; do
            # source "${ap_alias}"
            cat "${ap_alias}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-main/libs" -maxdepth 1 -type f -name "ap_alias_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto share vendors
    if [ -d "${HOME}/scripto-share/vendors" ]; then
        while read -r ap_vendor; do
            # source "${ap_vendor}"
            cat "${ap_vendor}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-share/vendors" -maxdepth 1 -type f -name "ap_vendor_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto common vendors
    if [ -d "${HOME}/scripto-common/vendors" ]; then
        while read -r ap_vendor; do
            # source "${ap_vendor}"
            cat "${ap_vendor}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-common/vendors" -maxdepth 1 -type f -name "ap_vendor_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto main vendors
    if [ -d "${HOME}/scripto-main/vendors" ]; then
        while read -r ap_vendor; do
            # source "${ap_vendor}"
            cat "${ap_vendor}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-main/vendors" -maxdepth 1 -type f -name "ap_vendor_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto vendors
    if [ -d "${HOME}/scripto/vendors" ]; then
        while read -r ap_vendor; do
            # source "${ap_vendor}"
            cat "${ap_vendor}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto/vendors" -maxdepth 1 -type f -name "ap_vendor_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load share functions
    if [ -d "${HOME}/scripto-share/libs" ]; then
        while read -r ap_func; do
            # source "${ap_func}"
            cat "${ap_func}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-share/libs" -maxdepth 1 -type f -name "ap_func_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto common functions
    if [ -d "${HOME}/scripto-common/libs" ]; then
        while read -r ap_func; do
            # source "${ap_func}"
            cat "${ap_func}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-common/libs" -maxdepth 1 -type f -name "ap_func_*.sh" | grep -v -e "7s" | sort)
    fi

    # Load scripto main functions
    if [ -d "${HOME}/scripto-main/libs" ]; then
        while read -r ap_func; do
            # source "${ap_func}"
            cat "${ap_func}" >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
            echo >>"${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
        done < <(gfind "${HOME}/scripto-main/libs" -maxdepth 1 -type f -name "ap_func_*.sh" | grep -v -e "7s" | sort)
    fi

    source "${AP_CACHE_DIR}/sc108_ap_master_part_2.sh"
fi

# Update $PATH
apaddpath "${HOME}/scripto/utils"
apaddpath "${HOME}/scripto-share/utils"
apaddpath "${HOME}/scripto-common/utils"
apaddpath "${HOME}/scripto-main/utils"

apaddpath "${HOME}/scripto-share/tests"
apaddpath "${HOME}/scripto-common/tests"
apaddpath "${HOME}/scripto-main/tests"

# Make executable files
[ -d "${HOME}/scripto-share/utils" ] && chmod -R +x "${HOME}/scripto-share/utils"
[ -d "${HOME}/scripto-share/tests" ] && chmod -R +x "${HOME}/scripto-share/tests"

[ -d "${HOME}/scripto-common/utils" ] && chmod -R +x "${HOME}/scripto-common/utils"
[ -d "${HOME}/scripto-common/tests" ] && chmod -R +x "${HOME}/scripto-common/tests"

[ -d "${HOME}/scripto-main/utils" ] && chmod -R +x "${HOME}/scripto-main/utils"
[ -d "${HOME}/scripto-main/tests" ] && chmod -R +x "${HOME}/scripto-main/tests"

# For manpath command to search for man pages located in man directory
# export MANPATH="${AP_MAN_DIR}:${MANPATH}"
apaddpath -m "${AP_MAN_DIR}"
