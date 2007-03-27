From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8264] powernow-k8 module gets stuck switching powerlevels on
	dualcore AMD64
Date: Tue, 27 Mar 2007 11:38:11 -0700
Message-ID: <200703271838.l2RIcBdI009475@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8264





------- Additional Comments From babassu@postmaster.co.uk  2007-03-27 11:38 -------
I took the liberty to glance at the code for powernow-k8.c
(/usr/src/linux-source-2.6.20/arch/i386/kernel/cpu/cpufreq). I may be totally
out to lunch here but bear with me.
1. the function "query_current_values_with_pending_wait" has a loop incrementing
a counter to 10000 (not totally properly initialized) trying to read the fid/vid
ctl MSR register. Can this be too short (10000 CPU registry reads on a 2GHz CPU)
2. If the call to query_current_values_with_pending_wait fails we try to set the
fid/vid control registry again in a loop (up to 100 times) -
wrmsr(MSR_FIDVID_CTL, lo, data->pllock * PLL_LOCK_CONVERSION); Can this be
potentially bad (it would set the pending bit again but if the old fid==new fid
the bit may not be reset ever since no change in frequency is required)?
3. The loop in "query_current_values_with_pending_wait" may ramp up the CPU to
100% triggering the "governor" mechanism. Are we protected to this kind of
conflicts ?
I will dig more and come back. 


------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
