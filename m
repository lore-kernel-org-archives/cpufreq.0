From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] fix userspace resume support [Was: Re: cpufreq doesn't keep
	over suspend/resume]
Date: Thu, 1 Jul 2004 10:36:41 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040701083641.GB8163@dominikbrodowski.de>
References: <20040614191225.GA1463@fog.sekrit.org>
	<20040614202539.GA10796@dominikbrodowski.de>
	<20040615013242.GA13338@fog.sekrit.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040615013242.GA13338@fog.sekrit.org>
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
To: davej@codemonkey.org.uk, Gerald Britton <gbritton@alum.mit.edu>
Cc: cpufreq@www.linux.org.uk

Fix resume support in the userspace cpufreq governor: we need to set the
CPU to the frequency last echo'ed by userspace into this governor's files.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

 drivers/cpufreq/cpufreq_userspace.c |   10 ++++++++++
 1 files changed, 10 insertions(+)

diff -ruN linux-original/drivers/cpufreq/cpufreq_userspace.c linux/drivers/cpufreq/cpufreq_userspace.c
--- linux-original/drivers/cpufreq/cpufreq_userspace.c	2004-07-01 10:09:24.912587904 +0200
+++ linux/drivers/cpufreq/cpufreq_userspace.c	2004-07-01 10:32:31.134850088 +0200
@@ -82,6 +82,13 @@
 {
         struct cpufreq_freqs *freq = data;
 
+	/* Don't update cur_freq if CPU is managed and we're
+	 * waking up: else we won't remember what frequency 
+	 * we need to set the CPU to.
+	 */
+	if (cpu_is_managed[freq->cpu] && (val == CPUFREQ_RESUMECHANGE))
+		return 0;
+
 	cpu_cur_freq[freq->cpu] = freq->new;
 
         return 0;
@@ -522,6 +529,9 @@
 		else if (policy->min > cpu_cur_freq[cpu])
 			__cpufreq_driver_target(&current_policy[cpu], policy->min, 
 			      CPUFREQ_RELATION_L);
+		else
+			__cpufreq_driver_target(&current_policy[cpu], cpu_cur_freq[cpu],
+			      CPUFREQ_RELATION_L);
 		memcpy (&current_policy[cpu], policy, sizeof(struct cpufreq_policy));
 		up(&userspace_sem);
 		break;
