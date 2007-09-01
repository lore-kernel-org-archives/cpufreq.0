From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8720] still problems with k7 mobile frequency is lower than
	real
Date: Sat,  1 Sep 2007 08:21:43 -0700 (PDT)
Message-ID: <20070901152143.5BAC0108010@picon.linux-foundation.org>
References: <bug-8720-3570@http.bugzilla.kernel.org/>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8720-3570@http.bugzilla.kernel.org/>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8720


dsd@gentoo.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |davej@codemonkey.org.uk




------- Comment #19 from dsd@gentoo.org  2007-09-01 08:21 -------
Looking at dmesg in comment #15 and corresponding DSDT in comment #16:

powernow tables in this system are unusable so it falls back on ACPI. The
powernow_acpi_control_t values in the control field of the _PSS entries always
result in FID=0 VID=0 which looks wrong.

As there is _PCT, acpi-cpufreq may be a better cpufreq driver choice for this
system. However the ACPI-supplied cpu frequencies in _PSS are wrong.

The DSL code for _PSS reads FID and VID values from system memory (region FSEG
defined at 0x000FDF00 in system memory), and uses them as indexes into a local
PS13 array which presumably contains a series of frequencies. However, again
the FID values are always 0 so it always ends up looking at the first element,
0x5b7 (1463).

I'm not 100% sure if 0x000FDF00 is controlled by Linux or otherwise, however I
am fairly sure the answer here is that your BIOS is double-broken. Dave, any
comments?


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
