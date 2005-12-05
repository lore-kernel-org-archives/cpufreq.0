From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Wrong frequencies sometimes on Sony Vaio Athlon4
Date: Mon, 5 Dec 2005 12:11:18 +0100
Message-ID: <20051205111118.GB12747@poupinou.org>
References: <20051129135423.GA20258@bungled.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20051129135423.GA20258@bungled.net>
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
Content-Transfer-Encoding: 7bit
To: Nathan Conrad <conrad@bungled.net>
Cc: cpufreq@lists.linux.org.uk

On Tue, Nov 29, 2005 at 08:54:23AM -0500, Nathan Conrad wrote:
> Hi,
> 
> I have a 1.2 GHz Athlon4 CPU on my Sony Vaio PCG-FXA49 laptop. I use
> the powernow CPU scaling. Sometimes (a few percent of the time), the
> driver records my laptop's CPU as the wrong speed. For example, right
> now the following speeds are available:
> 
> 1292256 1076880 861504 646128 538440
> 
> The first should be almost exactly 1.2 GHz while the last should be
> 500 MHz.

Does that patch fix this issue?

--- linux-2.6.14/arch/i386/kernel/timers/timer_tsc.c	2005/11/16 18:35:06	1.1
+++ linux-2.6.14/arch/i386/kernel/timers/timer_tsc.c	2005/11/16 18:36:27
@@ -325,7 +325,9 @@ int recalibrate_cpu_khz(void)
 	unsigned int cpu_khz_old = cpu_khz;
 
 	if (cpu_has_tsc) {
+		local_irq_disable();
 		init_cpu_khz();
+		locale_irq_enable();
 		cpu_data[0].loops_per_jiffy =
 		    cpufreq_scale(cpu_data[0].loops_per_jiffy,
 			          cpu_khz_old,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
