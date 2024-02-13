#!/bin/bash

cd /scratch2/BMC/fv3lam/MUMIP/icbc_data/GFSreplay/FV3GFS/netcdf

for initd in 201608{10..31} 201609{01..21} ; do

    init_day=${initd}

    #mkdir ${init_day}12
    #cd ${init_day}12

    cyc_init=$(date -d "${init_day} + 12 hours" +%Y%m%d%H)
    ln -s /scratch2/BMC/fv3lam/MUMIP/icbc_data/GFSreplay/bfg_${cyc_init}_fhr00_control ${cyc_init}_gfs.t12z.sfcanl.nc
    ln -s /scratch2/BMC/fv3lam/MUMIP/icbc_data/GFSreplay/sfg_${cyc_init}_fhr00_control ${cyc_init}_gfs.t12z.atmanl.nc

    for fhr in {06,12,18,24,30,36} ; do

        fhrp12=$(printf "%02d\n" $(expr $fhr + 12))
        cyc=$(date -d "${init_day} + ${fhrp12} hours" +%Y%m%d%H)
        echo "$cyc"

        ln -s /scratch2/BMC/fv3lam/MUMIP/icbc_data/GFSreplay/sfg_${cyc}_fhr00_control ${cyc_init}_gfs.t12z.atmf0${fhr}.nc

    done

    #cd ..

done
