# .bashrc

# Source global definitions
[[ -f /etc/bashrc ]] && . /etc/bashrc

unset SSH_ASKPASS # no password popups

if [ -n "$SLURM_JOB_ID" ] && [ -d "/lscratch/$SLURM_JOB_ID" ]; then 
    export TMPDIR=/lscratch/$SLURM_JOB_ID
fi

export PATH=$HOME/bin:$PATH
# [[ $PYTHONPATH == *"/hpy"* ]] || export PYTHONPATH=$PYTHONPATH:/home/mandelkowhc/code/hpy

# export PS1="[\W]$ "
# export PS1="\h:\W> "
export PS1="\e[1m\h:\W> \e[m"

export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

### LOAD MY DEFAULT MODULES
export AFNI_DONT_LOGFILE=YES
# module load jupyter fsl afni mc tmux # atom pycharm
module load tmux jupyter git # mc # fsl afni # atom pycharm

# User specific aliases and functions
SINTOPT='-TT -t 36:00:00'
alias sint='sinteractive $SINTOPT -c 16 --mem=64g'
# alias sintcm='f(){ sinteractive -c $1 --mem=$2g }; f'
alias sintcm='f(){ sinteractive $SINTOPT -c $1 --mem=$2g --gres=lscratch:$2; }; f' # simpler and works!?!
alias hfreeng='freen | grep -e ^Part -e "---" -e gpu | cut -c -80'
alias hfreenc='freen | grep -e ^Part -e "---" -e cpu | cut -c -80'
alias sintg='f(){ sinteractive $SINTOPT -c $((14*$1)) --mem=64g --gres=gpu:$1; }; f'
alias sintg='f(){ sinteractive $SINTOPT -c $((14*${1##*:})) --mem=64g --gres=gpu:$1; }; f'
# alias sintgp='f(){ sinteractive $SINTOPT -c $((14*$1)) --mem=64g --gres=gpu:p100:$1,lscratch:10; }; f'
# alias sintgpu='sinteractive -T -t $SINT_TMAX -c 16 --mem=16g --gres=gpu:k20x:1,lscratch:10'
# alias sintgpu4='sinteractive -TT -c 32 --mem=32g --gres=gpu:p100:4,lscratch:10 --time=$SINT_TMAX'
alias sque='squeue -u $USER'

alias portssh='echo ssh -L $PORT1:localhost:$PORT1 -L $PORT2:localhost:$PORT2 $USER@biowulf.nih.gov'
alias jup1='jupyter lab --no-browser --port $PORT1'
# alias tbor='tensorboard --logdir TB_logs --port $PORT2'
alias tbor='tensorboard --logdir $PWD --port $PORT2'
alias jup2py='jupyter nbconvert --to python --TemplateExporter.exclude_output=True --TemplateExporter.exclude_raw=True --TemplateExporter.exclude_markdown=True --no-prompt' # h_DsRnn_Gsig_sba.ipynb
alias hpy36='module load python/3.6'
alias conda_on='source /data/$USER/anaconda/etc/profile.d/conda.sh' # activate conda

# alias ll='ls -trhog --color=auto'
# Could use export TERM=xterm-mono
alias ll='ls -trhog'
alias lsd='ls -d1'
alias em='emacs -nw'
# alias hdu='du -hs * | sort -h'
alias hdu='f(){ du -hs $@ | sort -h ; }; f'
alias sc='screen'
alias scl='screen -ls'
alias finds='_(){ find $@ -printf "%T+\b\b\b\b\b\b\b\b\b\b\b %p\n" | sort;}; _'
alias hmtimes='_(){ find . -not -path '*/.*/*' -printf "%T+\b\b\b\b\b\b\b\b %p\n" | sort;}; _'
alias hfcountin='f(){ for F in ${@:2}; do echo $F; find $F -name $1 | wc -l; done; }; f'
