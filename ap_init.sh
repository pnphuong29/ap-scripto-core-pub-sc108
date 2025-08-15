source "${HOME}/scripto/core/ap_core.sh"

# This will resolve absolute paths in different platforms such as macOS, Ubuntu, etc.
# in VScode's settings.json file and many more similar cases.
if [[ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]]; then
    if [ ! -L "${AP_HOME}" ]; then
        apshowmsginfo "Create symlink from [${AP_HOME}] to [${HOME}]\n"
        sudo mkdir -p "/Users"
        sudo ln -s "${HOME}" "${AP_HOME}"
    fi
fi

# Cache
apshowmsginfo "Creating directory [${AP_CACHE_DIR}]\n"
mkdir -p "${AP_CACHE_DIR}"

# Configs
apshowmsginfo "Creating directory [${AP_CONFIGS_DIR}]\n"
mkdir -p "${AP_CONFIGS_DIR}"

# Create ${AP_CACHE_FLAG} file if not existed
if [ ! -s "${AP_CACHE_FLAG}" ]; then
    echo "Create .generate-cache-files file with content [1]"
    printf "1" >"${AP_CACHE_FLAG}"
fi

# Logs
apshowmsginfo "Create directories [${AP_LOGS_DIR}/general] and log files\n"
mkdir -p "${AP_LOGS_DIR}/crontabs"
[ ! -f "${AP_LOGS_DIR}/crontabs/ap_crontab_test.log" ] && touch "${AP_LOGS_DIR}/crontabs/ap_crontab_test.log"

mkdir -p "${AP_LOGS_DIR}/general"
[ ! -f "${AP_LOGS_GENERAL_FILE}" ] && touch "${AP_LOGS_GENERAL_FILE}"
[ ! -f "${AP_LOGS_ERROR_FILE}" ] && touch "${AP_LOGS_ERROR_FILE}"
[ ! -f "${AP_LOGS_DEBUG_FILE}" ] && touch "${AP_LOGS_DEBUG_FILE}"
[ ! -f "${AP_LOGS_BASH_COMPLETION_FILE}" ] && touch "${AP_LOGS_BASH_COMPLETION_FILE}"

# Symlinks
apshowmsginfo "Create directories [${AP_SYMLINKS_DIR}]\n"
mkdir -p "${AP_SYMLINKS_DIR}"

## Symlink bash for nvim floaterm
if [ -f "${HOME}/scripto-data/symlinks/bash" ]; then
    apshowmsginfo "Link [${HOME}/scripto-data/symlinks/bash] to [\${SHELL}]\n"
    ln -sf "${SHELL}" "${HOME}/scripto-data/symlinks/bash"
fi

# Sofware
apshowmsginfo "Create directories [${AP_SOFT_DIR}/bin]\n"
mkdir -p "${AP_SOFT_DIR}/bin"

# Man pages
apshowmsginfo "Create directories [${AP_MAN_DIR}/man{1..8}]\n"
mkdir -p "${AP_MAN_DIR}/man"{1..8}

# Autocomplete
apshowmsginfo "Create directories [${AP_COMPLETIONS_DIR}]\n"
mkdir -p "${AP_COMPLETIONS_DIR}"

# Projects
apshowmsginfo "Create directories [${AP_PRJ_DIR}]\n"
mkdir -p "${AP_PRJ_DIR}"

# Tmp
apshowmsginfo "Create directories [${AP_TMP_DIR}]\n"
mkdir -p "${AP_TMP_DIR}"

# Downloads
apshowmsginfo "Create directories [${AP_DL_DIR}]\n"
mkdir -p "${AP_DL_DIR}"
