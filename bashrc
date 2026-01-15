# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

export PS1="\u@\h:\w\\$ "
alias ls="ls --color=auto"

HOST=`hostname -s`
DOMAIN=`hostname -d`

alias queue='(sprio -w -o "%.15i %.10Y %.10a %.10f %.10j %.10q %.6N %.8T %u" ; echo ; sprio -o "%.15i %.10Y %.10a %.10f %.10j %.10q %.6    N %.8T %u" | grep -v JOBID | sort -k 2bnr,2 ; echo "\n\t\tFairshare: Overserved < .5 < Underserved")'

# enable ctrl+s to not stop terminal so it can do ctrl+r forward / ctrl+s back searches
stty -ixon

if [[ $HOST = chr* ]] && [[ $DOMAIN = 'lcrc.anl.gov' ]]; then 
#############################################################
# Chrysalis 
#############################################################

  alias ml-intel='module purge ; module load intel/20.0.4-kodw73g ; module load intel-mkl/2020.4.304-g2qaxzf ; module load openmpi/4.1.1-qiqkjbu ; module load hdf5/1.8.16-35xugty ; module load netcdf-c/4.4.1-2vngykq ; module load netcdf-cxx/4.2-gzago6i ; module load netcdf-fortran/4.4.4-2kddbib ; module load parallel-netcdf/1.11.0-go65een'
  alias e3sm-unified='source /lcrc/soft/climate/e3sm-unified/load_latest_e3sm_unified_chrysalis.sh'
  alias inode='srun -p debug -N 1 -t 1:00:00 --pty bash'


elif [[ $HOST = b* ]]  && [[ $DOMAIN = 'lcrc.anl.gov' ]]; then 
#############################################################
# Blues
#############################################################

  alias ml-intel='module purge ; module load intel/17.0.0-pwabdn2 ; module load netcdf/4.4.1-tckdgwl ; module load netcdf-fortran/4.4.4-urmb6ss ; module load mvapich2/2.2-verbs-qwuab3b ; module load netcdf-fortran/4.4.4-urmb6ss'
  alias e3sm-unified='source /lcrc/soft/climate/e3sm-unified/load_latest_e3sm_unified_anvil.sh'
  alias inode='srun -A condo -p acme-small -N 1 -t 1:00:00 --pty bash'
  alias queue='squeue -p acme-small,acme-medium,acme-large --format="%.6i %.8u %.8j %.7T %.6Q %4q %.19V %.19S %.10M %.10l %.4D %R"'
  alias free-nodes='sinfo -p acme-small,acme-medium,acme-large'

elif ([[ $HOST = nid* ]] || [[ $HOST = login* ]]) && [[ $DOMAIN = 'chn.perlmutter.nersc.gov' ]] ; then 
#############################################################
# Perlmutter 
#############################################################

  export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
  alias e3sm-unified='source /global/common/software/e3sm/anaconda_envs/load_latest_e3sm_unified_pm-cpu.sh'
  alias inode='salloc --nodes 1 --qos interactive --time 02:00:00 --constraint cpu'

elif [[ $HOST = compy* ]]; then 
#############################################################
# Compy 
#############################################################
  module load git

  alias ml-intel='module purge ; module load intel/19.0.5 ; module load intelmpi/2019u4 ; module load netcdf/4.6.3 ; module load pnetcdf/1.9.0 ; module load mkl/2019u5'
  alias inode='srun --pty --nodes=1 --time=02:00:00 /bin/bash'
  alias e3sm-unified='source /share/apps/E3SM/conda_envs/load_latest_e3sm_unified_compy.sh'

elif [[ $HOST = login*.summit ]]; then 
#############################################################
# Summit 
#############################################################

  alias inode='bsub -W 1:00 -nnodes 1 -P CLI115 -Is /bin/bash'

elif [[ $HOST = login* ]] && [[ $DOMAIN = 'frontier.olcf.ornl.gov' ]]; then 
#############################################################
# Frontier
#############################################################

  alias e3sm-unified='source /ccs/proj/cli115/software/e3sm-unified/load_latest_e3sm_unified_frontier.sh'

fi



if ([[ $HOST = b* ]] || [[ $HOST = chr* ]]) && [[ $DOMAIN = 'lcrc.anl.gov' ]]; then 
#############################################################
# LCRC (Blues or Chrysalis)
#############################################################

  alias dq='/usr/lpp/mmfs/bin/mmlsquota -u sbrus --block-size T fs2'

  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/lcrc/group/acme/sbrus/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/lcrc/group/acme/sbrus/miniconda3/etc/profile.d/conda.sh" ]; then
          . "/lcrc/group/acme/sbrus/miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="/lcrc/group/acme/sbrus/miniconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<

fi

#############################################################
# ANL Laptop 
#############################################################
if [[ $HOST = csi0360872 ]] ; then

  alias ls='ls -G'
  alias anvil='ssh -J logins.lcrc.anl.gov sbrus@blues.lcrc.anl.gov'
  alias gce='ssh -J sbrus@logins.cels.anl.gov sbrus@homes.cels.anl.gov'

  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/Users/sbrus/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/Users/sbrus/opt/miniconda3/etc/profile.d/conda.sh" ]; then
          . "/Users/sbrus/opt/miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="/Users/sbrus/opt/miniconda3/bin:$PATH"
      fi  
  fi
  unset __conda_setup
  # <<< conda initialize <<<
fi


#############################################################
# ANL Laptop 
#############################################################
if [[ $HOST = mcswl* || $HOST = Stevens-MacBook-Pro ]] ; then

  alias ls='ls -G'
  alias anvil='ssh -J logins.lcrc.anl.gov sbrus@blues.lcrc.anl.gov'
  alias chrysalis='ssh -J logins.lcrc.anl.gov sbrus@chrysalis.lcrc.anl.gov'
  alias gce='ssh -J sbrus@logins.cels.anl.gov sbrus@homes.cels.anl.gov'

fi




