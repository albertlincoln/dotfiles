#!/bin/bash

if [ -e '/sys/module/snd_hda_intel/parameters/power_save' ]; then
  echo '1' > '/sys/module/snd_hda_intel/parameters/power_save'
  echo "echo '1' > '/sys/module/snd_hda_intel/parameters/power_save'"
fi
if [ -e '/proc/sys/vm/dirty_writeback_centisecs' ]; then
  echo '1500' > '/proc/sys/vm/dirty_writeback_centisecs'
  echo "echo '1500' > '/proc/sys/vm/dirty_writeback_centisecs'"
fi
if [ -e '/sys/class/scsi_host/host0/link_power_management_policy' ]; then
  echo 'min_power' > '/sys/class/scsi_host/host0/link_power_management_policy'
  echo "echo 'min_power' > '/sys/class/scsi_host/host0/link_power_management_policy'"
fi
if [ -e '/sys/class/scsi_host/host5/link_power_management_policy' ]; then
  echo 'min_power' > '/sys/class/scsi_host/host5/link_power_management_policy'
  echo "echo 'min_power' > '/sys/class/scsi_host/host5/link_power_management_policy'"
fi
if [ -e '/sys/class/scsi_host/host3/link_power_management_policy' ]; then
  echo 'min_power' > '/sys/class/scsi_host/host3/link_power_management_policy'
  echo "echo 'min_power' > '/sys/class/scsi_host/host3/link_power_management_policy'"
fi
if [ -e '/sys/class/scsi_host/host1/link_power_management_policy' ]; then
  echo 'min_power' > '/sys/class/scsi_host/host1/link_power_management_policy'
  echo "echo 'min_power' > '/sys/class/scsi_host/host1/link_power_management_policy'"
fi
if [ -e '/sys/class/scsi_host/host4/link_power_management_policy' ]; then
  echo 'min_power' > '/sys/class/scsi_host/host4/link_power_management_policy'
  echo "echo 'min_power' > '/sys/class/scsi_host/host4/link_power_management_policy'"
fi
if [ -e '/sys/class/scsi_host/host2/link_power_management_policy' ]; then
  echo 'min_power' > '/sys/class/scsi_host/host2/link_power_management_policy'
  echo "echo 'min_power' > '/sys/class/scsi_host/host2/link_power_management_policy'"
fi
if [ -e '/proc/sys/kernel/nmi_watchdog' ]; then
  echo '0' > '/proc/sys/kernel/nmi_watchdog'
  echo "echo '0' > '/proc/sys/kernel/nmi_watchdog'"
fi
if [ -e '/sys/bus/i2c/devices/i2c-0/device/power/control' ]; then
  echo 'auto' > '/sys/bus/i2c/devices/i2c-0/device/power/control'
  echo "echo 'auto' > '/sys/bus/i2c/devices/i2c-0/device/power/control'"
fi
if [ -e '/sys/bus/i2c/devices/i2c-1/device/power/control' ]; then
  echo 'auto' > '/sys/bus/i2c/devices/i2c-1/device/power/control'
  echo "echo 'auto' > '/sys/bus/i2c/devices/i2c-1/device/power/control'"
fi
if [ -e '/sys/bus/i2c/devices/i2c-3/device/power/control' ]; then
  echo 'auto' > '/sys/bus/i2c/devices/i2c-3/device/power/control'
  echo "echo 'auto' > '/sys/bus/i2c/devices/i2c-3/device/power/control'"
fi
if [ -e '/sys/bus/i2c/devices/i2c-4/device/power/control' ]; then
  echo 'auto' > '/sys/bus/i2c/devices/i2c-4/device/power/control'
  echo "echo 'auto' > '/sys/bus/i2c/devices/i2c-4/device/power/control'"
fi
if [ -e '/sys/bus/i2c/devices/i2c-2/device/power/control' ]; then
  echo 'auto' > '/sys/bus/i2c/devices/i2c-2/device/power/control'
  echo "echo 'auto' > '/sys/bus/i2c/devices/i2c-2/device/power/control'"
fi
if [ -e '/sys/bus/i2c/devices/i2c-5/device/power/control' ]; then
  echo 'auto' > '/sys/bus/i2c/devices/i2c-5/device/power/control'
  echo "echo 'auto' > '/sys/bus/i2c/devices/i2c-5/device/power/control'"
fi
if [ -e '/sys/bus/pci/devices/0000:00:00.0/power/control' ]; then
  echo 'auto' > '/sys/bus/pci/devices/0000:00:00.0/power/control'
  echo "echo 'auto' > '/sys/bus/pci/devices/0000:00:00.0/power/control'"
fi
if [ -e '/sys/bus/pci/devices/0000:00:1f.0/power/control' ]; then
  echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.0/power/control'
  echo "echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.0/power/control'"
fi
if [ -e '/sys/bus/pci/devices/0000:03:00.0/power/control' ]; then
  echo 'auto' > '/sys/bus/pci/devices/0000:03:00.0/power/control'
  echo "echo 'auto' > '/sys/bus/pci/devices/0000:03:00.0/power/control'"
fi
if [ -e '/sys/bus/pci/devices/0000:00:1f.2/power/control' ]; then
  echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.2/power/control'
  echo "echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.2/power/control'"
fi
if [ -e '/sys/bus/pci/devices/0000:00:14.0/power/control' ]; then
  echo 'auto' > '/sys/bus/pci/devices/0000:00:14.0/power/control'
  echo "echo 'auto' > '/sys/bus/pci/devices/0000:00:14.0/power/control'"
fi
if [ -e '/sys/bus/pci/devices/0000:00:02.0/power/control' ]; then
  echo 'auto' > '/sys/bus/pci/devices/0000:00:02.0/power/control'
  echo "echo 'auto' > '/sys/bus/pci/devices/0000:00:02.0/power/control'"
fi
if [ -e '/sys/bus/pci/devices/0000:00:1d.0/power/control' ]; then
  echo 'auto' > '/sys/bus/pci/devices/0000:00:1d.0/power/control'
  echo "echo 'auto' > '/sys/bus/pci/devices/0000:00:1d.0/power/control'"
fi
if [ -e '/sys/bus/pci/devices/0000:00:1f.3/power/control' ]; then
  echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.3/power/control'
  echo "echo 'auto' > '/sys/bus/pci/devices/0000:00:1f.3/power/control'"
fi
if [ -e '/sys/bus/pci/devices/0000:02:00.0/power/control' ]; then
  echo 'auto' > '/sys/bus/pci/devices/0000:02:00.0/power/control'
  echo "echo 'auto' > '/sys/bus/pci/devices/0000:02:00.0/power/control'"
fi
if [ -e '/sys/bus/pci/devices/0000:00:16.0/power/control' ]; then
  echo 'auto' > '/sys/bus/pci/devices/0000:00:16.0/power/control'
  echo "echo 'auto' > '/sys/bus/pci/devices/0000:00:16.0/power/control'"
fi
if [ -e '/sys/bus/pci/devices/0000:00:1b.0/power/control' ]; then
  echo 'auto' > '/sys/bus/pci/devices/0000:00:1b.0/power/control'
  echo "echo 'auto' > '/sys/bus/pci/devices/0000:00:1b.0/power/control'"
fi
if [ -e '/sys/bus/pci/devices/0000:00:1a.0/power/control' ]; then
  echo 'auto' > '/sys/bus/pci/devices/0000:00:1a.0/power/control'
  echo "echo 'auto' > '/sys/bus/pci/devices/0000:00:1a.0/power/control'"
fi
