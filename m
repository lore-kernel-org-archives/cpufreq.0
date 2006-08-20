From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6938] use of cpufreq (with any cpufreqd-like deamon) has
	strange influence on the embeded controler functions of an
	IBM Thinkpad X21
Date: Sun, 20 Aug 2006 05:04:41 -0700
Message-ID: <200608201204.k7KC4fZY007614@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=6938





------- Additional Comments From herrmann-tom@gmx.de  2006-08-20 04:58 -------
switching from
Preemption Model (Preemptible Kernel (Low-Latency Desktop))  --->
      Voluntary Kernel Preemption (Desktop)

to

Preemption Model (Preemptible Kernel (Low-Latency Desktop))  --->
      Preemptible Kernel (Low-Latency Desktop)

causes the same bug with 2.6.15.x kernels...

and the bug bugs the whole acpi, even the power_off (last init.d cmd) needs
mutch more time to to its job (on all kernels)

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
