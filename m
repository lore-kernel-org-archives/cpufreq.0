From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8264] powernow-k8 module gets stuck switching powerlevels on
	dualcore AMD64
Date: Thu, 29 Mar 2007 16:29:43 -0700
Message-ID: <200703292329.l2TNThfX003306@fire-2.osdl.org>
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





------- Additional Comments From babassu@postmaster.co.uk  2007-03-29 16:29 -------
After some more tests:
1. My chipset does not like to get flooded with requests. With the loop set to
10000 in "query_current_values_with_pending_wait" the resend loop gets executed
at least 3 times each change request. Very quickly the pending bit very stuck
shows up. I timed the loop at approximately 1.365 mS.

2. With the same loop set to 100000 (a little over 10ms wait) the resend does
not occur most of the time. Once occurred the bit get stuck and no go from there.

3. You are right, once the pending bit is very stuck I cannot be reset it even
if I force it. Basically my chipset once is flooded stops responding.

4. I have a supposition that the resend does not work and causes more bad than
good on my system.

5. I modified the "query_current_values_with_pending_wait" like this (I gave it
max 20mS in steps of 1mS) and I am running problem free for now (the resend does
not occur anymore):

        do {
                if (i++ > 20) {
                        dprintk("detected change pending stuck\n");
                        return 1;
                }
                msleep(1);
                rdmsr(MSR_FIDVID_STATUS, lo, hi);
        } while (lo & MSR_S_LO_CHANGE_PENDING);

6. Note that msleep may let the cpu do other things while is waiting. It can be
replaced with usleep with a lower time-out along with increasing the loop limit
 for better granularity (if I can figure out how).

7. I plan to take the resend loop out completely and run some stats as to how
long it takes for a change to be ack-ed on average (the chipset seems to be
quite slow at this).

------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
