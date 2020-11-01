#!/usr/bin/env bash
### R
## install R from source
## inspiredfrom here:
## https://docs.rstudio.com/resources/install-r-source/
pkgver=3.6.3
if [[ ! -f /usr/local/bin/Rscript ]]; then
    echo "============== setting up R"
    wget -N "https://cran.r-project.org/src/base/R-${pkgver%%.*}/R-${pkgver}.tar.gz" -P ~/Documents
    cd ~/Documents
    tar -xzf R-${pkgver}.tar.gz
    cd ./R-${pkgver}
    ./configure \
        --prefix=/opt/R/${pkgver} \
        --enable-memory-profiling \
        --enable-R-shlib \
        --with-blas \
        --with-lapack
    notify-send "R installer needs supervision-1"
    read -p "Press enter to continue"

    make
    notify-send "R installer needs supervision-2"
    read -p "Press enter to continue"

    sudo make install
    notify-send "R installer needs supervision-3"
    read -p "Press enter to continue"

    sudo ln -s /opt/R/${pkgver}/bin/R /usr/local/bin/R
    sudo ln -s /opt/R/${pkgver}/bin/Rscript /usr/local/bin/Rscript
fi

### radian
echo "is pip installed?"
notify-send "R installer needs supervision-4"
read -p "Press enter to continue"
pip-3 install --user radian

## Rstudio
## see this site for the link:
## https://rstudio.com/products/rstudio/download/#download
