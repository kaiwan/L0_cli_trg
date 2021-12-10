#!/bin/bash
# sample_bkp.sh
# --------------------------------------------------------
# Quick Description:
# --------------------------------------------------------
# 
# 
# 
# --------------------------------------------------------
# <<<<<<<<<<<<<<<<<<<< TIP >>>>>>>>>>>>>>>>>>>>
#  Use the shellcheck utility to check script syntax, etc
# --------------------------------------------------------
# Last Updated :
# Created      :
# --------------------------------------------------------
# Author:
# --------------------------------------------------------
# License:
# --------------------------------------------------------
name=$(basename $0)
PFX=$(dirname $(which $0))
#source ${PFX}/common.sh || {
# echo "${name}: fatal: could not source ${PFX}/common.sh , aborting..."
# exit 1
#}

########### Globals follow #########################
BKPDIR=.  # replace as appropriate
DESTFILE=${BKPDIR}/backup1.tar.xz
RESTORE_DIR=.  # replace as appropriate

########### Functions follow #######################

#---------- r e s t o r e _ b k p --------------------------------------
# Restores the compressed tar file passed as first parameter to location
# specified in 2nd param.
# Parameters:
#  $1 : path to compressed tarball to restore
#  $2 : path to location to restore to
restore_bkp()
{
[ $# -ne 2 ] && {
  echo "${name}:restore_bkp(): param(s) mising"
  return
}
[ ! -d $2 ] && {
  echo "destination dir \"${2}\" not present?"
  return
}

echo "[+] Restoring \"$1\" now to \"$2\", pl wait ..." 
tar -xf $1 --directory $2
[ $? -ne 0 ] && {
  echo "${name}: tar cJ failed..."
  exit 1
}
echo "[OK]"

}

#---------- b k p _ a n d _ z i p --------------------------------------
# Backs up (tars and compresses) the dir passed as a parameter to
# ${DESTFILE}
# Parameters:
#  $1 : path to dir to (recursively) backup
bkp_and_zip()
{
[ $# -ne 1 ] && {
  echo "${name}:bkp_and_zip(): param mising"
  return
}
ls ${1} >/dev/null || {
  echo "src dir \"${1}\" not readable? (run as root?) aborting..."
  exit 1
}
echo "[+] Backing up \"$1\" to \"${DESTFILE}\" now, pl wait ..." 

# tar and compress; option J => xz compression
#  z => gzip, 
# man tar   ;for all options
tar cJ --preserve-permissions -f ${DESTFILE} ${1}
[ $? -ne 0 ] && {
  echo "${name}: tar cJ failed..."
  exit 1
}
# Note for tar: useful!
# -a, --auto-compress
#      Use archive suffix to determine the compression program.
 
echo "[OK]"
}


##### 'main' : execution starts here #####

# To make this script non-interactive, f.e. when running it via cron,
# simple hardcode the path to the source dir to backup in a var (or better,
# put it in an environment var)

# SRCDIR=/opt/...whatever...

[ $# -ne 1 ] && {
  echo "Usage: ${name} root-of-dir-to-backup"
  exit 1
}
SRCDIR=$1
[ ! -d "${SRCDIR}" ] && {
  echo "${name}: dir \"${SRCDIR}\" invalid, aborting..."
  exit 1
}

bkp_and_zip "${SRCDIR}"

# interactive only for demo purposes...
echo -n "Restore the backup (\"$1\" to \"${RESTORE_DIR}\") [y/N]? "
read re
[ "${re}" = "y" -o "${re}" = "Y" ] && restore_bkp ${DESTFILE} ${RESTORE_DIR}

exit 0
