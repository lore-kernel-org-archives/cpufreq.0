From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: cpufreq/linux/arch/arm/mach-sa1100 cpu-sa1100.c, 1.5,
	1.6 cpu-sa1110.c, 1.12, 1.13
Date: Thu, 26 Aug 2004 18:57:32 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040826165732.GP29560@poupinou.org>
References: <E1C0KGF-0006od-0A@flint.arm.linux.org.uk>
	<20040826151034.E21364@flint.arm.linux.org.uk>
	<20040826151540.F21364@flint.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040826151540.F21364@flint.arm.linux.org.uk>
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
To: cpufreq@www.linux.org.uk
Cc: davej@redhat.com

On Thu, Aug 26, 2004 at 03:15:40PM +0100, Russell King wrote:
> On Thu, Aug 26, 2004 at 03:10:34PM +0100, Russell King wrote:
> > On Thu, Aug 26, 2004 at 02:25:51PM +0100, Ducrot Bruno wrote:
> > > Update of /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-sa1100
> > > In directory flint:/tmp/cvs-serv26017/linux/arch/arm/mach-sa1100
> > > @@ -329,8 +329,12 @@
> > >  }
> > >  
> > >  static struct cpufreq_driver sa1110_driver = {
> > > +	.flags		= CPUFREQ_STICKY |
> > 
> > > +			  CPUFREQ_PANIC_OUTOFSYNC | 		<<<<
> > > +			  CPUFREQ_PANIC_RESUME_OUTOFSYNC,	<<<<
> > 
> > Erm, _why_ ?

Because I only merged the latest bk kernel.  I should pay more attention
in the future..  Sorry.

> > 
> > This makes very little sense.  If you put the system to sleep at
> > 147MHz and it normally boots at 206.4MHz, you'll resume at 206.4MHz.
> > 
> > It's up to the kernel to reset the clock rate itself.  This is nothing
> > new - cpufreq has always done this, so why are we adding this new
> > restriction?
> > 
> > It makes zero sense.
> 
> And to follow that up, yes, I missed it back in June when I added
> the CPUFREQ_STICKY here.  However, I was completely unaware that
> this change had been made back in May 2004.
> 
> Can we please route changes to architecture files via the architecture
> people _before_ merging them.  Pretty please?

Does something like this ok?

Index: linux/arch/arm/mach-sa1100/cpu-sa1100.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-sa1100/cpu-sa1100.c,v
retrieving revision 1.6
diff -u -r1.6 cpu-sa1100.c
--- linux/arch/arm/mach-sa1100/cpu-sa1100.c	26 Aug 2004 13:25:17 -0000	1.6
+++ linux/arch/arm/mach-sa1100/cpu-sa1100.c	26 Aug 2004 16:55:27 -0000
@@ -230,9 +230,7 @@
 }
 
 static struct cpufreq_driver sa1100_driver = {
-	.flags		= CPUFREQ_STICKY |
-			  CPUFREQ_PANIC_OUTOFSYNC | 
-			  CPUFREQ_PANIC_RESUME_OUTOFSYNC,
+	.flags		= CPUFREQ_STICKY,
 	.verify		= sa11x0_verify_speed,
 	.target		= sa1100_target,
 	.get		= sa11x0_getspeed,
Index: linux/arch/arm/mach-sa1100/cpu-sa1110.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-sa1100/cpu-sa1110.c,v
retrieving revision 1.13
diff -u -r1.13 cpu-sa1110.c
--- linux/arch/arm/mach-sa1100/cpu-sa1110.c	26 Aug 2004 13:25:17 -0000	1.13
+++ linux/arch/arm/mach-sa1100/cpu-sa1110.c	26 Aug 2004 16:55:27 -0000
@@ -329,9 +329,7 @@
 }
 
 static struct cpufreq_driver sa1110_driver = {
-	.flags		= CPUFREQ_STICKY |
-			  CPUFREQ_PANIC_OUTOFSYNC | 
-			  CPUFREQ_PANIC_RESUME_OUTOFSYNC,
+	.flags		= CPUFREQ_STICKY,
 	.verify		= sa11x0_verify_speed,
 	.target		= sa1110_target,
 	.get		= sa11x0_getspeed,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
