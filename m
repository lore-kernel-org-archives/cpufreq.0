From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Deadlock occurs in cpufreq_userspace.c
Date: Mon, 9 Feb 2004 11:46:18 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040209104618.GA21472@dominikbrodowski.de>
References: <571ACEFD467F7749BC50E0A98C17CDD8D5FED0@PDSMSX403.ccr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <571ACEFD467F7749BC50E0A98C17CDD8D5FED0@PDSMSX403.ccr.corp.intel.com>
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
To: "Li, Shaohua" <shaohua.li@intel.com>, davej@redhat.com
Cc: cpufreq@www.linux.org.uk

Hi,

How about this patch? 
->governor() shouldn't fail...

	Dominik

On Wed, Feb 04, 2004 at 11:11:13AM +0800, Li, Shaohua wrote:
> Hi,
> 
>    Consider below 2 paths:
> 
>    1.cpufreq_set (lock userspace_sem) ->cpufreq_driver_target(lock
> policy->lock)
> 
>    2.cpufreq_set_policy(lock policy->lock)->
> __cpufreq_governor->cpufreq_governor_userspace (lock userspace_sem)
> 
> then deadlock occurs. Attached is the patch against 2.6. Please review
> it.
> 
>  
> 
> thanks,
> 
> David



A deadlock possibility was noted in the cpufreq_userspace governor.

 drivers/cpufreq/cpufreq_userspace.c |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff -ruN linux-original/drivers/cpufreq/cpufreq_userspace.c linux/drivers/cpufreq/cpufreq_userspace.c
--- linux-original/drivers/cpufreq/cpufreq_userspace.c	2004-02-09 09:18:48.000000000 +0100
+++ linux/drivers/cpufreq/cpufreq_userspace.c	2004-02-09 11:39:56.819931256 +0100
@@ -2,7 +2,7 @@
  *  linux/drivers/cpufreq/cpufreq_userspace.c
  *
  *  Copyright (C)  2001 Russell King
- *            (C)  2002 - 2003 Dominik Brodowski <linux@brodo.de>
+ *            (C)  2002 - 2004 Dominik Brodowski <linux@brodo.de>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -112,7 +112,14 @@
 	if (freq > cpu_max_freq[cpu])
 		freq = cpu_max_freq[cpu];
 
-	ret = cpufreq_driver_target(&current_policy[cpu], freq, 
+	/*
+	 * We're safe from concurrent calls to ->target() here
+	 * as we hold the userspace_sem lock. If we were calling
+	 * cpufreq_driver_target, a deadlock situation might occur:
+	 * A: cpufreq_set (lock userspace_sem) -> cpufreq_driver_target(lock policy->lock)
+	 * B: cpufreq_set_policy(lock policy->lock) -> __cpufreq_governor -> cpufreq_governor_userspace (lock userspace_sem)
+	 */
+	ret = __cpufreq_driver_target(&current_policy[cpu], freq, 
 	      CPUFREQ_RELATION_L);
 
  err:
