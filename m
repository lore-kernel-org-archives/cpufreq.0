From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16072] [HP Pavilion dm1-1110ev] Cpufreq doesn't work at all (
 Intel Celeron U2300 )
Date: Fri, 22 Oct 2010 21:09:48 GMT
Message-ID: <201010222109.o9ML9mX9005924@demeter2.kernel.org>
References: <bug-16072-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-16072-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=16072





--- Comment #15 from Robert Bradbury <robert.bradbury@gmail.com>  2010-10-22 21:09:24 ---
This shiould not be closed as an "undicumemented bug".  The machine is a
standard HP Pavilion A630N machine (presumably which hundreds of thousands
were manufactured in the 2003-2005 time frame).

In monitoring the Gentoo bug framework I am aware that there are laptops
being manufactured to date (2010) which contain Bios which do not contain
the proper code to  properly inform about the BIOS capabilities.

In short there are still machines which exist out there which WILL NOT
PERFORM properly on what ACPI code is supposed to exisit.  Because it
doesn't exist or cannot be programmed into the machines.   The P4-clockmod
change was/is wrong -- the P4 clockmod driver worked fine for these machines
before the "correction"  I have a machine which works fine backing down to
1.75 GHz or even 750 Mhz.   And I can watch the power consumption decrease
on a Watt-Meter which the machine is plugged into.

Though I am running a gentoo-2.6.35-r10 kernel (whiich I presume is roughly
equivalent to the final release of 2.6.35.   The p4-clockmod, e.g.
arch/x86/kernel/cpu/cpufreq/p4-clockmod.c

is backtracked to ~the 2.6.28 release (or perhaps somehat later)  Because
that is the release which worked on these machines.  Subsequent releases do
not allow P4 clockmod control and are therefore worthless.  There are two
dividing lines -- some people want their machine to be responsive -- and
that may have prompted the change in p4-clockmod.c  And there are others who
may have reasons to leave their computers on (such as to provide web
services)  who may desire minimal CPU/power consumption at all times.   The
current p4-clockmod.c situation prevents that and that is why I am forced to
run an older instantiation of that driver.

It is not a problem which can be resolved by throwing out the older or
un-upgraded (in terms of BIOS capabilities with respect to ACPI).  The
proper response is for Linux to determine if the machine does have advanced
ACPI control capanilities -- and if it does not allow for old-style P4
clockmod fallback..

Because that is what works and it should not be a Linux position to force
people into less than 5 y.o. machines.  p4-clocmod.c used to work perfectly
in reducing power consumption.  It currently does not.  Thus in the current
release of Linux it cannot be viewed as being "green".

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
