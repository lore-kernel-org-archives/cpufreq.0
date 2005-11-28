From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH] transition latency of speedstep-ich (third try)
Date: Tue, 29 Nov 2005 00:48:54 +0100
Message-ID: <20051128234854.GA3423@inferi.kami.home>
References: <88056F38E9E48644A0F562A38C64FB600671185B@scsmsx403.amr.corp.intel.com>
	<438B942B.2090100@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="45Z9DzgjV8m4Oswq"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <438B942B.2090100@tremplin-utc.net>
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
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: davej@redhat.com, cpufreq@lists.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.net>


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2005 at 12:35:07AM +0100, Eric Piel wrote:
> 28.11.2005 23:19, Pallipadi, Venkatesh wrote/a =E9crit:
> >>-----Original Message-----
> >>From: Mattia Dongili [mailto:malattia@linux.it]=20
> >>
> >>I just build speedstep-ich with transition_latency =3D 250
> >>I'll let you know how it goes. Are you interested?
> Actually, the ondemand governor is quite safe on this side and multiply=
=20
> this value by 1000, so it shouldn't bring any problem anyway :-)

it's running nicely right now with 250, so I'll keep it by now.

> >>Maybe it's already been discussed, but how bad would be trying to
> >>measure transition latency at runtime?
> >>
> >
> >
> >
> >Yes. I was thinking the same thing. As this latency may be different on=
=20
> >P3-M and P4-M, may be we can do with a measurement at boot time and use=
=20
> >it, rather than hardcoding these values. However, I think we will have t=
o=20
> >do that by using gettimeofday or some such higherlevel call instead of=
=20
> >using pmtimer as pmtimer may not be available on all systems at all time=
s.=20
> >Otherwise, we may end up all sort of pmtimer/pit/hpet timer code in this=
=20
> >driver.
> >
> Sounds interesting :-) Especially as speedstep-ich already does at least=
=20
> 2 frequency transitions while initialising, it should be fairly easy to=
=20
> implement. I'm more concerned about the time measurement. What could be=
=20
> done is to use gettimeofday() and check that the result is reasonable=20
> (not too big nor too small), if it's not we just put something=20
> conservative, like 500us.

this is with do_gettimeofday (code I'm using is attached, oh it's
incremental against your patch and I also left some unused code behind):
cpufreq transition took 202 usec from gettimeofday
cpufreq transition took 200 usec from gettimeofday
cpufreq transition took 203 usec from gettimeofday
cpufreq transition took 200 usec from gettimeofday
cpufreq transition took 202 usec from gettimeofday
cpufreq transition took 199 usec from gettimeofday
cpufreq transition took 199 usec from gettimeofday
cpufreq transition took 199 usec from gettimeofday
cpufreq transition took 200 usec from gettimeofday
cpufreq transition took 199 usec from gettimeofday
cpufreq transition took 198 usec from gettimeofday
cpufreq transition took 201 usec from gettimeofday
cpufreq transition took 202 usec from gettimeofday
cpufreq transition took 199 usec from gettimeofday
cpufreq transition took 202 usec from gettimeofday
cpufreq transition took 198 usec from gettimeofday
cpufreq transition took 201 usec from gettimeofday

it seems reliable wrt values I got with PM timer.
Anyway I also agree with binding resulting measurements to some
reasonable value.

--=20
mattia
:wq!

--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="speedstep-ich-gettimeofday.diff"

diff --git a/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c b/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
index 3c84a9b..f54c5c5 100644
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
@@ -24,6 +24,7 @@
 #include <linux/cpufreq.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
+#include <linux/time.h>
 
 #include "speedstep-lib.h"
 
@@ -93,8 +94,7 @@ static void speedstep_set_state (unsigne
 	u8 pm2_blk;
 	u8 value;
 	unsigned long flags;
-	unsigned long long tsc1, tsc2;
-	u32 pmt1, pmt2;
+	struct timeval t1, t2;
 
 	if (!speedstep_chipset_dev || (state > 0x1))
 		return;
@@ -115,8 +115,7 @@ static void speedstep_set_state (unsigne
 	/* Disable IRQs */
 	local_irq_save(flags);
 
-	rdtscll(tsc1);
-	pmt1 = read_pmtmr();
+	do_gettimeofday(&t1);
 	
 	/* read state */
 	value = inb(pmbase + 0x50);
@@ -144,8 +143,7 @@ static void speedstep_set_state (unsigne
 	/* check if transition was successful */
 	value = inb(pmbase + 0x50);
 	
-	rdtscll(tsc2);
-	pmt2 = read_pmtmr();
+	do_gettimeofday(&t2);
 
 	/* Enable IRQs */
 	local_irq_restore(flags);
@@ -158,8 +156,13 @@ static void speedstep_set_state (unsigne
 		printk (KERN_ERR "cpufreq: change failed - I/O error\n");
 	}
 
-	printk(KERN_ERR "cpufreq transition took %llu TSC cycles\n", tsc2 - tsc1);
-	printk(KERN_ERR "cpufreq transition took %u PM timer cycles\n", pmt2 - pmt1);
+	{
+	
+		long long diff = (t2.tv_sec * MSEC_PER_SEC + t2.tv_usec) -
+			(t1.tv_sec * MSEC_PER_SEC + t1.tv_usec);
+		printk(KERN_ERR "cpufreq transition took %lld usec from gettimeofday\n", diff);
+			
+	}
 	return;
 }
 

--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--45Z9DzgjV8m4Oswq--

