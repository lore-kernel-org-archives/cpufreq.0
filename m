From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [ANNOUNCE] cpufrequtils-0.1-pre1
Date: Thu, 28 Oct 2004 20:45:05 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041028184505.GA19970@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Dear all,

cpufrequtils-0.1-pre1 is out and available at
http://www.brodo.de/cpufreq/cpufrequtils-0.1-pre1.tar.bz2 (~250KB)

Based on the earlier RFC for a "cpufreqtools" package mentioned on this
mailing list, Mattia Dongili and myself have created this cpufrequtils
package. It conists of the following elements:


libcpufreq
----------

"libcpufreq" is a library which offers a unified access method for userspace 
tools and programs to the cpufreq core and drivers in the Linux kernel. This
allows for code reduction in userspace tools, a clean implementation of
the interaction to the cpufreq core, and support for both the sysfs and proc
interfaces [depending on configuration, see below]


utils
-----

"cpufreq-info" determines current cpufreq settings, and provides useful
debug information to users and bug-hunters.
"cpufreq-set" allows to set a specific frequency and/or new cpufreq policies
without having to type "/sys/devices/system/cpu/cpu0/cpufreq" all the time.


debug
-----

Four debug tools helpful for cpufreq have been merged into this package.
These are a decoding tool for the MSR settings found on Intel SpeedStep
Centrino CPUs; a program by Dave Jones to dump the PSB tables for AMD
PowerNow! support on AMD K7 CPUs; and two kernel modules which allow to dump
the contents of the cpufreq-related ACPI data as well as one which verifies 
the correctness of the on-CPU Time Stamp Counter when cpufreq is used. These
tools are not meant for general usage, so they are not built by default.
Also, they are x86-specific, so users on different architectures should
ignore the contents of debug/ for the time being.


compilation and installation
----------------------------

./configure && make
su
make install

should suffice on most systems. It builds default libcpufreq,
cpufreq-set and cpufreq-info files and installs them in /usr/local/lib and
/usr/local/bin, respectively. Due to the autotoolization by Mattia Dongili
the standard options to make and make install, like "--prefix=/usr", can be
passed and (should) work correctly.


options and dependencies
------------------------

./configure by default enables the sysfs interface, but disables the
deprecated /proc interface to the cpufreq core in the Linux kernel. For
the sysfs interface to build and work correctly, you need "libsysfs", which
is part of the "sysfsutils" package. Current requirement is
	sysfsutils-1.0.0
or later.

To disable the sysfs interface, pass the option "--disable-sysfs" to
./configure.


To enable the (deprecated) /proc interface support, pass the option
"--enable-proc" to ./configure.



TODO
----

There's still quite some stuff to be done to improve this package in the
short term:
- Documentation, man pages
- internationalization (using gettext, should be in -pre2)
- init scripts which load the best cpufreq driver on x86 and x86-64
   architectures
- verification, bug reports, etc. I'd like to receive a sample output of
  "cpufreq-info" on non-x86 architectures to verify it works correctly on
   these architectures; namely x86-64, sparc, ppc, sh and arm.

and in the long term:
- unified background "daemon" which asserts that no userspace tools conflict
   with each other on setting cpufreq policies and/or frequencies. Might
   work using a socket, dbus, or ...
- some helpers which provide common functions needed by various cpufreq
   userspace tools (e.g. determining CPU load without programs running
   nice()d)
- throttling awareness, once the cpufreq core handles throttling in addition
   to frequency scaling


THANKS
------
Many thanks to Mattia Dongili who wrote the autotoolization and
libtoolization of cpufreq; to Dave Jones for his feedback and his dump_psb
tool; and to various others commenting on the RFC sent to this list earlier.


	Dominik
