#!/bin/bash

# SPDX-FileCopyrightText: 2025 Alexandru Mihai Buzduc <lalibuzduc@gmail.com>
# SPDX-FileCopyrightText: 2025 Universal Blue
#
# SPDX-License-Identifier: Apache-2.0

set -ouex pipefail

### Install packages

# COSMIC DE
dnf -y install @cosmic-desktop-environment

# Universal Blue packages
dnf -y copr enable ublue-os/packages
#dnf5 -y copr enable ublue/os-akmods

dnf -y install \
    ublue-os-media-automount-udev \
	ublue-{motd,fastfetch,bling,rebase-helper,setup-services,polkit-rules,brew,recipes} \
	uupd \
    kcm_ublue

#dnf5 -y copr disable ublue/os-akmods
dnf -y copr disable ublue-os/packages

#### Enable System Unit Files

# Needed for cosmic-greeter
systemctl enable cosmic-greeter
