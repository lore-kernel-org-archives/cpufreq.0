From: Bruno Ducrot <ducrot@poupinou.org>
Subject: cleaning flags for mach-integrator
Date: Tue, 31 Aug 2004 10:49:05 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040831084905.GU29560@poupinou.org>
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
To: rmk@arm.linux.org.uk
Cc: cpufreq@www.linux.org.uk

Hi Russel,

When we are at cleaning stuff, does this patch look ok to you?

Of course, I can do something stupid here since I'm not an ARM expert.

Index: linux/arch/arm/mach-integrator/cpu.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-integrator/cpu.c,v
retrieving revision 1.10
diff -u -r1.10 cpu.c
--- linux/arch/arm/mach-integrator/cpu.c	26 Aug 2004 13:25:17 -0000	1.10
+++ linux/arch/arm/mach-integrator/cpu.c	31 Aug 2004 08:41:08 -0000
@@ -196,6 +196,7 @@
 }
 
 static struct cpufreq_driver integrator_driver = {
+	.flags		= CPUFREQ_STICKY,
 	.verify		= integrator_verify_policy,
 	.target		= integrator_set_target,
 	.get		= integrator_get,


-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
