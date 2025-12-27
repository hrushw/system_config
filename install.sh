#!/bin/sh

PREFIX="/usr/local/bin"
cp sudoers.d/* /etc/sudoers.d/
cp limine_updater "$PREFIX/limine_updater"

cp acpi_handler.sh /etc/acpi/handler.sh
cp turnstiled.conf /etc/turnstile/turnstiled.conf
cp greetd_config.toml /etc/greetd/config.toml
cp xorg.conf.d/* /etc/X11/xorg.conf.d/

cp cron.weekly/* /etc/cron.weekly/
cp cron.daily/* /etc/cron.daily/
