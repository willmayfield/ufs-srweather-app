#!/bin/bash --login

#SBATCH -A fv3lam
#SBATCH -p service
#SBATCH -J ret_gfsreplay
#SBATCH -n 1
#SBATCH -t 23:00:00
#SBATCH -e ./ret_gfsreplay

cd /scratch2/BMC/fv3lam/MUMIP/icbc_data/GFSreplay

for doy in 201608{10..31} ; do
  for cyc in 12 ; do
    wget https://noaa-ufs-gefsv13replay-pds.s3.amazonaws.com/2016/08/${doy}${cyc}/bfg_${doy}${cyc}_fhr00_control
  done
done

for doy in 201608{10..31} ; do
  for cyc in {00,06,12,18} ; do
    wget https://noaa-ufs-gefsv13replay-pds.s3.amazonaws.com/2016/08/${doy}${cyc}/sfg_${doy}${cyc}_fhr00_control
  done
done

for doy in 201609{01..21} ; do
  for cyc in 12 ; do
    wget https://noaa-ufs-gefsv13replay-pds.s3.amazonaws.com/2016/09/${doy}${cyc}/bfg_${doy}${cyc}_fhr00_control
  done
done

for doy in 201609{01..21} ; do
  for cyc in {00,06,12,18} ; do
    wget https://noaa-ufs-gefsv13replay-pds.s3.amazonaws.com/2016/09/${doy}${cyc}/sfg_${doy}${cyc}_fhr00_control
  done
done
