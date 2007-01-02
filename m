From: Guillaume Chazarain <guichaz@yahoo.fr>
Subject: [PATCH] Fix /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
 with acpi-cpufreq and ondemand
Date: Tue, 02 Jan 2007 16:41:51 +0100
Message-ID: <459A7D3F.60309@yahoo.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040101090207060600050402"
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: Denis Sadykov <denis.m.sadykov@intel.com>, Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.
--------------040101090207060600050402
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

This is 2.6.20 material I think.

-- 
Guillaume


--------------040101090207060600050402
Content-Type: text/plain;
 name="cpufreq-fix-acpi-ondemand-scaling_cur_freq"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="cpufreq-fix-acpi-ondemand-scaling_cur_freq"

As of linux-2.6.20-rc2 using acpi-cpufreq and ondemand on my Pentium M
(Asus V6VA laptop) seems broken.
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq contains most of
the time 1, sometimes the actual frequency or (rarely) some random value.

The problem seems to come from
http://www.kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=7650b281b091f39f5e97f13b45ab3813b1526b65

The attached patch fixes the problem for me. 

Signed-off-by: Guillaume Chazarain <guichaz@yahoo.fr>
---

diff -r 5b8ceb2c0e06 arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
--- a/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	Mon Jan 01 13:10:08 2007 +0100
+++ b/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	Mon Jan 01 16:23:04 2007 +0100
@@ -440,7 +440,7 @@ static int acpi_cpufreq_target(struct cp
 		cpu_set(policy->cpu, cmd.mask);
 
 	freqs.old = data->freq_table[perf->state].frequency;
-	freqs.new = data->freq_table[next_perf_state].frequency;
+	freqs.new = data->freq_table[next_state].frequency;
 	for_each_cpu_mask(i, cmd.mask) {
 		freqs.cpu = i;
 		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);

--------------040101090207060600050402
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------040101090207060600050402--

