From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16072] [HP Pavilion dm1-1110ev] Cpufreq doesn't work at all (
 Intel Celeron U2300 )
Date: Mon, 25 Oct 2010 17:34:07 GMT
Message-ID: <201010251734.o9PHY7kY026130@demeter2.kernel.org>
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





--- Comment #23 from Robert Bradbury <robert.bradbury@gmail.com>  2010-10-25 17:33:51 ---
Thomas, you should have such a P4 machine plugged into a watt-meter as I
currently have.  I am (with the kernel modified back to the old p4-clockmod
driver) able to detect a significant power savings as the machine scales itself
back from 2.8 Ghz to lesser speed power savings [1].

p4-clockmod, as distributed prior to ~2.6.30, *did* work, in at least lowering
power consumption when it did not need to be running at 2.8GHz (which on my
machine might be only 2-4 hours/day).  Mucking with the BIOS to add "real" ACPI
support for reduced power consumption (if the CPU can even support it) is way
beyond the capabilities of most users of Linux.

I think the problem is that some kernel developer didn't like the
responsiveness of  a machine using p4-clockmod and changed the timing which
allowed it to work quite effectively on many/most desktop machines [2].

Its simple for me -- I just change the code back to what worked when I upgrade
kernels.  But unless you are comfortable hacking the kernel (not something I
consider likely with most Ubuntu users) that is difficult.

Now if the kernel developers would like to release BIOS code for a HP Pavilion
with a Pentium IV Prescott CPU which *does* support acpi-cpufreq and no longer
generates the message: "cpufreq-core: initialization failed" then I would be
willing to consider testing it.

1. The power savings dropping from 2.8 GHz to 350 MHz is 144 to 109 W or nearly
24%.
2. This is spite of the fact that p4-clockmod has a variety of
information/adjustment params in /sys/devices/system/cpu/cpu0/cpufreq which
could be set to manage the responsiveness of the machine for various workloads
[3].  It seems to be a case of using a sledge-hammer to fix something that
could have been fixed with a jeweler's screwdriver.
3. Which appear to be undocumented.  So unless you know how to read the source
code you cannot "tune" the machine easily.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
