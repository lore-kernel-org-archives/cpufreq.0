From: Michal Schmidt <xschmi00@stud.feec.vutbr.cz>
Subject: [PATCH 2.6.12-rc5] policy->lock in cpufreq_add_dev
Date: Wed, 01 Jun 2005 18:57:12 +0200
Message-ID: <429DE8E8.5030904@stud.feec.vutbr.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060506080909030503010209"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk
Cc: davej@codemonkey.org.uk, linux@brodo.de

This is a multi-part message in MIME format.
--------------060506080909030503010209
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
I think that it's not necessary to take the policy->lock in cpufreq_add_dev.
Am I missing something? What is the lock supposed to protect from?

Michal


--------------060506080909030503010209
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

--------------060506080909030503010209
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------060506080909030503010209--

