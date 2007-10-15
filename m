From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH][try 2] architectural pstate driver for powernow-k8
Date: Mon, 15 Oct 2007 11:40:31 -0400
Message-ID: <20071015154031.GA30754@redhat.com>
References: <200710091446.38432.mark.langsdorf@amd.com>
	<p73fy0k3ve8.fsf@bingen.suse.de>
	<200710091543.21350.mark.langsdorf@amd.com>
	<20071011075958.GK1130@shadowen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20071011075958.GK1130@shadowen.org>
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
To: Andy Whitcroft <apw@shadowen.org>
Cc: cpufreq@lists.linux.org.uk, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org

On Thu, Oct 11, 2007 at 08:59:58AM +0100, Andy Whitcroft wrote:
 
 > >  	/* get fid did for hardware pstate transition */
 > >  	pstate = index & HW_PSTATE_MASK;
 > > -	if (pstate > MAX_HW_PSTATE)
 > > +	if (pstate > data->max_hw_pstate);
 > >  		return 0;
 > 
 > checkpatch picked up this dodgy if.  I suspect that the ';' is wrong
 > from the context.
 
Indeed.  Mark/Andreas, want to send me a new patch against latest
Linus HEAD ?  I didn't apply the old one yet, as it conflicted with
the changes already queued for merging.

Thanks,

	Dave

-- 
http://www.codemonkey.org.uk
