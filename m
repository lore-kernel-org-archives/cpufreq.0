From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] powernow-k8 typos
Date: Mon, 11 Jun 2007 11:05:17 -0400
Message-ID: <20070611150517.GF9174@redhat.com>
References: <200706081133.08650.joachim.deguara@amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200706081133.08650.joachim.deguara@amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joachim Deguara <joachim.deguara@amd.com>
Cc: cpufreq@lists.linux.org.uk

On Fri, Jun 08, 2007 at 11:33:08AM +0200, Joachim Deguara wrote:
 > typos fixed
 > 
 > Signed-off-by: Joachim.Deguara <joachim.deguara@amd.com>
 > Acked-by: Mark Langsdorf <mark.langsdorf@amd.com>
 > 
 > Index: 2.6-vanilla/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
 > ===================================================================
 > --- 2.6-vanilla.orig/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
 > +++ 2.6-vanilla/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
 > @@ -599,7 +599,7 @@ static void print_basics(struct powernow
 >  	for (j = 0; j < data->numps; j++) {
 >  		if (data->powernow_table[j].frequency != CPUFREQ_ENTRY_INVALID) {
 >  			if (cpu_family == CPU_HW_PSTATE) {
 > -			printk(KERN_INFO PFX "   %d : fid 0x%x gid 0x%x (%d MHz)\n", j, 
 > (data->powernow_table[j].index & 0xff00) >> 8,
 > +			printk(KERN_INFO PFX "   %d : fid 0x%x did 0x%x (%d MHz)\n", j, 
 > (data->powernow_table[j].index & 0xff00) >> 8,

word-wrapped.
Is also so long it should probably be split over two lines anyway.
Also, the printk should be indented by one more tab.
(Same for the one in the else arm of this if)

 >  				(data->powernow_table[j].index & 0xff0000) >> 16,
 >  				data->powernow_table[j].frequency/1000);
 >  			} else {
 > @@ -1084,7 +1084,7 @@ static int powernowk8_target(struct cpuf
 >  
 >  	if (cpu_family == CPU_HW_PSTATE)
 >  		dprintk("targ: curr fid 0x%x, did 0x%x\n",
 > -			data->currfid, data->currvid);
 > +			data->currfid, data->currdid);

I've been curious for a while.. What is a 'did' ?
fid and vid I can figure out, but did has been puzzling me.

	Dave

-- 
http://www.codemonkey.org.uk
