From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH for other issue included] Re: [Bug 3600] New: Cpu
	recognization fails after upgrade from 2.6.7 to 2.6.9
Date: Tue, 2 Nov 2004 23:13:05 +0100
Message-ID: <20041102221305.GA8993@dominikbrodowski.de>
References: <200410201413.i9KED718023481@fire-1.osdl.org>
	<20041020154744.GA5372@dreamland.darkstar.lan>
	<20041020180537.17d0dd7c@paraclito.crema>
	<20041020165110.GA6992@dreamland.darkstar.lan>
	<20041021102529.GD22405@poupinou.org>
	<20041102211052.GA32732@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041102211052.GA32732@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: Bruno Ducrot <ducrot@poupinou.org>, cpufreq@www.linux.org.uk

On Tue, Nov 02, 2004 at 09:10:52PM +0000, Dave Jones wrote:
> On Thu, Oct 21, 2004 at 12:25:29PM +0200, Bruno Ducrot wrote:
> 
>  > > --- a/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-10-20 18:46:51.000000000 +0200
>  > > +++ b/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-10-20 18:47:06.000000000 +0200
>  > > @@ -597,7 +597,7 @@
>  > >  	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
>  > >  
>  > >  	/* A K7 with powernow technology is set to max frequency by BIOS */
>  > > -	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.MFID];
>  > > +	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.CFID];
>  > >  	if (!fsb) {
>  > >  		printk(KERN_WARNING PFX "can not determine bus frequency\n");
>  > >  		return -EINVAL;
>  > > 
>  > > 
>  > 
>  > No.  It's wrong.  Though I *much* prefer the form you submit, this will
>  > break other unfortunately, and therefore maxfid have to be used
>  > here for now as per AMD documentation (problem is, your bios is broken
>  > because it do not respect AMD recomandation since after POST the
>  > processor shall be put in max frequencies instead of 800MHz).  In short,
>  > there is a need to choose who would be broken here for now, and
>  > I have to do the one recommanded by AMD.
> 
> Since 2.6.9, I've been getting at least one private mail about this
> every few days, so I'd like to get this fixed for 2.6.10.
> Some ideas..
> 
> - A module parameter to switch between usage of MFID / CFID.
> - If cpu_khz is greater than any of the frequencies in the table
>   we calculate, use CFID.
>   (This might not work as running frequency on battery may be
>    in the list of frequencies we calculate)

From somebody who doesn't know the details and who assumes that MFID is the
maximum frequency multiplier and CFID the assumed current frequency
multiplier: 

There's a "fsb" entry in the psb structure -- can't we do the following:

long int freq_cfid = cfid * fsb_entry_in_psb;
long int freq_mfid = mfid * fsb_entry_in_psb;

freq_cfid -= cpu_khz;
freq_mfid -= cpu_khz;

if (abs(freq_cfid) < abs(freq_mfid))
	/* use CFID */
else
	/* use MFID */

> - Construct tables for _both_ MFID and CFID, and merge the
>   results.
> 
>  > I'm not sure for now how to implement correctly this, and I don't have
>  > time for now to make free developpements, but when I got time, I will
>  > try to make a workaround (there is also another trouble with the MFID,
>  > since we can not modprobe a second time if the processor is not in max
>  > for example, but I don't think it will be so hard to fix).
> 
> That just needs 'restore to max on unload' as longhaul did.
> Maybe we should make a core function that does that on module
> shutdown.

We can't do this (currently) in the driver's ->exit() function, as
cpufreq_notify_transition may not be called that late in the
cpufreq_remove_dev() process, as cpufreq_cpu_data[cpu] is already zeroed to
make cpufreq_cpu_get() fail. Problem is that cpufreq_cpu_get() _needs_ to
fail pretty soon in _remove_dev() so that there are no severe
side-effects... Actually, while looking at it, there's a lock-grabbing missing...
but even adding the lock doesn't lead to the exclusion I'd like to have
there... in theory it should work like this:

cpufreq_remove_dev() {
	1.) disallow other cpufreq code to grab references to this CPU,
		including sysfs access
	2.) stop the governor. From here on there may be no calls succeeding
		to either the governor or the cpufreq driver using
		__cpufreq_driver_target()
	3.) possibly set the CPU to max freq. Can't work currently because
		it'll break because of 1.) above
	4.) wait for all references to all sysfs files etc. to be dropped
	5.) call the driver's ->exit() function which may, among others,
		remove remaining sysfs files.
	6.) be [k]free() and go
}

... and I _think_ this patch allows us to do 1 to 6 without 3 at least.

Please apply on top of the other patches submitted to you.

Thanks,
	Dominik


[CPUFREQ] core: CPUFREQ_GOV_STOP needs to be last

Assert that the call to the cpufreq governor with CPUFREQ_GOV_STOP is really
the last. Without this patch, some strange in-kernel preemption combined with
the scheduler disliking the "removing" task may cause the opposite.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-11-01 23:24:45.000000000 +0100
+++ linux/drivers/cpufreq/cpufreq.c	2004-11-02 22:51:22.000000000 +0100
@@ -763,8 +763,11 @@
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 #endif
 
+	down(&data->lock);
 	if (cpufreq_driver->target)
 		__cpufreq_governor(data, CPUFREQ_GOV_STOP);
+	cpufreq_driver->target = NULL;
+	up(&data->lock);
 
 	kobject_unregister(&data->kobj);
 
@@ -1025,7 +1029,7 @@
 	lock_cpu_hotplug();
 	dprintk("target for CPU %u: %u kHz, relation %u\n", policy->cpu,
 		target_freq, relation);
-	if (cpu_online(policy->cpu))
+	if (cpu_online(policy->cpu) && cpufreq_driver->target)
 		retval = cpufreq_driver->target(policy, target_freq, relation);
 	unlock_cpu_hotplug();
 	return retval;
