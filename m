From: Kronos <kronos@kronoz.cjb.net>
Subject: Re: [Bug 3600] New: Cpu recognization fails after upgrade from
	2.6.7 to 2.6.9
Date: Wed, 20 Oct 2004 18:51:10 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041020165110.GA6992@dreamland.darkstar.lan>
References: <200410201413.i9KED718023481@fire-1.osdl.org>
	<20041020154744.GA5372@dreamland.darkstar.lan>
	<20041020180537.17d0dd7c@paraclito.crema>
Reply-To: kronos@kronoz.cjb.net
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041020180537.17d0dd7c@paraclito.crema>
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
To: Daniele Bonomi <dbonomi@crema.unimi.it>
Cc: cpufreq@www.linux.org.uk

Il Wed, Oct 20, 2004 at 06:05:37PM +0200, Daniele Bonomi ha scritto: 
> On Wed, 20 Oct 2004 17:47:44 +0200 Kronos <kronos@kronoz.cjb.net> wrote:
> 
> > Hi,
> > I saw something similar on my notebook. In my case when the notebook
> > is turned on while using battery BIOS sets CPU speed to a frequency
> > lower than the defaul (800MHz for me). It seems that powernow driver
> > is confused by the BIOS fiddling with CPU speed and fails to load. I
> > had the same symptoms: PST not found and wrong min/max frequencies.
> > 
> > Disabling "Automatic CPU power saving" (or something like that) in the
> > BIOS cures the problem for me. Note that this option do not affect
> > power management under linux (or windows), it just controls the CPU
> > before a real OS comes up.
> 
> I tried but it didn't worked for me.
> For me doesn't work even if i'm plugged in...

Ok, can you apply this patch to 2.6.9 (and enable debug):

--- a/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-10-20 18:46:51.000000000 +0200
+++ b/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-10-20 18:47:06.000000000 +0200
@@ -597,7 +597,7 @@
 	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
 
 	/* A K7 with powernow technology is set to max frequency by BIOS */
-	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.MFID];
+	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.CFID];
 	if (!fsb) {
 		printk(KERN_WARNING PFX "can not determine bus frequency\n");
 		return -EINVAL;


Luca
-- 
Home: http://kronoz.cjb.net
Se non puoi convincerli, confondili.
