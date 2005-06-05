From: Michal Schmidt <xschmi00@stud.feec.vutbr.cz>
Subject: Re: [PATCH 2.6.12-rc5] policy->lock in cpufreq_add_dev
Date: Sun, 05 Jun 2005 23:45:16 +0200
Message-ID: <42A3726C.9030407@stud.feec.vutbr.cz>
References: <429DE8E8.5030904@stud.feec.vutbr.cz>
	<20050605171100.GD12338@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------030804020407060205050909"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20050605171100.GD12338@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk, davej@codemonkey.org.uk

This is a multi-part message in MIME format.
--------------030804020407060205050909
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Dominik Brodowski wrote:
> Well, indeed it is not necessary to take the policy->lock, although it
> doesn't do any harm AFAICS. I added it to make sure that _all_ accesses to
> the data is protected by the lock, how serialized they may ever be..

I thought so. I understand it doesn't do any harm in standard kernel. It 
is perfectly valid to take the policy->lock there and the function is 
not performance critical at all, so we can afford that.
There's only an issue in combination with Ingo's realtime-preempt patch,
where every usage of init_MUTEX_LOCKED becomes suspicious. It often 
indicates that the code uses a mutex where it should use a completion 
instead. However, this is not the case with cpufreq, where policy->lock 
really acts as a mutex. So I looked into it and wasn't able to find the 
reason for the lock being taken in cpufreq_add_dev.

> Thanks,
> 	Dominik
> 
> PS: Always add Signed-off-by lines to your patches, please, as per
> Documentation/SubmittingPatches

Sorry, I forgot about that. Here it is again, with the sign-off.
I know it's not a bugfix, because the code works perfectly it the normal 
kernel (only realtime-preempt cares). It's just a minor cleanup. It 
would be nice if you applied it, but no problem if you don't:


It's unnecessary to take policy->lock in cpufreq_add_dev as the access 
to the policy object is guaranteed to be serialized there.

Signed-off-by: Michal Schmidt <xschmi00@stud.feec.vutbr.cz>

--------------030804020407060205050909
Content-Type: text/plain;
 name="cpufreq-unnecessary-lock.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cpufreq-unnecessary-lock.diff"

diff -Nurp -X linux/Documentation/dontdiff linux/drivers/cpufreq/cpufreq.c linux.mich/drivers/cpufreq/cpufreq.c
--- linux/drivers/cpufreq/cpufreq.c	2005-05-31 12:59:41.000000000 +0200
+++ linux.mich/drivers/cpufreq/cpufreq.c	2005-06-01 18:42:50.000000000 +0200
@@ -605,7 +605,7 @@ static int cpufreq_add_dev (struct sys_d
 	policy->cpu = cpu;
 	policy->cpus = cpumask_of_cpu(cpu);
 
-	init_MUTEX_LOCKED(&policy->lock);
+	init_MUTEX(&policy->lock);
 	init_completion(&policy->kobj_unregister);
 	INIT_WORK(&policy->update, handle_update, (void *)(long)cpu);
 
@@ -646,8 +646,7 @@ static int cpufreq_add_dev (struct sys_d
 	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 	policy->governor = NULL; /* to assure that the starting sequence is
 				  * run in cpufreq_set_policy */
-	up(&policy->lock);
-	
+
 	/* set default policy */
 	
 	ret = cpufreq_set_policy(&new_policy);

--------------030804020407060205050909
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------030804020407060205050909--

