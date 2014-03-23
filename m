From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58001] "ondemand" CPU governor never raises frequency (Dell XPS
 12)
Date: Sun, 23 Mar 2014 22:39:18 +0000
Message-ID: <bug-58001-12968-mlkUG0oCMz@https.bugzilla.kernel.org/>
References: <bug-58001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-58001-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=58001

Paul Johnson <pauljohn@ku.edu> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pauljohn@ku.edu

--- Comment #14 from Paul Johnson <pauljohn@ku.edu> ---
I see problem too. May not be kernel, but in Ubuntu in particular. I think the
up_threshold is set at 95, too high, and keeping it lower is a bit of a hassle.

My system now:

$ uname -a
Linux dellap7 3.11.0-13-generic #20-Ubuntu SMP Wed Oct 23 07:38:26 UTC 2013
x86_64 x86_64 x86_64 GNU/Linux

CPU never goes fast in ondemand unless I do this:

su -c  "echo -n 70 > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold"

I find 70 is low enough to solve the sluggishness problem in Ubuntu. 

I wanted to make that permanent. Its not easy in newer Ununtu. I find that
suggestions to edit /etc/sysfs.conf are unhelpful. I found one post that claims
that the Ubuntu stack does not create /sys/devices/system/cpu/cpufreq/ondemand
soon enough, so the sysfs adjustments have no effect. The best explanation I've
found is #5 in this thread
https://bugs.launchpad.net/ubuntu/+source/sysfsutils/+bug/955918.

A suggestion is to insert this in /etc/rc.local, so it will run, or wait until
the rest of the system has done what it is supposed to. I've not got advice
from an expert on whether this is bad or good, but I'm doing it, following that
example.

until [ -d "/sys/devices/system/cpu/cpufreq/ondemand" ]; do
            sleep 1
done

echo -n "70" > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold

Another thing users with same up_threshold problem might benefit from use of a 
applet that can turn CPUs to performance mode instantly. It works in user
space, no admin required (that was a new thing to me, anyway). Look for this:

indicator-cpufreq 

That's handy when you can't seem to get the CPUs to go fast. Performance mode
makes a laptop hotter (in several senses :) ).

From a user's point of view, this has all become very confusing. What is
controlling speed now? There's no cpufreqd anymore? Some guidance from kernel
experts would be pleasant. There were posts claiming that Intel discouraged
ondemand, maybe that factors into problem (Intel Dev says "Stop using
OnDemand!!!"
https://bbs.archlinux.org/viewtopic.php?id=163524&p=2). I suppose that must
have been bogus, since we are still using ondemand a year later. But not
cpufreqd, so far as I can tell, in a fresh Ubuntu install.

-- 
You are receiving this mail because:
You are the assignee for the bug.
