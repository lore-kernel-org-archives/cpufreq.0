From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH 2.6.19-rc5-mm2] cpufreq: set policy->curfreq on initialization
Date: Fri, 17 Nov 2006 06:01:45 -0800
Message-ID: <EB12A50964762B4D8111D55B764A8454E7610F@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755110AbWKQOBs@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mattia Dongili <malattia@linux.it>, ego@in.ibm.com, Reuben Farrelly <reuben-linuxkernel@reub.net>, Andrew Morton <akpm@osdl.org>, davej@redhat.com, linux-kernel@vger.kernel.org, CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, "Sadykov, Denis M" <denis.m.sadykov@intel.com>


Acked.
Andrew: Please include this patch in mm.

Thanks,
Venki 

>-----Original Message-----
>From: Mattia Dongili [mailto:malattia@linux.it] 
>Sent: Wednesday, November 15, 2006 11:05 AM
>To: Pallipadi, Venkatesh; ego@in.ibm.com; Reuben Farrelly; 
>Andrew Morton; davej@redhat.com; linux-kernel@vger.kernel.org; 
>CPUFreq Mailing List; Sadykov, Denis M
>Subject: [PATCH 2.6.19-rc5-mm2] cpufreq: set policy->curfreq 
>on initialization
>
>
>Check the correct variable and set policy->cur upon acpi-cpufreq
>initialization to allow the userspace governor to be used as default.
>
>Signed-off-by: Mattia Dongili <malattia@linux.it>
>
>---
>
>Reuben, could you also try if this patch fixes the BUG()?
>Thanks
>
>diff --git a/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c 
>b/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
>index 18f4715..a630f94 100644
>--- a/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
>+++ b/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
>@@ -699,14 +699,14 @@ static int acpi_cpufreq_cpu_init(struct
> 	if (result)
> 		goto err_freqfree;
> 
>-	switch (data->cpu_feature) {
>+	switch (perf->control_register.space_id) {
> 	case ACPI_ADR_SPACE_SYSTEM_IO:
> 		/* Current speed is unknown and not detectable 
>by IO port */
> 		policy->cur = acpi_cpufreq_guess_freq(data, 
>policy->cpu);
> 		break;
> 	case ACPI_ADR_SPACE_FIXED_HARDWARE:
> 		acpi_cpufreq_driver.get = get_cur_freq_on_cpu;
>-		get_cur_freq_on_cpu(cpu);
>+		policy->cur = get_cur_freq_on_cpu(cpu);
> 		break;
> 	default:
> 		break;
>
