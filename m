From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [RFC] cpufreqtools
Date: Thu, 21 Oct 2004 19:22:27 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041021172227.GA24663@dominikbrodowski.de>
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

Hi all,

The multitude of cpufreq userspace tools is something I like very much: it
offers the user the choice to use the tools which suits her needs best.

However, there are three issues which should be addressed, in my humble
opinion:

A) A small tool which allows to modify cpufreq settings without having to
type e.g. "/sys/devices/system/cpu/cpu0/cpufreq/scaling_set_speed" all the
time.

B) A small tool which prints out cpufreq information helpful to developers
and interested users.

C) A library, used by A), B) and any other cpufreq userspace tool
that wants to do so, which allows for a unified code base on how to
determine current cpufreq settings and how to modify or change them.


ad A) AFAIK, the "gnome-cpufreq-applet" contains a small tool named
"cpufreq-select" which tries to do something similar. However, it requires
some gnome libraries to be built and/or to run, and has some implementation
shortcomings, like focusing on specific frequencies and not policies.

Therefore, the hereby suggested tool "cpufreq-set" should have the following
options, IMO:

Options:
  -c CPU, --cpu CPU        number of CPU where cpufreq settings shall be modified
  -d FREQ, --min FREQ      new minimum CPU frequency the governor may select
  -u FREQ, --max FREQ      new maximum CPU frequency the governor may select
  -g GOV, --governor GOV   new cpufreq governor
  -f FREQ, --freq FREQ     specific frequency to be set. Requires userspace
                           governor to be available and loaded
  -h, --help           Prints out this screen


For example, the super-user can then run
# cpufreq-set -g ondemand
to switch to the ondemand governor on CPU 0, or
# cpufreq-set -c 1 -f 2000000
to switch to 2 GHz on CPU 1


ad B) 
Options:
  -c CPU, --cpu CPU    CPU number which information shall be determined about
  -e, --debug          Prints out debug information
  -f, --freq           Get frequency the CPU currently runs at, according
                       to the cpufreq core *
  -w, --hwfreq         Get frequency the CPU currently runs at, by reading
                       it from hardware (only available to root) *
  -l, --hwlimits       Determine the minimum and maximum CPU frequency allowed *
  -d, --driver         Determines the used cpufreq kernel driver *
  -p, --policy         Gets the currently used cpufreq policy *
  -g, --governors      Determines available cpufreq governors *
  -a, --affected-cpus  Determines which CPUs can only switch frequency at the
                       same time *
  -o, --proc           Prints out information like provided by the /proc/cpufreq
                       interface in 2.4. and early 2.6. kernels
  -m, --human          human-readable output for the -f and -w parameters
  -h, --help           Prints out this screen


#./cpufreq-info
cpufreq-info 0.1-pre0 (C) Dominik Brodowski 2004
analyzing CPU 0:
  driver: p4-clockmod
  hardware limits: 300 MHz - 2.40 GHz
  available frequency steps: 300 MHz, 600 MHz, 900 MHz, 1.20 GHz, 1.50 GHz, 1.80 GHz, 2.10 GHz, 2.40 GHz
  available cpufreq governors: userspace
  current policy: frequency should be within 300 MHz and 2.40 GHz.
                  The governor "userspace" may decide which speed to use
                  within this range.
  current CPU frequency is 2.40 GHz (asserted by call to hardware).

#./cpufreq-info -f -m
2.40 GHz
#./cpufreq-info -w
2399940



ad C)
check the "cpufreq.h" header file for the functions the library provides. It
uses both the 2.4. /proc interface and the 2.6. /sys interface; as the 2.4.
interface doesn't tell as much information as the 2.6. interface, it often
returns 0 or NULL. The 2.6. code requires the libsysfs library from
sysfsutils; I've developed it with syfsutils-1.2.0, it may also work with 
earlier revisions, too.



What needs to be done? The first implementation available at

http://www.brodo.de/cpufreq/cpufreqtools-0.1-pre0.tar.bz2 
size: 15k
[License: GPL v2]

just "works for me" for A) and B), and has all the code for C) in it. Still
missing is the following:

a) discussion about the need of such cpufreqtools, their (first)
   implementation, further requirements, shortcomings, etc.

b) thorough code review, especially from somebody aware of security issues.
   After all, some future revision of cpufreq-set may offer to enable
   the "setuid" bit.

c) adaption of cpufreq.h so that it can work with non-C programs/tools as
   well.

d) autotoolization and libtoolization. I tried to do so today, but failed
   big time. I simply have to few knowledge about these great tools to
   use them; so I'd need help in this area. I'd like to put the library
   in a subdirectory "libcpufreq/", only enable "sysfs" input if libsys
   is present, only enable "proc" input if so explicitely desired by the
   user; cpufreq-set and cpufreq-info should link against libcpufreq, too;
   and they should be put in a subdirecoty "utils/"... anybody willing to
   help me to do this?

e) The output should be corrected by someone who has better skills in the
   English language; and some documentation (man-files, README, INSTALL)
   be added.

f) internationalization / gettext. Should only be done once a)-d) are
   somewhat completed, though the hunks may be added earlier.



Thanks,
	Dominik
