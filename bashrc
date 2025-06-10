# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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

elif [[ $HOST = login* ]] && [[ $DOMAIN = 'chn.perlmutter.nersc.gov' ]] ; then 
#############################################################
# Perlmutter 
#############################################################

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






