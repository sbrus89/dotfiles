# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PS1="\u@\h:\w\\$ "

HOST=`hostname -s`
DOMAIN=`hostname -d`

if [[ $HOST = gr* ]] ; then
#############################################################
# Grizzly
#############################################################

  alias  ml='module purge; module use /usr/projects/climate/SHARED_CLIMATE/modulefiles/all/; conda activate compass_py3.7; module load gcc/5.3.0 openmpi/1.10.5 netcdf/4.4.1 parallel-netcdf/1.5.0 pio/1.7.2; echo "loading MPAS-O modules for grizzly"'
  alias mli='module purge; module load git; module use /usr/projects/climate/SHARED_CLIMATE/modulefiles/all/; module load intel/17.0.1 mvapich2/2.2 netcdf/4.4.1 parallel-netcdf/1.5.0 pio/1.7.2; echo "loading modules anaconda, intel, openmpi, netcdf, pnetcdf, pio for grizzly"'
  alias inode='salloc --qos=interactive --time 1:00:00'

elif [[ $HOST = ba* ]] ; then
#############################################################
# Badger
#############################################################

  alias ml='module purge; module use /usr/projects/climate/SHARED_CLIMATE/modulefiles/spack-lmod/linux-rhel7-x86_64; module load gcc/6.4.0; module load openmpi/2.1.2; module load cmake/3.12.1; module load mkl; module load openmpi/2.1.2-bheb4xe/gcc/6.4.0/netcdf/4.4.1.1-zei2j6r; module load openmpi/2.1.2-bheb4xe/gcc/6.4.0/netcdf-fortran/4.4.4-v6vwmxs; module load openmpi/2.1.2-bheb4xe/gcc/6.4.0/parallel-netcdf/1.8.0-2qwcdbn; module load openmpi/2.1.2-bheb4xe/gcc/6.4.0/pio/1.10.0-ljj73au; export NETCDF=/usr/projects/climate/SHARED_CLIMATE/software/badger/spack-install/linux-rhel7-x86_64/gcc-6.4.0/netcdf-fortran-4.4.4-v6vwmxsv33t7pmulojlijwdbikrvmwkc; export PNETCDF=/usr/projects/climate/SHARED_CLIMATE/software/badger/spack-install/linux-rhel7-x86_64/gcc-6.4.0/parallel-netcdf-1.8.0-2qwcdbnjcq5pnkoqpx2s7um3s7ffo3xd; export PIO=/usr/projects/climate/SHARED_CLIMATE/software/badger/spack-install/linux-rhel7-x86_64/gcc-6.4.0/pio-1.10.0-ljj73au6ctgkwmh3gbd4mleljsumijys/; echo "loading MPAS-O moduels for badger"'
  alias inode='salloc --qos=interactive --time 1:00:00'

elif [[ $HOST = b* ]] && [[ $DOMAIN = 'lcrc.anl.gov' ]]; then 
#############################################################
# Blues
#############################################################

  alias ml='module purge ; module load intel/17.0.0-pwabdn2 ; module load netcdf/4.4.1-tckdgwl ; module load netcdf-fortran/4.4.4-urmb6ss ; module load mvapich2/2.2-verbs-qwuab3b ; module load netcdf-fortran/4.4.4-urmb6ss'
  alias inode='srun -A condo -p acme-small -N 1 -t 1:00:00 --pty bash'
  alias e3sm_unified='source /lcrc/soft/climate/e3sm-unified/load_latest_e3sm_unified.sh'
  export GIT_SSH="/home/sbrus/turq-ssh-hop.sh"

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
# LANL IC (Grizzly or Badger)
#############################################################
if [[ $HOST = gr* ]] || [[ $HOST = ba* ]] ; then

  source /usr/projects/consult/public/SLURM/aliases/slurm_bash_alias

  alias ls='ls --color=auto'
  alias mprio='(sprio -w -o "%.15i %.10Y %.10a %.10f %.10j %.10q %.6N %.8T %u" ; echo ; sprio -o "%.15i %.10Y %.10a %.10f %.10j %.10q %.6    N %.8T %u" | grep -v JOBID | sort -k 2bnr,2 ; echo "\n\t\tFairshare: Overserved < .5 < Underserved")'
  alias e3sm_unified='source /usr/projects/climate/SHARED_CLIMATE/anaconda_envs/load_latest_e3sm_unified.sh'

  # see https://hpc.lanl.gov/proxy_setup
  export http_proxy="http://proxyout.lanl.gov:8080"
  export https_proxy="http://proxyout.lanl.gov:8080"
  export ftp_proxy="http://proxyout.lanl.gov:8080"
  export HTTP_PROXY="http://proxyout.lanl.gov:8080"
  export HTTPS_PROXY="http://proxyout.lanl.gov:8080"
  export FTP_PROXY="http://proxyout.lanl.gov:8080"

  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/lustre/scratch4/turquoise/.mdt5/sbrus/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/lustre/scratch4/turquoise/.mdt5/sbrus/miniconda3/etc/profile.d/conda.sh" ]; then
          . "/lustre/scratch4/turquoise/.mdt5/sbrus/miniconda3/etc/profile.d/conda.sh"
      else
          export PATH="/lustre/scratch4/turquoise/.mdt5/sbrus/miniconda3/bin:$PATH"
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
  export GIT_SSH="/home/sbrus/turq-ssh-hop.sh"

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






