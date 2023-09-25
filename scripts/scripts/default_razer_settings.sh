razer-cli write logo ac 0
razer-cli write brightness ac 100
razer-cli write power ac 4 3 2
razer-cli write standard_effect reactive 1 55 55 55
razer-cli write power ac 0
razer-cli write fan ac 5000
sudo cpupower --cpu all frequency-set -f 1.2GHz
sudo cpupower --cpu all frequency-set -f 400MHz
sudo cpupower --cpu all frequency-set -f 4.2GHz


# set min clock frequency
sudo cpupower --cpu all frequency-set -d 4.2GHz

sudo x86_energy_perf_policy --turbo-enable 1

sync; echo 3 > /proc/sys/vm/drop_caches

# sudo systemctl disable loadcpufreq.service (I checked systemctl, and saw this, deactivated it and
# it switched back to a reasonable number :))
# https://forums.gentoo.org/viewtopic-p-8695556.html?sid=33022912b973d0b924cdd97a4788b4e7

# Disable intel pstate:
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash button.lid_init_state=open intel_pstate=disable"

cpupower frequency-set --governor performance
cpupower frequency-set --governor userspace

