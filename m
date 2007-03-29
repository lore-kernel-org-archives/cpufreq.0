From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8264] powernow-k8 module gets stuck switching powerlevels on
	dualcore AMD64
Date: Wed, 28 Mar 2007 21:01:21 -0700
Message-ID: <200703290401.l2T41LAa001744@fire-2.osdl.org>
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





------- Additional Comments From babassu@postmaster.co.uk  2007-03-28 21:01 -------
I finaly built the new kernel (what an adventure when you have kernel tools from
Ubuntu edgy with kernel source from feisty - the make-kpkg would not add
vmlinuz* to the pkg).
I have increased the loop in "query_current_values_with_pending_wait" by a
factor of 10 (100000). The problem is gone.
Now it is time for experimenting. This is likely going to take some time. I will
keep you posted with my experiments. Unfortunately I have only one machine
available and cannot mess with it too much.
I believe that the loop may be replaced by a timed wait that does not depend of
the CPU freq (something like udelay/mdelay/sleep with a time value). This
reminds me of the Win9x boot problem with AMD K6 I think when some counter was
going to fast.
Also it would help if the module would recover from the "pending bit stuck
state" somehow without the need to reboot the kernel (I hate reboots).


------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
