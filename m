From: Russell King <rmk@arm.linux.org.uk>
Subject: cpufreq on ARM - 2.6 problem
Date: Tue, 2 Sep 2003 18:21:59 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030902182158.C9345@flint.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi,

There seems to be a problem with cpufreq on SA11x0 platforms when resuming.
The effect seems to be a hang.  I suspect that this is caused by the cpufreq
resume method being a sys device (and therefore called with interrupts off).
It sets the CPU clock rate, which in turn calls the transition notifier,
which might (and does) sleep.

(of course, all this happens when the serial console is disabled because
its a device not a sysdevice, so getting debug out of the system is nigh
on impossible.)

I'm not sure what the right way to handle this is, and still ensure that
all drivers have the right settings for stuff like SDRAM and LCD timings.

I'm also concerned that the backport of 2.6 stuff to 2.4 may introduce
the same problem into 2.4 kernels.

-- 
Russell King (rmk@arm.linux.org.uk)                The developer of ARM Linux
             http://www.arm.linux.org.uk/personal/aboutme.html
