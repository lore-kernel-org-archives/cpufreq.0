From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8264] powernow-k8 module gets stuck switching powerlevels on
	dualcore AMD64
Date: Thu, 29 Mar 2007 08:35:29 -0700
Message-ID: <200703291535.l2TFZT0S020902@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8264





------- Additional Comments From babassu@postmaster.co.uk  2007-03-29 08:35 -------
You mentioned this before:
>Some chip sets have inadequate
>buffering for pstate/cstate changes, and can get into a
>degenerate state where a cstate change following a cstate
>change causes the chipset to overflow the buffer and lose
>the pstate change.  The chipset completes both changes but
>doesn't know to signal the clear for the pstate change; the
>processor never clears the pending bit and the pstate change
>is assumed to never complete.  Solution is to resend the
>pstate change command, which the chipset acknowledges quickly
>(because it is already in the pstate from the previous change
>command) and clears the pending bit.

How does the chipset detect the resend of the pstate change command if the data
in the control register has not changed (the pending bit is still set, the rest
of the bits are the same, essentially we are writing <n> over <n> into a
register)? I am asking this because in my case at least the resend does not work.
Thank you.

------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
