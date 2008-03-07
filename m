From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10062] cpufreq scaling for via c3 no longer works
Date: Fri,  7 Mar 2008 03:34:27 -0800 (PST)
Message-ID: <20080307113427.39D8F11D107@picon.linux-foundation.org>
References: <bug-10062-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10062-3570@http.bugzilla.kernel.org/>
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=10062


bugzilla.kernel.org@rolf.leggewie.biz changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REJECTED                    |REOPENED
         Resolution|INVALID                     |




------- Comment #2 from bugzilla.kernel.org@rolf.leggewie.biz  2008-03-07 03:34 -------
Dave, thank you for your comment.  I have been enduring this problem for quite
some time, trying out all kinds of different things in the process.  While you
are right that normally I run a vendor-supplied kernel, I did test this with a
couple of self-compiled kernels, too.  I'll try to do this again as soon as
possible, but I don't expect any changes.

# grep -i longhaul /boot/config-2.6.22-14-386 
CONFIG_X86_LONGHAUL=m
# modprobe longhaul
FATAL: Error inserting longhaul
(/lib/modules/2.6.22-14-386/kernel/arch/i386/kernel/cpu/cpufreq/longhaul.ko):
No such device
# grep -i longhaul /var/log/syslog
Mar  7 12:30:51 Rie kernel: [3705563.931789] longhaul: VIA C3 'Samuel' [C5A]
CPU detected.  Longhaul v1 supported.
Mar  7 12:30:51 Rie kernel: [3705563.931925] longhaul: No ACPI support.
Unsupported northbridge.

So, it looks like the module is there, but it does not work as expected.

https://bugs.launchpad.net/bugs/50431 has some more information.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
