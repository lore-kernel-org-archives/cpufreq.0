From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 12114] AthlonXP-M
Date: Mon, 7 Mar 2011 12:58:40 GMT
Message-ID: <201103071258.p27CweEO001402@demeter1.kernel.org>
References: <bug-12114-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-12114-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=12114





--- Comment #9 from Dominique Larchey-Wendling <larchey@loria.fr>  2011-03-07 12:58:38 ---
Two years later, here are my observations regarding the TSC/network/skge
problem.

After I disabled cpu frequency scaling AND the processor option in ACPI
(ACPI_PROCESSOR=n), the TSC was not unstable any more on a 2.6.27 kernel (patch
with openvz). The file server has been running flawlessly for more than a year
without reboot, sometimes under heavy load for weeks long. No more stalled
network interface leading to an inaccessible server (the server is headless).

2 weeks ago, I updated the server to FC14 and a 2.6.32 kernel (patch with
openvz). As I did not recall the whole TSC problem issues, I inadvertently
changed the ACPI_PROCESSOR flag to y(es), but as I remembered that frequency
scaling was an issue, I let that option untouched, ie no frequency scaling. 

As a consequence, the network stalling problem re-appeared. After a few days of
uptime (1 to 3 days), the file server network interface does not respond any
more, but there is no crash, no oops. I noticed the following message in the
logs :

Mar  7 09:59:47 xxxxx klogd: [    4.100585] Marking TSC unstable due to TSC
halts in idle

And thus tsc is removed from 

/sys/devices/system/clocksource/clocksource0/available_clocksource 

Only acpi_pm remains. But nevertheless, even though TSC is removed as a clock
source, it seems that the TSC functionality is not completely ignored and has a
bad impact on the behaviour of the skge driver.

After I re-read this bugzilla thread, I remembered the ACPI_PROCESSOR issue and
I disabled it again. Now TSC is apparently stable and serves as "reliable"
clock source. Also, hopefully, the skge driver will work again. Otherwise I
will come back here.

I cannot test later kernels like 2.6.36 or 2.6.37 because no openvz patch
exists for such kernels. I don't know if "unstable TSC" management has evolved
in recent kernels. What remains a mystery for me is how an unstable but
disabled TSC (as a clock source) impacts the skge network driver.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
