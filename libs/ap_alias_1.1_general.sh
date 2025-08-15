# List & find commands
alias lspaths='echo "${PATH}" | tr ":" "\n"'
alias lsaliases='alias | gsed "s@alias @@" | grep "^[@|1|2|3]" | sort'
alias lsaliasesfzf='alias | gsed "s@alias @@" | grep "^[@|1|2|3]" | sort | fzf'
alias lsusers="type getent &>/dev/null && getent passwd || cat /etc/passwd"
alias lsgroups="type getent &>/dev/null && getent group || cat /etc/groups"
alias lservices='sudo launchctl list'
alias lservicesgrep='sudo launchctl list | grep'
alias lsmonitors='hwinfo --monitor'

alias lsports="export | grep AP_PORT | cut -d ' ' -f 3 | gsed -e \"s@AP_PORT_@@\" -e \"s@=@ = @\" -e \"s@'@@g\" | sort"
alias lsdomains="export | grep AP_DOMAIN | cut -d ' ' -f 3 | gsed -e \"s@AP_DOMAIN_@@\" -e \"s@=@ = @\" -e \"s@'@@g\" | sort"
alias lsprocesses='ps -ef'
alias lsips="export | grep AP_IP | cut -d ' ' -f 3 | gsed -e \"s@AP_IP_@@\" -e \"s@=@ = @\" -e \"s@'@@g\" | sort"

alias findports="export | grep AP_PORT | cut -d ' ' -f 3 | gsed -e \"s@AP_PORT_@@\" -e \"s@=@ = @\" -e \"s@'@@g\" | sort | grep"
alias finddomains="export | grep AP_DOMAIN | cut -d ' ' -f 3 | gsed -e \"s@AP_DOMAIN_@@\" -e \"s@=@ = @\" -e \"s@'@@g\" | sort | grep"
alias findprocesses='ps -ef | grep'

# Copy commands
if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
    alias apcopy='pbcopy'
    alias apopen='open'
elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
    alias apcopy='xclip -selection clipboard'
    alias apopen='xdg-open'
fi

alias cpd='pwd | tr -d "\n" | apcopy'
alias cpdirname='basename "${PWD}" | tr -d "\n" | apcopy'

# Show commands
alias showcpuinfo="sudo cat /proc/cpuinfo"
alias showcronlogs='sudo cat /var/log/cron.log'

# MacOS specific commands
# Declare and assign separately to avoid masking return values.
# https://www.shellcheck.net/wiki/SC2155
AP_MACOS_VERSION="$(sw_vers -productVersion | grep -E -o "\d+.\d+")"
export AP_MACOS_VERSION
export AP_MACOS_SDK_CLI_TOOLS_DIR="/Library/Developer/CommandLineTools/SDKs/MacOSX${AP_MACOS_VERSION}.sdk"

# Ubuntu specific commands
alias lsinstalledapps='dpkg --get-selections | grep -v deinstall'
alias dpkglsinstalledapps='dpkg --get-selections | grep -v deinstall'

alias sssysctl="sudo systemctl status"
alias rrsysctl="sudo systemctl restart"

alias capturekeyevent='xev -event keyboard'

# Backup commands
alias bkfstab="cp -f /etc/fstab \${HOME}/scripto-main/backups/fstab/fstab_\$(gdate +'%Y%m%d_%H%M%S').bak"
alias bksshconfigs="[ -f \${HOME}/.ssh/config ] && cp -f \${HOME}/.ssh/config \${HOME}/scripto-main/backups/ssh/ssh_\$(gdate +'%Y%m%d_%H%M%S').config.bak"

# Vendors
alias httpserver="http-server"
alias liveserver="live-server"

alias dotenvlist='dotenv list'
alias dotenvset='dotenv set'

alias md2='markitdown'
alias webpushgeneratevapidkeys='web-push generate-vapid-keys'
alias openvpnresetadminpasswd='docker exec -t openvpn /bin/bash -c "sacli --user "openvpn" --new_pass "admin" SetLocalPassword"'
alias coveragereport="coverage report"
alias tscchecktypes='NODE_OPTIONS=--max-old-space-size=8192 tsc --noEmit --pretty'
alias tsnode='ts-node'

# Other commands
alias root='sudo su'
alias grep='grep --color'
alias du1="du -h --max-depth=1"
alias chownuser="sudo chown -R ${USER}.${USER}" # DO NOT use \$USER, because it will be equal to ROOT user
alias psgrep='ps -ef | grep'
alias gensecretkey='python -c "import secrets; print(secrets.token_urlsafe(32))"'
alias cpsecretkey='python -c "import secrets; print(secrets.token_urlsafe(32))"  | tr -d "\n" | apcopy'
alias tcate='true >'
alias rmdsstorefiles="gfind . -name '.DS_Store' -type f -delete"

# alias genrandstr="head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32 ; echo"
alias genrandstr1="openssl rand -base64 21 && echo"
alias cprandstr1="openssl rand -base64 21 | apcopy"

alias genappsecret='openssl rand -hex 32'
alias cpappsecret='openssl rand -hex 32 | tr -d "\n" | apcopy'

alias genrandmdfile="curl 'https://jaspervdj.be/lorem-markdownum/markdown.txt?underline-headers=on'"
alias rmnodemodules='rm -rf node_modules'

alias showmail="cat /var/mail/\$(echo \${USER})"
alias clearmail="> /var/mail/\$(echo \${USER})"

alias rmfilesandfolders='rm -rf ./* ./.*'
