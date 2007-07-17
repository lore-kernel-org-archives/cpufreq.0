From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8075] powernow-k8: MP systems not supported by PSB BIOS
	structure
Date: Tue, 17 Jul 2007 00:36:10 -0700 (PDT)
Message-ID: <20070717073610.ED2771080F6@picon.linux-foundation.org>
References: <bug-8075-3570@http.bugzilla.kernel.org/>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8075-3570@http.bugzilla.kernel.org/>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8075


davemilter@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |davemilter@gmail.com




------- Comment #19 from davemilter@gmail.com  2007-07-17 00:41 -------
Hi guys, I had the same issue here, but kernel 2.6.22:
# uname -a
Linux localhost 2.6.22-gentoo #5 SMP Mon Jul 16 15:08:03 MSD 2007 i686 AMD
Athlon(tm) 64 X2 Dual Core Processor 4200+ AuthenticAMD GNU/Linux
# modprobe powernow-k8
FATAL: Error inserting powernow_k8
(/lib/modules/2.6.22-gentoo/kernel/arch/i386/kernel/cpu/cpufreq/powernow-k8.ko):
No such device

# dmesg | tail -n 3
powernow-k8: Found 2 AMD Athlon(tm) 64 X2 Dual Core Processor 4200+ processors
(version 2.00.00)
powernow-k8: MP systems not supported by PSB BIOS structure
powernow-k8: MP systems not supported by PSB BIOS structure


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
