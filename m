From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH] cpufreq/intel_pstate: Add function to check that all MSR's are valid
Date: Thu, 21 Mar 2013 01:08:03 +0100
Message-ID: <13387259.b2vHhipG0R@vostro.rjw.lan>
References: <1363796244-6658-1-git-send-email-dirk.brandewie@gmail.com> <5818534.Fj7AtdhPq1@vostro.rjw.lan> <5149FFE1.7030706@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <5149FFE1.7030706@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Wednesday, March 20, 2013 11:28:49 AM Dirk Brandewie wrote:
> On 03/20/2013 11:28 AM, Rafael J. Wysocki wrote:
> > On Wednesday, March 20, 2013 09:17:24 AM dirk.brandewie@gmail.com wrote:
> >> From: Dirk Brandewie <dirk.brandewie@gmail.com>
> >>
> >> Some VMs seem to try to implement some MSRs but not all the registers
> >> the driver needs.  Check to make sure all the MSR that we need are
> >> available. If any of the required MSRs are not available refuse to
> >> load.
> >>
> >> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
> >
> > Is this needed for v3.9?  Any pointers to bug reports etc.?
> >
> 
> Sorry I saw right after I sent the mail that the bug report was missing
> 
>      https://bugzilla.redhat.com/show_bug.cgi?id=922923
>      Reported-by: Josh Stone <jistone@redhat.com>
> 
> Would you like me to spin the patch?

No, thanks, this information is sufficient.

Thanks,
Rafael


> >> ---
> >>   drivers/cpufreq/intel_pstate.c |   26 ++++++++++++++++++++++++++
> >>   1 files changed, 26 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
> >> index f6dd1e7..cd9c5f4 100644
> >> --- a/drivers/cpufreq/intel_pstate.c
> >> +++ b/drivers/cpufreq/intel_pstate.c
> >> @@ -752,6 +752,29 @@ static struct cpufreq_driver intel_pstate_driver = {
> >>
> >>   static int __initdata no_load;
> >>
> >> +static int intel_pstate_msrs_not_valid(void)
> >> +{
> >> +	/* Check that all the msr's we are using are valid. */
> >> +	u64 aperf, mperf, tmp;
> >> +
> >> +	rdmsrl(MSR_IA32_APERF, aperf);
> >> +	rdmsrl(MSR_IA32_MPERF, mperf);
> >> +
> >> +	if (!intel_pstate_min_pstate() ||
> >> +		!intel_pstate_max_pstate() ||
> >> +		!intel_pstate_turbo_pstate())
> >> +		return -ENODEV;
> >> +
> >> +	rdmsrl(MSR_IA32_APERF, tmp);
> >> +	if (!(tmp - aperf))
> >> +		return -ENODEV;
> >> +
> >> +	rdmsrl(MSR_IA32_MPERF, tmp);
> >> +	if (!(tmp - mperf))
> >> +		return -ENODEV;
> >> +
> >> +	return 0;
> >> +}
> >>   static int __init intel_pstate_init(void)
> >>   {
> >>   	int cpu, rc = 0;
> >> @@ -764,6 +787,9 @@ static int __init intel_pstate_init(void)
> >>   	if (!id)
> >>   		return -ENODEV;
> >>
> >> +	if (intel_pstate_msrs_not_valid())
> >> +		return -ENODEV;
> >> +
> >>   	pr_info("Intel P-state driver initializing.\n");
> >>
> >>   	all_cpu_data = vmalloc(sizeof(void *) * num_possible_cpus());
> >>
> 
-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
