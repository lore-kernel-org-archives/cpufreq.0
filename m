From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 4/4] minor optimizations to ondemand governor
Date: Fri, 30 Jun 2006 01:37:53 -0400
Message-ID: <20060630053753.GE32729@redhat.com>
References: <20060628135217.E12989@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060628135217.E12989@unix-os.sc.intel.com>
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
To: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Cc: alexey.y.starikovskiy@intel.com, cpufreq <cpufreq@www.linux.org.uk>, Len Brown <lenb@unix-os.sc.intel.com>

On Wed, Jun 28, 2006 at 01:52:18PM -0700, Venkatesh Pallipadi wrote:

 > Index: linux-2.6.17/drivers/cpufreq/cpufreq_ondemand.c
 > ===================================================================
 > --- linux-2.6.17.orig/drivers/cpufreq/cpufreq_ondemand.c
 > +++ linux-2.6.17/drivers/cpufreq/cpufreq_ondemand.c
 > @@ -17,23 +17,11 @@
 >  
 >  #include <linux/kernel.h>
 >  #include <linux/module.h>
 > -#include <linux/smp.h>
 >  #include <linux/init.h>
 > -#include <linux/interrupt.h>
 > -#include <linux/ctype.h>
 >  #include <linux/cpu.h>
 >  #include <linux/cpufreq.h>
 > -#include <linux/sysctl.h>
 > -#include <linux/types.h>
 > -#include <linux/fs.h>
 > -#include <linux/sysfs.h>
 > -#include <linux/sched.h>
 > -#include <linux/kmod.h>
 > -#include <linux/workqueue.h>
 >  #include <linux/jiffies.h>
 >  #include <linux/kernel_stat.h>
 > -#include <linux/percpu.h>
 > -#include <linux/mutex.h>

This gave me rejects against Linus tree for some reason.
It's wrong anyway, as this file uses mutex's, and I'd rather
not have to rely on us pulling in mutex.h indirectly through
some other include file chain.

I fixed it up by hand.

		Dave

-- 
http://www.codemonkey.org.uk
