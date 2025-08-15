# Google Chrome bookmark & history file locations
if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    export AP_CHROME_BOOKMARK_FILE_PATH="${HOME}/Library/Application Support/Google/Chrome/Default/Bookmarks"
    export AP_CHROME_HISTORY_FILE_PATH="${HOME}/Library/Application Support/Google/Chrome/Default/History"
elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    export AP_CHROME_BOOKMARK_FILE_PATH="${HOME}/.config/google-chrome/Default/Bookmarks"
    export AP_CHROME_HISTORY_FILE_PATH="${HOME}/.config/google-chrome/Default/History"
fi
