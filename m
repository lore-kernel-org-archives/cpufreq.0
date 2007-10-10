From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Don't take semaphore in cpufreq_quick_get()
Date: Tue, 9 Oct 2007 20:43:14 -0400
Message-ID: <20071010004314.GB22989@redhat.com>
References: <20071010001827.GA23762@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20071010001827.GA23762@wotan.suse.de>
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
To: Andi Kleen <ak@suse.de>
Cc: cpufreq@lists.linux.org.uk

On Wed, Oct 10, 2007 at 02:18:27AM +0200, Andi Kleen wrote:

 > I don't see any reason to take an expensive lock in cpufreq_quick_get()
 > Reading policy->cur is a single atomic operation and after
 > the lock is dropped again the state could change any time anyways.
 > 
 > So don't take the lock in the first place.
 > 
 > This also makes this function interrupt safe which is useful
 > for some code of mine.
 > 
 > Signed-off-by: Andi Kleen <ak@suse.de>
 > 
 > Index: linux/drivers/cpufreq/cpufreq.c
 > ===================================================================
 > --- linux.orig/drivers/cpufreq/cpufreq.c
 > +++ linux/drivers/cpufreq/cpufreq.c
 > @@ -1109,12 +1109,7 @@ unsigned int cpufreq_quick_get(unsigned 
 >  	unsigned int ret_freq = 0;
 >  
 >  	if (policy) {
 > -		if (unlikely(lock_policy_rwsem_read(cpu)))
 > -			return ret_freq;
 > -
 >  		ret_freq = policy->cur;
 > -
 > -		unlock_policy_rwsem_read(cpu);
 >  		cpufreq_cpu_put(policy);
 >  	}

I can't dispute this. It does look strange.
Even the initial implementation before the cpufreq-vs-hotplug-cpu
refactoring happened looked as odd for the same reasons you outline.

       if (policy) {
               down(&policy->lock);
               ret = policy->cur;
               up(&policy->lock);
               cpufreq_cpu_put(policy);
       }

This isn't really protecting anything, and we grab policy->cur
elsewhere without locking, so I'm inclined to merge this patch.

Venki, any comments ?

	Dave

-- 
http://www.codemonkey.org.uk
