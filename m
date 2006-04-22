From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6426] Working Longhaul driver removed from kernel
Date: Sat, 22 Apr 2006 10:50:48 -0700
Message-ID: <200604221750.k3MHomV4022213@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6426

davej@codemonkey.org.uk changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |DEFERRED
         Resolution|                            |WILL_FIX_LATER



------- Additional Comments From davej@codemonkey.org.uk  2006-04-22 10:50 -------
You got lucky.  It's completely broken (In part due to the quirky hardware
design of longhaul), and needs significant effort to fix.
(There needs to be infrastructure work done to quiesce dma from IDE/SCSI during
speed transitions, otherwise real bad things can happen ranging from lock-ups,
to disk corruption.)

It's possible you never hit it because you were using conservative which doesn't
change the speed very often, however in some cases a single transition is enough
to hit the bug.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
