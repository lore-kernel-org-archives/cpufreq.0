From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: 2.4.21 Isn't working for me....
Date: Wed, 27 Aug 2003 17:55:03 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030827155503.GR10585@poupinou.org>
References: <1061872616.27076.47.camel@localhost>
	<1061926909.14523.5.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1061926909.14523.5.camel@localhost>
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
To: AthlonRob <AthlonRob@axpr.net>
Cc: cpufreq@www.linux.org.uk

On Tue, Aug 26, 2003 at 12:41:50PM -0700, AthlonRob wrote:
> On Mon, 2003-08-25 at 21:36, AthlonRob wrote:
>  
> > I'm trying to get some cpu frequency control over my laptop's CPU with
> > the 2.4.21 kernel.  I'd just jump to 2.6.0-test4, but have a few pieces
> > of hardware that don't have drivers available for the test kernel yet.
> 
> I just found http://www.codemonkey.org.uk/projects/cpufreq/ in the
> archives and gave the two patches listed there a shot.
> 

Try this:

--- linux/drivers/cpufreq/userspace.c	25 Aug 2003 14:58:47 -0000	1.1.1.1
+++ linux/drivers/cpufreq/userspace.c	27 Aug 2003 15:51:42 -0000
@@ -17,9 +17,9 @@
 #include <linux/smp.h>
 #include <linux/init.h>
 #include <linux/spinlock.h>
+#include <linux/cpufreq.h>
 #include <linux/interrupt.h>
 #include <linux/ctype.h>
-#include <linux/cpufreq.h>
 #include <linux/sysctl.h>
 #include <linux/types.h>
 #include <linux/fs.h>
diff -u -a -r1.1.1.2 cpufreq.h
--- linux/include/linux/cpufreq.h	25 Aug 2003 14:58:47 -0000	1.1.1.2
+++ linux/include/linux/cpufreq.h	27 Aug 2003 15:51:42 -0000
@@ -16,6 +16,7 @@
 
 #include <linux/config.h>
 #include <linux/notifier.h>
+#include <linux/sched.h>
 #include <linux/threads.h>
 #include <asm/semaphore.h>
 

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
