From: Dominik Brodowski <linux@brodo.de>
Subject: Re: Fw: Re: [OOPS] [2.6.0-test5-bk8] cpufreq and sysfs problem...
Date: Fri, 3 Oct 2003 19:29:56 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031003172956.GB4050@brodo.de>
References: <20030924153746.3b0f6493.akpm@osdl.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030924153746.3b0f6493.akpm@osdl.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>, davej@codemonkey.org.uk
Cc: Ashley Pittman <ashley@quadrics.com>, cpufreq@www.linux.org.uk

Thanks for noticing this. Attached patch [for 2.6.0-test6-bk] should fix it.

	Dominik

diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2003-10-02 17:36:42.000000000 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2003-10-03 19:09:45.336175240 +0200
@@ -449,6 +449,9 @@
 	if (!kobject_get(&data->kobj))
 		return -EFAULT;
 
+	if (cpufreq_driver->target)
+		__cpufreq_governor(data, CPUFREQ_GOV_STOP);
+
 	kobject_unregister(&data->kobj);
 
 	kobject_put(&data->kobj);
@@ -459,9 +462,6 @@
 	 */
 	wait_for_completion(&data->kobj_unregister);
 
-	if (cpufreq_driver->target)
-		__cpufreq_governor(data, CPUFREQ_GOV_STOP);
-
 	if (cpufreq_driver->exit)
 		cpufreq_driver->exit(data);
