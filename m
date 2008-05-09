From: CHIKAMA masaki <masaki.chikama@gmail.com>
Subject: [PATCH] cpufreq: Fix null object access on Transmeta CPU
Date: Fri, 9 May 2008 18:32:24 +0900
Message-ID: <20080509183224.0c937c1c.masaki.chikama@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: akpm@linux-foundation.org, cpufreq@www.linux.org.uk, davej@codemonkey.org.uk


If cpu specific cpufreq driver(i.e. longrun) has "setpolicy" function,
governor object isn't set into cpufreq_policy object at 
"__cpufreq_set_policy" function in driver/cpufreq/cpufreq.c .

This cause null object access at "store_scaling_setspeed" and
"show_scaling_setspeed" function in driver/cpufreq/cpufreq.c 
when reading or writing through /sys interface
(ex. cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed)

Here is a proposed patch to check governor against 2.6.25.

Signed-off-by: CHIKAMA Masaki <masaki.chikama@gmail.com>

---

--- drivers/cpufreq/cpufreq.c.org	2008-05-01 13:55:19.000000000 +0900
+++ drivers/cpufreq/cpufreq.c	2008-05-01 13:59:34.000000000 +0900
@@ -607,7 +607,7 @@ static ssize_t store_scaling_setspeed(st
 	unsigned int freq = 0;
 	unsigned int ret;
 
-	if (!policy->governor->store_setspeed)
+	if (!policy->governor || !policy->governor->store_setspeed)
 		return -EINVAL;
 
 	ret = sscanf(buf, "%u", &freq);
@@ -621,7 +621,7 @@ static ssize_t store_scaling_setspeed(st
 
 static ssize_t show_scaling_setspeed(struct cpufreq_policy *policy, char *buf)
 {
-	if (!policy->governor->show_setspeed)
+	if (!policy->governor || !policy->governor->show_setspeed)
 		return sprintf(buf, "<unsupported>\n");
 
 	return policy->governor->show_setspeed(policy, buf);
