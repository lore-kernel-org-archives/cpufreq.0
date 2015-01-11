From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 91141] New: acpi-cpufreq cannot be loaded.
Date: Sun, 11 Jan 2015 04:00:59 +0000
Message-ID: <bug-91141-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=91141

            Bug ID: 91141
           Summary: acpi-cpufreq cannot be loaded.
           Product: Power Management
           Version: 2.5
    Kernel Version: 3.14
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: cpufreq
          Assignee: cpufreq@vger.kernel.org
          Reporter: spam@brettcave.net
                CC: celeonar@gmail.com, katoh@mikage.ne.jp,
                    l.majewski@samsung.com, smf.linux@ntlworld.com,
                    tianyu.lan@intel.com, viresh.kumar@linaro.org
        Regression: Yes

+++ This bug was initially created as a clone of Bug #73781 +++

I'm having the same issue as bug 73781 with Pentium 4 processors instead of the
Pentium M processor mentioned in the ticket I cloned. The following lists the
steps I have tried to get the P4 cpufreq properly working. I'm being a little
more descriptive than usual so the web search engines can point people with the
same problem here as the cloned bug did with me. There's hardly anything useful
out there besides the cloned bug ticket.

I'm in the process of upgrading some old hardware to Ubuntu 14.04.1 LTS
(trusty) from various old Debian distributions running a 2.6 kernel (more
specific details to follow).

The 2 kernel.org kernels I have used are 3.14.27 and the recent 3.14.28.

Note that I have done successful 64bit upgrades using Ubuntu 14.04.1 and
3.14.28 to:
* quad (dual-dual config) 2.2GHz AMD K8 Opteron 1u server, scaling_driver:
powernow-k8 / ondemand
* dual core 2.2GHz AMD K10e laptop, scaling_driver: acpi-cpufreq / ondemand
CPU power management seems to be working correctly in both without the need for
any separate configuration. I use these 2 as an example to contrast my 32bit P4
problems.

I prefer the "vanilla" kernel.org kernels compared to the distro kernels. My
kernel.org kernels mentioned here are straight and unpatched. If I mention an
Ubuntu kernel, I'll have "ubuntu" beside it for clarity. I do not run the
ubuntu distro kernels except for testing and comparisons. I know the kernel.org
team doesn't support the ubuntu kernels, but these are mentioned for historical
time line comparisons.

When I first compile kernels on a new install, I'll use auto-apt to find the
missing packages that aren't commonly mentioned in the how-to's. This leads me
to believe my compiler environment isn't missing anything critical. Normally
auto-apt will find a couple dozen perl module packages and nothing major. Note
that I usually do not install the 1g of laytex packages for documentation.

Back before my health took a major dump and I was doing small business coloc
related stuff, I would remaster the Ubuntu Rescue Remix utility Live CD (a
stripped down variation of the main Ubuntu Live CD). This was mainly for some
extended tests and upgraded packages. Note that these remasters are custom and
not the versions available from the web site. The kernels are ubuntu. The 2
versions I'll reference are:
Ubuntu Rescue Remix 11.10 Custom using ubuntu kernel 3.0.0-14-generic-pae
Ubuntu Rescue Remix 12.04 LTS Custom using ubuntu kernel 3.2.0-74-generic-pae

When I installed 3.14.27 and 3.14.28 onto my P4 systems, the usual cpufreq
interface would show up in /sys. It would be using the scaling_driver
p4-clockmod. The only scaling_governor's that would work are performance
(default) and powersave. ondemand and conservative would not be accepted. This
is a problem for me as P4's are known to be mini oven burners.

Some google searching (and the menuconfig help page) mentioned that p4-clockmod
shouldn't be used anymore like it was in the 2.6 kernel days. It was replaced
with acpi-cpufreq. One web search mentioned that p4-clockmod would somehow be
loaded before acpi-cpufreq. The solution was to not compile p4-clockmod into
the kernel, which I did. The results were that the cpufreq interface in /sys
was removed.

I normally configure key components of the kernel to be compiled straight in
and not as modules. Since I couldn't see anything, I recompiled CPU power
management as modules.

acpi-cpufreq wouldn't load in the lsmod list. Manual loading failed.

Some further web searching hinted that it might work in uniprocessor mode. I
recompiled the kernel without SMP (by default removing hyperthreading), but the
results were the same.

That's about when I found the bug I cloned this ticket from. At the end is a
patch. As far as I can tell, that patch is properly in 3.14.27. Apparently it
worked for the original Pentium M, but it doesn't work for Pentium 4's.

I have half a rack of old P4 1u's, but I'll focus on the blackhole01 backup
server (2.8GHz) since it has the Ubuntu 14.04.1 32bit install.

Here's the output of some common commands I've seen listed elsewhere that most
will want to see:

root@blackhole01:~# uname -a
Linux blackhole01 3.14.28vqbfvm-32bit-p4smp #1 SMP PREEMPT Fri Jan 9 13:14:40
CST 2015 i686 i686 i686 GNU/Linux

First processor from...
root@blackhole01:~# cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 3
model name      : Intel(R) Pentium(R) 4 CPU 2.80GHz
stepping        : 3
microcode       : 0xb
cpu MHz         : 2795.032
cache size      : 1024 KB
physical id     : 0
siblings        : 2
core id         : 0
cpu cores       : 1
apicid          : 0
initial apicid  : 0
fdiv_bug        : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 5
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe constant_tsc pebs bts
pni dtes64 monitor ds_cpl cid
bogomips        : 5592.98
clflush size    : 64
cache_alignment : 128
address sizes   : 36 bits physical, 32 bits virtual
power management:

(Note: next "processor: 1" is the hyperthread and left off for space reasons.)

root@blackhole01:~# cpufreq-info
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  no or unknown cpufreq driver is active on this CPU
  maximum transition latency: 0.00 ms.
analyzing CPU 1:
  no or unknown cpufreq driver is active on this CPU
  maximum transition latency: 0.00 ms.

(NOTE: dual CPU listed is a hyperthread response)

root@blackhole01:~# find /sys/devices/ | grep -i cpufreq

(NOTE: nothing returned)

root@blackhole01:~# modprobe -v acpi-cpufreq
insmod
/lib/modules/3.14.28vqbfvm-32bit-p4smp/kernel/drivers/cpufreq/acpi-cpufreq.ko
modprobe: ERROR: could not insert 'acpi_cpufreq': No such device

root@blackhole01:~# ll
/lib/modules/3.14.28vqbfvm-32bit-p4smp/kernel/drivers/cpufreq/acpi-cpufreq.ko
-rw-r--r-- 1 root root 14104 Jan  9 18:30
/lib/modules/3.14.28vqbfvm-32bit-p4smp/kernel/drivers/cpufreq/acpi-cpufreq.ko

root@blackhole01:~# modprobe -vf acpi-cpufreq
insmod
/lib/modules/3.14.28vqbfvm-32bit-p4smp/kernel/drivers/cpufreq/acpi-cpufreq.ko
modprobe: ERROR: could not insert 'acpi_cpufreq': Exec format error

NOTE: nothing gets reported in dmesg

The reason I listed the Ubuntu Rescue Remix Live CD's above is to show that
cpufreq seems to have broken sometime between the listed 2.6 kernels (below)
and the 3.0 kernels.

My other P4 hardware showing this cpufreq problem goes beyond more than a
single processor version...

The processors I list here are in the format of:
ClockFrequency ProcessorType CPUFamily-Model-Stepping
as seen from /proc/cpuinfo

Desktop server name: paradox
3.0GHz single P4 15-3-4
Fails: Ubuntu Rescue Remix 12.04 LTS Custom using ubuntu kernel
3.2.0-74-generic-pae
Originally worked under debian/lenny kernel 2.6.28.10

1u server name: blackhole01 (mentioned above)
2.8GHz single P4 15-3-3
Fails: Ubuntu Rescue Remix 11.10 Custom using ubuntu kernel
3.0.0-14-generic-pae
Fails: Ubuntu Rescue Remix 12.04 LTS Custom using ubuntu kernel
3.2.0-74-generic-pae
As this was the first 32bit reinstall, I didn't write down the OS specs.

1u server name: confidence:
2.4GHz dual P4 Xeon 15-2-5
Fails: Ubuntu Rescue Remix 11.10 Custom using ubuntu kernel
3.0.0-14-generic-pae
Originally worked under debian 4.0 kernel 2.6.25.15 (p4-clockmod / ondemand)

1u server name: cluster02
2.4GHz single P4 15-2-7
Fails: Ubuntu Rescue Remix 11.10 Custom using ubuntu kernel
3.0.0-14-generic-pae
Originally worked under debian 3.1 kernel 2.6.17.9 (p4-clockmod / ondemand)

1u server name: fs1
2.4GHz dual P4 Xeon 15-2-7
Fails: Ubuntu Rescue Remix 11.10 Custom using ubuntu kernel
3.0.0-14-generic-pae
Originally worked under debian 3.1 kernel 2.6.21.7 (p4-clockmod / ondemand)

1u server name: windoze
2.0GHz dual P4 Xeon 15-2-4
Fails: Ubuntu Rescue Remix 11.10 Custom using ubuntu kernel
3.0.0-14-generic-pae

One or 2 more of these was tested with:
Ubuntu Rescue Remix 12.04 LTS Custom using ubuntu kernel 3.2.0-74-generic-pae
...but I didn't write down which. The 3.2.0-ubuntu kernels faild. The tests can
be re-run if desired.

My last debian kernel I compiled was 2.6.28.10. Sometime between that and
3.0.0-ubuntu, it seems something P4 was broken. I'm not sure why someone else
hasn't brought it up before now.

I'm not sure how hard getting acpi-cpufreq running with a 3.14.x P4 kernel
would be since there have been some changes. I can offer a developer a login
to:
blackhole01: 2.8GHz single P4 15-3-3
since this box is upgraded to Ubuntu 14.04.1 32bit and has been properly wiped
of old client backup data. I have the 3.14.28 kernel source compiled in a
directory that can be viewed/modified if needed. So long as the partition
tables stay put, this computer can be modified at will. I can restore the OS
backup when finished.

Thanks for the help. Let me know what's next.

-- 
You are receiving this mail because:
You are the assignee for the bug.
