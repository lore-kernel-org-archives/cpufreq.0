From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: powernow-k8: support acpi
Date: Tue, 6 Apr 2004 16:55:02 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040406145502.GA7307@dominikbrodowski.de>
References: <99F2150714F93F448942F9A9F112634C1163C8D7@txexmtae.amd.com>
	<20040321185417.GA7969@dominikbrodowski.de>
	<20040326122931.GA321@elf.ucw.cz>
	<20040401235635.GA25744@redhat.com>
	<20040402162447.GP19001@poupinou.org>
	<20040402163902.GC5688@redhat.com>
	<20040402170926.GA289@elf.ucw.cz>
	<20040406130730.GA5133@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="jRHKVT23PllUwdXP"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040406130730.GA5133@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dave Jones <davej@redhat.com>
Cc: Andrew Morton <akpm@osdl.org>, Bruno Ducrot <ducrot@poupinou.org>, mark.langsdorf@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>, Pavel Machek <pavel@ucw.cz>, paul.devriendt@amd.com


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 06, 2004 at 02:07:30PM +0100, Dave Jones wrote:
> On Fri, Apr 02, 2004 at 07:09:26PM +0200, Pavel Machek wrote:
> 
>  > > I'm about to disappear for a day or two. I'll look into integrating whats
>  > > outstanding on Sunday.  Pavel, if you have time between now and then
>  > > to do a diff of whats remaining between your tree and the driver I posted
>  > > this afternoon, that would make my life a little easier.
>  > 
>  > Here it is: (I was not able to locate your changes, so it is possible
>  > I'm reverting some of those; but few extra inlines should not hurt
>  > that bad :-).
> 
> Ok, the merge-from-hell is complete (split up into 23 csets).
> The only diffs between your tree and mine should now be trivial
> whitespace changes, and some small bits that looked bogus.

Just found a small bug which would leave the preempt count negative(!) in
special cases. Patch is attached.

> You can grab what I have in my tree pending pushing to Linus at
> http://www.codemonkey.org.uk/projects/cpufreq/pending.diff

Will
http://www.codemonkey.org.uk/projects/bitkeeper/cpufreq/
be a permanent institution, or is it just available for the moment?

> One thing outstanding that probably does need fixing. Andi Kleen
> mentioned on IRC yesterday ..
> 
> <f> found a funny bug in the powernow-k8 acpi changes
> <f> when  acpi is disabled processor.ko won't load, but the new module needs symbols from that
> <f> i added a hack to keep it loaded anyways
> 
> Be nice to get that fixed, and merged before these changes get pushed to mainline.

Hm. Keeping processor.ko loaded seems to be an ugly hack to me. However, I
can't see a way (yet) how powernow-k8.ko can rely on processor.ko's objects
but not depend on it if these are not neeeded (psb case).

	Dominik

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.6.5-fix-jump"

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-04-06 16:41:19.907636632 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-04-06 16:50:54.428296216 +0200
@@ -848,7 +848,7 @@
 
 	if (smp_processor_id() != pol->cpu) {
 		printk(KERN_ERR "limiting to cpu %u failed\n", pol->cpu);
-		goto err_out;
+		goto sched_out;
 	}
 
 	/* from this point, do not exit without restoring preempt and cpu */
@@ -892,6 +892,7 @@
 
 err_out:
 	preempt_enable_no_resched();
+sched_out:
 	set_cpus_allowed(current, oldmask);
 	schedule();
 

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--jRHKVT23PllUwdXP--

