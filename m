From: Andrew Morton <akpm@osdl.org>
Subject: Fw: Re: [OOPS] [2.6.0-test5-bk8] cpufreq and sysfs problem...
Date: Wed, 24 Sep 2003 15:37:46 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030924153746.3b0f6493.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Ashley Pittman <ashley@quadrics.com>
Cc: cpufreq@www.linux.org.uk


OK, thanks.  I've copied the cpurfeq guys; hopefully they can fix this one
up.


Begin forwarded message:

Date: Wed, 24 Sep 2003 23:33:18 +0100
From: Ashley Pittman <ashley@quadrics.com>
To: Andrew Morton <akpm@osdl.org>
Subject: Re: [OOPS] [2.6.0-test5-bk8] cpufreq and sysfs problem...



Hi,

This problem is entirely reproducible for me, rather than describe it 
i'm sending you a script that provokes it.  The chip is a via C3 so the 
longhaul module inserts properly and kinda works.

I suspect the problem is the 'cpufreq_userspace' module not increasing 
the ref count of the cpufreq directory but it's also possible the 
problem lies with the sysfs code itself, I can't see any notes about 
refcounting in the sysfs documentation so I'm not really sure where the 
answer lies.

In case your not familar with the cpufreq code the longhaul driver 
creates the sysfs directory, the cpufreq_longhaul module creates a file 
in that directory.   When the longhaul module is remove the directory 
should also go but that leaves the file with nowhere to go.

The problem still persists with the latest 2.6.0-test5-bk11 patch.

Ashley,

#!/bin/sh
modprobe longhaul
modprobe cpufreq_userspace
cd /sys/devices/system/cpu/cpu0/cpufreq
echo userspace > scaling_governor
ls scaling_setspeed
# This doesnt fail but look at the $PWD...
rmmod longhaul
# Note the $PWD is empty...
cd
modprobe longhaul
echo userspace > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
# This next line segv's, oops the kernel and makes future 'lsmod' hang
rmmod longhaul
