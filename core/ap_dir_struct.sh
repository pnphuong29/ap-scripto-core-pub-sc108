# Caching
export AP_CACHE_DIR="${HOME}/scripto-data/cache"

# Configs
export AP_CONFIGS_DIR="${HOME}/scripto-data/configs"
export AP_CACHE_FLAG="${AP_CONFIGS_DIR}/.generate-cache-files"

# Logs
export AP_LOGS_DIR="${HOME}/scripto-data/logs"

## General logs
export AP_LOGS_GENERAL_FILE="${AP_LOGS_DIR}/general/ap_general.log"

## Error logs
export AP_LOGS_ERROR_FILE="${AP_LOGS_DIR}/general/ap_error.log"

## Debug logs
export AP_LOGS_DEBUG_FILE="${AP_LOGS_DIR}/general/ap_debug.log"

## Bash completion logs
export AP_LOGS_BASH_COMPLETION_FILE="${AP_LOGS_DIR}/general/ap_bash_completion.log"

# Symlinks
export AP_SYMLINKS_DIR="${HOME}/scripto-data/symlinks"

# Sofware
export AP_SOFT_DIR="${HOME}/scripto-data/software"
export PATH="${AP_SOFT_DIR}/bin:${PATH}"

# Man pages
export AP_MAN_DIR="${HOME}/scripto-data/man"

# Autocomplete
export AP_COMPLETIONS_DIR="${HOME}/scripto-data/completions"

# Projects
export AP_PRJ_DIR="${HOME}/scripto-data/projects"

# Tmp
export AP_TMP_DIR="${HOME}/scripto-data/tmp"

# Download
export AP_DL_DIR="${HOME}/Downloads"

# Data
# In linux only, /data1 should be a symlink to "/mnt/lvm/data1"
# In macOS, it should be "${HOME}/scripto-data/data1"
export AP_DATA_DIR="/data1"
