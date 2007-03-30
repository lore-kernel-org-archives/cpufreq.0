From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8264] powernow-k8 module gets stuck switching powerlevels on
	dualcore AMD64
Date: Fri, 30 Mar 2007 07:52:10 -0700
Message-ID: <200703301452.l2UEqA7C030885@fire-2.osdl.org>
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





------- Additional Comments From babassu@postmaster.co.uk  2007-03-30 07:52 -------
Created an attachment (id=10998)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=10998&action=view)
dmesg output with p-state timings

Unfortunately the problem is still there. It shows up after a while. It looks
more and more like a hardware issue. I have attached a dmesg output with
timings for every p-state transition. This is with the resend completely
disabled. Under the ondemand governor, doing nothing (no load) from time to
time it decides to change p-states. After a while it hangs. On average a
p-state takes about 6mS I would say. When it got stuck it did wait for 800 mS
with no success. Take a look to see if you spot anything wrong in the state
transition. It seems like it accepts only a limited number of transitions.
Would you happen to know if the BIOS may have anything to do in this matter
(the way it initializes some hardware maybe)? I will try to get an updated BIOS
see if it makes any difference. 
I agree with you that the resend should stay. From my tests increasing the
check loop (from 50 to 1000 in my case) with a msleep of (1) included would
reduce the need to try resending it 100 times. A resend of 10 max would
probably suffice to conclude that is very stuck. The check loop seems to be
exiting after max 10 iterations when working properly. 1000 is my extreme and
may detect better the stuck situation.
Thank you.

------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
