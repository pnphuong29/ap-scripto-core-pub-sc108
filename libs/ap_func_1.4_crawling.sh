alias crawlweb="ap_func_crawl_web_url"
ap_func_crawl_web_url() {
    local ap_url="${1}"

    if [ -z "${ap_url}" ]; then
        apshowmsginfo "Usage: ${FUNCNAME[0]} <url>\n"
        return 1
    fi

    curl -s "${ap_url}" |
        grep -Eo 'href="[^"]+"' |
        gsed -E 's/href="([^"]+)"/\1/' |
        sort -u
}
