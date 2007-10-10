From: Andi Kleen <ak@suse.de>
Subject: [PATCH] Don't take semaphore in cpufreq_quick_get()
Date: Wed, 10 Oct 2007 02:18:27 +0200
Message-ID: <20071010001827.GA23762@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
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
To: davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk


I don't see any reason to take an expensive lock in cpufreq_quick_get()
Reading policy->cur is a single atomic operation and after
the lock is dropped again the state could change any time anyways.

So don't take the lock in the first place.

This also makes this function interrupt safe which is useful
for some code of mine.

Signed-off-by: Andi Kleen <ak@suse.de>

Index: linux/drivers/cpufreq/cpufreq.c
===================================================================
--- linux.orig/drivers/cpufreq/cpufreq.c
+++ linux/drivers/cpufreq/cpufreq.c
@@ -1109,12 +1109,7 @@ unsigned int cpufreq_quick_get(unsigned 
 	unsigned int ret_freq = 0;
 
 	if (policy) {
-		if (unlikely(lock_policy_rwsem_read(cpu)))
-			return ret_freq;
-
 		ret_freq = policy->cur;
-
-		unlock_policy_rwsem_read(cpu);
 		cpufreq_cpu_put(policy);
 	}
