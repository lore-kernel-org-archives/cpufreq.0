From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Geode GXm driver not handling frequency change properly?
Date: Sun, 4 Jul 2004 18:18:07 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040704161807.GA9171@dominikbrodowski.de>
References: <000701c46182$22d93700$0801a8c0@nalfeshnee>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <000701c46182$22d93700$0801a8c0@nalfeshnee>
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
To: Lincoln Smith <dagdamor@optushome.com.au>
Cc: CPUFreq List <cpufreq@www.linux.org.uk>

Hi,

> I have a Geode GX1 233 in a little SBC machine operating as a wireless
> router.  I was experimenting with the cpufreq driver and things just didn't
> seem to work properly.  The frequency checks in 2.6.7 seem to have
> illuminated the problem.  The interpretation of the target frequency seems
> to be inverted.  The frequency written to scaling_setspeed is interpreted as
> the length of time to turn the processor "off" for.  The realized frequency
> is cpu_maxfreq - scaling_setspeed.

Thanks for reporting this issue. Could you try out the attached patch,
please?

Many thanks,
	Dominik


When doing "clock modulation" (i.e. stopping the CPU clock for certain
amounts of time), the frequency equals the maximum frequency multiplied with
the "on" duration divided by the "on and off" duration. So, at the one place
inside gx-suspmod where this is broken, this needs to be fixed.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

--- 2.6.7-bkX/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c.original	2004-07-04 18:14:08.803868680 +0200
+++ 2.6.7-bkX/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c	2004-07-04 18:13:53.271230000 +0200
@@ -242,7 +242,7 @@
 	for (i=max_duration; i>0; i--) {
 		tmp_off = ((khz * i) / stock_freq) & 0xff; 
 		tmp_on = i - tmp_off;
-		tmp_freq = (stock_freq * tmp_off) / i;
+		tmp_freq = (stock_freq * tmp_on) / i;
 		/* if this relation is closer to khz, use this. If it's equal,
 		 * prefer it, too - lower latency */
 		if (abs(tmp_freq - khz) <= abs(old_tmp_freq - khz)) {
