From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH] (1/1) cpufreq_conservative
	-cpufreq_conservative-2.6.11-rc3-mm2.diff
Date: Tue, 22 Feb 2005 12:19:02 +0100
Message-ID: <20050222111902.GE12182@poupinou.org>
References: <88056F38E9E48644A0F562A38C64FB60040DBCC5@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60040DBCC5@scsmsx403.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: davej@redhat.com, cpufreq@ZenII.linux.org.uk, alex-kernel@digriz.org.uk, Alexander Clouter <alex@digriz.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>

On Mon, Feb 21, 2005 at 10:01:42AM -0800, Pallipadi, Venkatesh wrote:
> >
> >	if (idle_ticks > down_idle_ticks ) {
> >		/* go down by 5% */
> >		...
> >		__cpufreq_driver_target(policy, requested_freq[cpu],
> >			 CPUFREQ_RELATION_H);
> >		...
> >	}
> >	...
> >
> >
> >The first __cpufreq_driver_target() is correct, but the latter should
> >be CPUFREQ_RELATION_L, which exactly match your words:
> >
> >> _L means CPU frequency is _larger_ than (or equal to) 
> >requested_freq[cpu] but 
> >> as _low_ as possible.
> >
> 
> Actually, the reason it is RELATION_H in both cases is:
> - In this particular piece of code, we want to reduce the freq to next
> lowest freq. But, as we don't know the allowed freq, we just do
> (cur_freq - 5) and try to go to next freq lower than 95%.
> - If we use RELATION_H here, and if there is no freq supported between
                       ^
                       L

> 95% and 100%, then we will never be able to reduce the freq.
             (other than 100%)
> 
> So, even though the code is kind of counter-intuitive, I think it is
> doing the right thing.

Yes, you are indeed right.  I misread Documentation/cpu-drivers.txt:

<quote>
The CPUfreq driver must set the new frequency when called here. The
actual frequency must be determined using the following rules:

- keep close to "target_freq"
- policy->min <= new_freq <= policy->max (THIS MUST BE VALID!!!)
- if relation==CPUFREQ_REL_L, try to select a new_freq higher than or equal
    target_freq. ("L for lowest, but no lower than")
- if relation==CPUFREQ_REL_H, try to select a new_freq lower than or equal
  target_freq. ("H for highest, but no higher than")
</quote>


But for the conservative driver (and the first call to
__cpufreq_driver_target()), we have:


+       if (idle_ticks < up_idle_ticks) {
+               /* if we are already at full speed then break out early */
+               if (requested_freq[cpu] == policy->max)
+                       return;
+
+               freq_step = (dbs_tuners_ins.freq_step * policy->max) / 100;
+
+               /* max freq cannot be less than 100. But who knows....  */
+               if (unlikely(freq_step == 0))
+                       freq_step = 5;
+
+               requested_freq[cpu] += freq_step;
+               if (requested_freq[cpu] > policy->max)
+                       requested_freq[cpu] = policy->max;
+
+               __cpufreq_driver_target(policy, requested_freq[cpu],
+                       CPUFREQ_RELATION_H);
+               down_skip[cpu] = 0;
+               this_dbs_info->prev_cpu_idle_down = total_idle_ticks;
+               return;
+       }


- In this particular piece of code, we want to raise the freq to next
  higher freq. But, as we don't know the allowed freq, we just do
  (cur_freq + step) and try to go to next freq higher than
  cur_freq+step.
- If we use RELATION_H here, and if there is no freq supported
  between cur_freq and (cur_freq+step) other than cur_freq, then
  we will never be able to raise the freq.

This dont apply to ondemand since we want to raise the freq to the
max available frequency.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
