From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k7: wrong FSB frequency detection
Date: Thu, 1 Jul 2004 20:02:15 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040701180215.GH5614@poupinou.org>
References: <20040701122555.GC24153@master.mivlgu.local>
	<20040701152803.GF5614@poupinou.org>
	<20040701163549.GD29214@master.mivlgu.local>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040701163549.GD29214@master.mivlgu.local>
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
To: Sergey Vlasov <vsu@altlinux.ru>
Cc: cpufreq@www.linux.org.uk

On Thu, Jul 01, 2004 at 08:35:49PM +0400, Sergey Vlasov wrote:
> On Thu, Jul 01, 2004 at 05:28:03PM +0200, Bruno Ducrot wrote:
> > On Thu, Jul 01, 2004 at 04:25:55PM +0400, Sergey Vlasov wrote:
> > > On the MaxSelect A7W notebook the powernow-k7 driver in kernel 2.6.7
> > > basically works, but shows completely wrong frequency values:
> > > 
> > > # cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies 
> > > 4355876 3266907 2800206 2489072 2177938 1555670
> > > 
> [skip]
> > Could you please try this little debug stuff ?  That will not help for
> > now, but I want to be sure.
> 

Thanks.  IMHO we should restore the old behaviour, that is using the
max fid as per powernow spec, then provide something for people who
unfortunately do have borken bios (those who put the processor not in
max fid before booting OS).

Dave, could you please apply this patch?  I will provide the workaround
for the unfortunate tomorow, after searching who do have the borken
bios, and probably yet another powernow boot option :(

--- linux-2.6/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/07/01 15:01:46	1.1
+++ linux-2.6/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/07/01 17:56:12
@@ -565,7 +565,7 @@ static int __init powernow_cpu_init (str
 	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
 
 	/* A K7 with powernow technology is set to max frequency by BIOS */
-	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.CFID];
+	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.MFID];
 	if (!fsb) {
 		printk(KERN_WARNING PFX "can not determine bus frequency\n");
 		return -EINVAL;

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
