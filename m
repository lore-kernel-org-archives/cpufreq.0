From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Acer Aspire  1350 broken PST
Date: Fri, 16 Apr 2004 17:24:32 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040416152432.GW8953@poupinou.org>
References: <c5n0ms$7nc$1@sea.gmane.org> <20040416120519.GT8953@poupinou.org>
	<c5osds$fed$1@sea.gmane.org> <20040416151135.GV8953@poupinou.org>
	<c5otiu$ime$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <c5otiu$ime$1@sea.gmane.org>
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
To: jy <jy454@yahoo.fr>
Cc: cpufreq@www.linux.org.uk

On Fri, Apr 16, 2004 at 05:19:56PM +0200, jy wrote:
> Bruno Ducrot wrote:
> >On Fri, Apr 16, 2004 at 05:00:10PM +0200, jy wrote:
> 
> >
> >Indeed.  Could you please post the full dmesg please?
> >
> 

Ok.  I expected that BIOS will put the frequency at max at POST stage.
That is not true for your laptop indeed.  Can you try that patch:

--- linux-cpufreq-bk/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/04/16 15:20:03	1.1
+++ linux-cpufreq-bk/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/04/16 15:20:27
@@ -550,8 +550,7 @@ static int __init powernow_cpu_init (str
 
 	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
 
-	/* A K7 with powernow technology is set to max frequency by BIOS */
-	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.MFID];
+	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.CFID];
 	if (!fsb) {
 		printk(KERN_WARNING PFX "can not determine bus frequency\n");
 		return -EINVAL;

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
