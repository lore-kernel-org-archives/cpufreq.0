From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] fix speedstep-centrino latency
Date: Mon, 10 May 2004 14:11:28 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040510121128.GA16913@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
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
To: davej@redhat.com, cpufreq@www.linux.org.uk

Latency is in nanoseconds -- speedstep-centrino got it wrong

 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-05-10 09:19:19.080481464 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-05-10 09:19:30.106805208 +0200
@@ -431,7 +431,7 @@
 	freq = get_cur_freq(0);
 
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency = 10; /* 10uS transition latency */
+	policy->cpuinfo.transition_latency = 10000; /* 10uS transition latency */
 	policy->cur = freq;
 
 	dprintk(KERN_INFO PFX "centrino_cpu_init: policy=%d cur=%dkHz\n",
