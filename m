From: Serge Stroobandt <serge@stroobandt.com>
Subject: cpufreq regression + link to patch
Date: Mon, 21 May 2012 10:13:49 +0200
Message-ID: <4FB9F93D.3030103@stroobandt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=stroobandt.com; s=default;
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID; bh=t25n5zgymQiXiD//3Yp65pxmp8YTIGV/wuXiBNFJpHw=;
	b=AA80Jct3aDycdqApHU4e9UWHsHJdof4wxa9dNXnAsx/cQLiHczN/TX9pJD6srWqs1O3OxKQ91kGOa3FuxRG7g0ipl27Ff//zkwzP+jbARX7QAOaBUJpiEBcZWRJiJi+0;
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@vger.kernel.org

Hi, this is to report a cpufreq regression in kernel:
$ uname -r
3.2.0-2-amd64

The bug has been reported at least twice and a patch has been proposed:
http://permalink.gmane.org/gmane.linux.kernel.cpufreq/4190
http://permalink.gmane.org/gmane.linux.mandrake.bugs/143027

More information:
$ sudo cpufreq-info
cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
   no or unknown cpufreq driver is active on this CPU
   maximum transition latency: 4294.55 ms.
analyzing CPU 1:
   no or unknown cpufreq driver is active on this CPU
   maximum transition latency: 4294.55 ms.

$ sudo modprobe -l |grep cpufreq
kernel/drivers/cpufreq/cpufreq_stats.ko
kernel/drivers/cpufreq/cpufreq_powersave.ko
kernel/drivers/cpufreq/cpufreq_userspace.ko
kernel/drivers/cpufreq/cpufreq_conservative.ko
kernel/drivers/cpufreq/powernow-k8.ko
kernel/drivers/cpufreq/mperf.ko
kernel/drivers/cpufreq/acpi-cpufreq.ko
kernel/drivers/cpufreq/pcc-cpufreq.ko
kernel/drivers/cpufreq/speedstep-lib.ko
kernel/drivers/cpufreq/speedstep-centrino.ko
kernel/drivers/cpufreq/p4-clockmod.ko

$ cat /proc/cpuinfo
processor    : 0
vendor_id    : GenuineIntel
cpu family    : 15
model        : 6
model name    : Intel(R) Pentium(R) D CPU 3.00GHz
stepping    : 2
microcode    : 0xf
cpu MHz        : 2992.660
cache size    : 2048 KB
physical id    : 0
siblings    : 2
core id        : 0
cpu cores    : 2
apicid        : 0
initial apicid    : 0
fpu        : yes
fpu_exception    : yes
cpuid level    : 6
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx lm constant_tsc pebs bts nopl pni dtes64 monitor ds_cpl vmx cid cx16 
xtpr pdcm lahf_lm tpr_shadow
bogomips    : 5985.32
clflush size    : 64
cache_alignment    : 128
address sizes    : 36 bits physical, 48 bits virtual
power management:

processor    : 1
vendor_id    : GenuineIntel
cpu family    : 15
model        : 6
model name    : Intel(R) Pentium(R) D CPU 3.00GHz
stepping    : 2
microcode    : 0xf
cpu MHz        : 2992.660
cache size    : 2048 KB
physical id    : 0
siblings    : 2
core id        : 1
cpu cores    : 2
apicid        : 1
initial apicid    : 1
fpu        : yes
fpu_exception    : yes
cpuid level    : 6
wp        : yes
flags        : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca 
cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall 
nx lm constant_tsc pebs bts nopl pni dtes64 monitor ds_cpl vmx cid cx16 
xtpr pdcm lahf_lm tpr_shadow
bogomips    : 5985.83
clflush size    : 64
cache_alignment    : 128
address sizes    : 36 bits physical, 48 bits virtual
power management:

motherboard: GA-8i945PM(-RH)
