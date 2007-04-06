From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH][retry 3] Report the number of processors in PowerNow-k8
	correctly
Date: Fri, 6 Apr 2007 19:35:20 -0400
Message-ID: <20070406233520.GB30225@redhat.com>
References: <46157337.8090600@amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <46157337.8090600@amd.com>
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
To: Mark Langsdorf <mark.langsdorf@amd.com>
Cc: cpufreq@lists.linux.org.uk

On Thu, Apr 05, 2007 at 05:07:51PM -0500, Mark Langsdorf wrote:
 > The PowerNow! driver for Opteron reports the number of cores
 > in the system, but claims to report the number of processors.
 > Fix this minor cosmetic bug.
 > 
 > Signed-Off-By: Bhavana Nagendra <bhavana.nagendra@amd.com>
 > Acked-by: Mark Langsdorf <mark.langsdorf@amd.com>

Time for retry #4.

 > --- linux-2.6.20/arch/i386/kernel/cpu/cpufreq/powernow-k8.c.old
 > 2007-04-05 15:43:36.000000000 -0500
 > +++ linux-2.6.20/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2007-04-05
 > 15:45:03.000000000 -0500
 > @@ -661,7 +661,8 @@ static int fill_powernow_table(struct po
 > 
 >  	dprintk("cfid 0x%x, cvid 0x%x\n", data->currfid, data->currvid);
 >  	data->powernow_table = powernow_table;

Note in the two lines above that they begin space space tab.
That should be space tab. Thunderbird took the liberty of adding
some extras for you.

 > -	print_basics(data);
 > +	if (first_cpu(cpu_core_map[data->cpu]) == data->cpu)
 > +		print_basics(data);
 > 
 >  	for (j = 0; j < data->numps; j++)
 >  		if ((pst[j].fid==data->currfid) && 
 >  		(pst[j].vid==data->currvid))
 > @@ -814,7 +815,8 @@ static int powernow_k8_cpu_init_acpi(str
 > 
 >  	/* fill in data */
 >  	data->numps = data->acpi_data.state_count;
 > -	print_basics(data);
 > +	if (first_cpu(cpu_core_map[data->cpu]) == data->cpu)
 > +		print_basics(data);
 >  	powernow_k8_acpi_pst_values(data, 0);
 > 
 >  	/* notify BIOS that we exist */

Same here.

I know this patch is small enough that I could have just hacked in the
changes myself, but I'd really rather you keep fighting so that I
don't have to hand-apply future patches too :)
(Especially in case they end up being larger than this one)

If you want to keep sending retries to me off-list, I'm ok with that.
I think we can spare the list the retransmits.

	Dave

-- 
http://www.codemonkey.org.uk
