if [ -f /etc/bashrc ]; then
    
	. /etc/bashrc

fi

export PATH=~/scripts:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.vimpkg/bin:~/.vimpkg/bin

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# -----------------------------------------------------------------------------------------------------------------------------
# KUBERNETES
# -----------------------------------------------------------------------------------------------------------------------------

[ /usr/sbin/kubectl ] && source <(kubectl completion bash)

# -----------------------------------------------------------------------------------------------------------------------------
# GCLOUD
# -----------------------------------------------------------------------------------------------------------------------------

[ -f /opt/google-cloud-sdk/completion.bash.inc ] && source /opt/google-cloud-sdk/completion.bash.inc
