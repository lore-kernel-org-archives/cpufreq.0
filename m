From: Niko Ehrenfeuchter <ehrenfeu@informatik.uni-freiburg.de>
Subject: ondemand and p3-m
Date: Fri, 20 Jan 2006 23:16:05 +0100
Message-ID: <1137795365.28411.30.camel@littledragon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi all,

I'm currently trying to get the ondemand-governor working with my PIII-M
(1133 MHz). The system is a ThinkPad X24 using the Intel 830 chipset,
kernel 2.6.15.1 with the corresponding (stable) acpi-patch.

While using the speedstep-ich module works for userspace stuff, echoing
"ondemand" into scaling_governor simply yields an invalid argument
error. Latency issue, I assume...? Turning on cpufreq's debug mode
doesn't tell anything why it won't use the ondemand gov.

Looked through the archive for that issue, but I haven't been _that_
successful, since it lacks some kind of search function... The only
thing I've discovered was a thread in october where Eric Piel posted a
patch for the first-generation 440BX speedstep. Is this patch included
in the current kernel? Should it work for me too?

Any hints?

Niko
