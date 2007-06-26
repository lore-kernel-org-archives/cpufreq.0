From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 2.6.22-rc6?] keep policy->user_policy in sync and use CPU0
	policy as a template for other CPUs
Date: Tue, 26 Jun 2007 15:22:29 +0900
Message-ID: <20070626062229.GA3421@inferi.kami.home>
References: <20070625133403.820121080F9@picon.linux-foundation.org>
	<1182780094.22063.30.camel@queen.suse.de>
	<20070625141154.GB13308@inferi.kami.home>
	<1182784351.4249.3.camel@queen.suse.de>
	<20070625153452.GC13308@inferi.kami.home>
	<1182798023.4249.18.camel@queen.suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1182798023.4249.18.camel@queen.suse.de>
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
To: Thomas Renninger <trenn@suse.de>
Cc: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>

On Mon, Jun 25, 2007 at 09:00:22PM +0200, Thomas Renninger wrote:
> On Tue, 2007-06-26 at 00:34 +0900, Mattia Dongili wrote:
> > On Mon, Jun 25, 2007 at 05:12:31PM +0200, Thomas Renninger wrote:
> > > On Mon, 2007-06-25 at 23:11 +0900, Mattia Dongili wrote: 
> > > > On Mon, Jun 25, 2007 at 04:01:34PM +0200, Thomas Renninger wrote:
> > > > > On Mon, 2007-06-25 at 06:34 -0700, bugme-daemon@bugzilla.kernel.org
> > > > > wrote:
> > > > > > http://bugzilla.kernel.org/show_bug.cgi?id=8671
> > > > > > 
> > > > > 
> > > > > > ------- Comment #1 from malattia@linux.it  2007-06-25 06:37 -------
> > > > > > aaaah, maybe that's because CPU1 is offlined and when resumed .init is called
> > > > > > which sets the CPUFREQ_DEFAULT_GOVERNOR.
> > > > > > In fact after resume CPU1 has the performance governor here, could you check
> > > > > > it's the case for you as well?
> > > > > > 
> > > > > > Any suggestion on how to solve that?
> > > > > > Maybe cpufreq_add_dev should set the CPU0 policy as default when other CPUs are
> > > > > > up-ed?
> > > > > > 
> > > > > Can you reproduce this by simply offlining the cpu and checking
> > > > > governors?:
> > > > > echo 0 >/sys/devices/cpu/cpu1/online
> > > > > echo 1 >/sys/devices/cpu/cpu1/online
> > > > > cat /sys/devices/cpu/cpu1/cpufreq/scaling_governor
> > > > 
> > > > yep, definitely reproducible.
> > > > 
> > > > > Do you still have an older kernel (2.6.21 or older) with working cpufreq
> > > > > installed? Can you double check on this, pls.
> > > > 
> > > > herm... no. I'm on 2.6.22-rc4-mm2, I have 2.6.22-rc5 handy, all the
> > > > other .21 are -mm patched.
> > > Ok, if you already have one compiled, then also checking on 2.6.22-rc5
> > > would help.
> > > 
> > > If this one is also affected, it's pretty much the patch from me who
> > > breaks this...
> > > If not, I'll still have a look at mm..., but then it's at least not that
> > > sever...
> > > 
> > > Ahh in the bug it's stated that 2.6.22-rc5-git8 is affected? I'll have a
> > > look...
> > 
> > Yes, but it looks slightly different as this is on UP. Anyway changes in
> > -mm look pretty trivial so I'm pretty sure also -rc5 is affected anyway.
> > Will test later just to confirm.
> > 
> > BTW: which patch are you talking about? I can't see much activity in
> > drivers/cpufreq recently.
> The two patches are attached. The third, small one could be the fix. I
> still don't really get why, because policy->governor gets initialised in
> ->init ..., anyway, now there is no functional change anymore with my
> patch, I should have done it like this from the beginning...
...
> Index: linux-2.6.22-rc6/drivers/cpufreq/cpufreq.c
> ===================================================================
> --- linux-2.6.22-rc6.orig/drivers/cpufreq/cpufreq.c
> +++ linux-2.6.22-rc6/drivers/cpufreq/cpufreq.c
> @@ -770,7 +770,6 @@ static int cpufreq_add_dev (struct sys_d
>  	}
>  	policy->user_policy.min = policy->cpuinfo.min_freq;
>  	policy->user_policy.max = policy->cpuinfo.max_freq;
> -	policy->user_policy.governor = policy->governor;
>  
>  #ifdef CONFIG_SMP
>  	for_each_cpu_mask(j, policy->cpus) {
> @@ -865,6 +864,7 @@ static int cpufreq_add_dev (struct sys_d
>  	/* set default policy */
>  	ret = __cpufreq_set_policy(policy, &new_policy);
>  	policy->user_policy.policy = policy->policy;
> +	policy->user_policy.governor = policy->governor;
>  
>  	unlock_policy_rwsem_write(cpu);

It's not a matter of ordering, policy->governor is already wrong here
because the cpu driver set it to CPUFREQ_DEFAULT_GOVERNOR.
Also, policy->user_policy is not kept in sync now that
cpufreq_set_policy disappeared and cpufreq_update_policy simply sets the
wrong policy when it runs on resume.

The following patch fixes this for me but I don't know if locking is
needed in the first hunk.

[CPUFREQ]
set the same policy as CPU0 on other CPUs when up-ed and keep
policy->user_policy in sync.

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 9375095..21933e2 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -768,11 +768,19 @@ static int cpufreq_add_dev (struct sys_device * sys_dev)
 		unlock_policy_rwsem_write(cpu);
 		goto err_out;
 	}
-	policy->user_policy.min = policy->cpuinfo.min_freq;
-	policy->user_policy.max = policy->cpuinfo.max_freq;
-	policy->user_policy.governor = policy->governor;
 
 #ifdef CONFIG_SMP
+	if (cpu != 0) {
+		managed_policy = cpufreq_cpu_get(0);
+		if (likely(managed_policy)) {
+			policy->governor = managed_policy->user_policy.governor;
+			policy->min = managed_policy->user_policy.min;
+			policy->max = managed_policy->user_policy.max;
+			cpufreq_cpu_put(managed_policy);
+			dprintk("Governor for CPU%u is %s\n", cpu,
+					policy->governor->name);
+		}
+	}
 	for_each_cpu_mask(j, policy->cpus) {
 		if (cpu == j)
 			continue;
@@ -869,7 +877,6 @@ static int cpufreq_add_dev (struct sys_device * sys_dev)
 
 	/* set default policy */
 	ret = __cpufreq_set_policy(policy, &new_policy);
-	policy->user_policy.policy = policy->policy;
 
 	unlock_policy_rwsem_write(cpu);
 
@@ -1625,6 +1632,11 @@ static int __cpufreq_set_policy(struct cpufreq_policy *data,
 		__cpufreq_governor(data, CPUFREQ_GOV_LIMITS);
 	}
 
+	data->user_policy.min = data->min;
+	data->user_policy.max = data->max;
+	data->user_policy.policy = data->policy;
+	data->user_policy.governor = data->governor;
+
 error_out:
 	cpufreq_debug_enable_ratelimit();
 	return ret;
-- 
mattia
:wq!
