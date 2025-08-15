alias showdt='gdate +"%Y%m%d_%H%M%S"'
alias settzvn='sudo timedatectl --no-pager set-timezone "Asia/Ho_Chi_Minh"'

alias genrandstr="gdate +%s | md5 | head -c 21 && echo"
alias cprandstr="gdate +%s | md5 | head -c 21 | apcopy"
