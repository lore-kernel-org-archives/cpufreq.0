From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Fix for longrun.c for degenerate case
Date: Sun, 9 May 2004 16:16:41 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040509141641.GA9335@dominikbrodowski.de>
References: <409C40B9.6000603@zytor.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <409C40B9.6000603@zytor.com>
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
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk

On Fri, May 07, 2004 at 07:06:49PM -0700, H. Peter Anvin wrote:
> Hi all,
> 
> I ran into a system the other day which had a Transmeta processor, but 
> configured in a degenerate, fixed-frequency configuration. It crashed 
> booting Fedora Core 2 test 3 due to a division by zero in the longrun 
> cpufreq driver.  The attached patch fixes this.

Thanks. I'd suggest that driver initialization should fail instead --
there's  no reason to keep the cpufreq infrastructure up and running if
nothing at all can be done, e.g. the frequency is fixed. The attached patch
(untested due to lack of hardware) should do right that. Dave, please decide
which patch you prefer, and merge accordingly. 

Thanks,
	Dominik

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/longrun.c linux/arch/i386/kernel/cpu/cpufreq/longrun.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/longrun.c	2004-04-28 22:07:55.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/longrun.c	2004-05-09 16:13:49.272043792 +0200
@@ -239,6 +239,9 @@
 	if (result)
 		return result;
 
+	if (longrun_high_freq <= longrun_low_freq)
+		return -ENODEV; /* degenerate Longrun table */
+
 	/* cpuinfo and default policy values */
 	policy->cpuinfo.min_freq = longrun_low_freq;
 	policy->cpuinfo.max_freq = longrun_high_freq;
