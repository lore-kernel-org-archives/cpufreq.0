From: Mattia Dongili <malattia@linux.it>
Subject: Re: 2.6.19-rc5-mm2
Date: Wed, 15 Nov 2006 18:46:41 +0100
Message-ID: <20061115174641.GA2514@inferi.kami.home>
References: <EB12A50964762B4D8111D55B764A8454E4109A@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030756AbWKORrj@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <EB12A50964762B4D8111D55B764A8454E4109A@scsmsx413.amr.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: ego@in.ibm.com, Reuben Farrelly <reuben-linuxkernel@reub.net>, Andrew Morton <akpm@osdl.org>, davej@redhat.com, linux-kernel@vger.kernel.org, CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, Denis Sadykov <denis.m.sadykov@intel.com>

On Wed, Nov 15, 2006 at 06:09:47AM -0800, Pallipadi, Venkatesh wrote:
[...]
> >data->cpu_feature == ACPI_ADR_SPACE_FIXED_HARDWARE.
> 
> Yes. Patch from Mattia is indeed required for acpi-cpufreq. 
> Mattia: Can you please send the patch towards Andrew (With signed off
> etc) for inclusion.

Venki, I'm a little worried about the switch/case in question (line
702): the data->cpu_feature is set either to SYSTEM_IO_CAPABLE or
SYSTEM_INTEL_MSR_CAPABLE just a few lines above so it seems the switch
variable is wrong and none of the 2 cases will ever get a chance to
execute.

Unfortunately I don't have enough knowledge to tell if it's simply
necessary to fix the switch variable as 

-       switch (data->cpu_feature) {
+       switch (perf->control_register.space_id) {
        case ACPI_ADR_SPACE_SYSTEM_IO:

or if change it more dramatically like:

diff --git a/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c b/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
index 18f4715..428ac5b 100644
--- a/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ b/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -699,18 +699,8 @@ static int acpi_cpufreq_cpu_init(struct
 	if (result)
 		goto err_freqfree;
 
-	switch (data->cpu_feature) {
-	case ACPI_ADR_SPACE_SYSTEM_IO:
-		/* Current speed is unknown and not detectable by IO port */
-		policy->cur = acpi_cpufreq_guess_freq(data, policy->cpu);
-		break;
-	case ACPI_ADR_SPACE_FIXED_HARDWARE:
-		acpi_cpufreq_driver.get = get_cur_freq_on_cpu;
-		get_cur_freq_on_cpu(cpu);
-		break;
-	default:
-		break;
-	}
+	acpi_cpufreq_driver.get = get_cur_freq_on_cpu;
+	policy->cur = get_cur_freq_on_cpu(cpu);
 
 	/* notify BIOS that we exist */
 	acpi_processor_notify_smm(THIS_MODULE);


Thoughts?
-- 
mattia
:wq!
