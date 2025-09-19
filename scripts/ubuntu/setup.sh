#!/bin/bash
set -euo pipefail
set -x

packages=(
  binutils-dev
  build-essential
  bzip2
  ca-certificates
  curl
  dh-autoreconf
  git
  gnupg2
  hwloc-nox
  lbzip2
  lcov
  libbinutils
  libbz2-dev
  libhwloc-dev
  liblzma-dev
  libssl-dev
  libzip-dev
  meson
  ninja-build
  pkg-config
  python3
  python3-dev
  python3-pip
  software-properties-common
  sudo
  unzip
  vim-nox
  wget
  xsltproc
)

apt-get -qq update
apt-get -qq install -fy tzdata
apt-get -qq install -y --no-install-recommends "${packages[@]}" "$@"
rm -rf /var/lib/apt/lists/*
apt-get clean

# Setup radiuss user
useradd -ms /bin/bash radiuss
printf "radiuss:radiuss" | chpasswd
adduser radiuss sudo
printf "radiuss ALL= NOPASSWD: ALL\\n" >> /etc/sudoers
