From: Nebojsa Trpkovic <trx.lists@gmail.com>
Subject: how to set ondemand governor
Date: Mon, 06 Aug 2007 22:19:39 +0200
Message-ID: <46B7825B.7090007@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:content-type:content-transfer-encoding;
	b=uTuT+SLRsE5H8EKeq8LbBaJJg92CaW1dGPTAiT83HsBAB1qb9FqjnxnBwTQ5rZ0xgmKg5+lpc6d806woZurnF/MMEB58bRBrs7uRSwaLJzKT5dN5s2zCsJQrNsHqbwoDYjHRu14foMgt/Eg8vhTfbQKk7qMVGVgl+6LYVHWmiCo=
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

I've got Core 2 Duo CPU and tried to set ondemand governor. result that
I've got shows that only one core is affected:

> titan old # echo -n "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
> titan old # cat /proc/cpuinfo
> processor       : 0
> vendor_id       : GenuineIntel
> cpu family      : 6
> model           : 15
> model name      : Intel(R) Core(TM)2 Duo CPU     E6550  @ 2.33GHz
> stepping        : 11
> cpu MHz         : 2000.000
> cache size      : 4096 KB
> physical id     : 0
> siblings        : 2
> core id         : 0
> cpu cores       : 2
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 10
> wp              : yes
> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall nx lm constant_tsc pni monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr lahf_lm
> bogomips        : 4669.25
> clflush size    : 64
> cache_alignment : 64
> address sizes   : 36 bits physical, 48 bits virtual
> power management:
> 
> processor       : 1
> vendor_id       : GenuineIntel
> cpu family      : 6
> model           : 15
> model name      : Intel(R) Core(TM)2 Duo CPU     E6550  @ 2.33GHz
> stepping        : 11
> cpu MHz         : 2333.000
> cache size      : 4096 KB
> physical id     : 0
> siblings        : 2
> core id         : 1
> cpu cores       : 2
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 10
> wp              : yes
> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall nx lm constant_tsc pni monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr lahf_lm
> bogomips        : 4666.81
> clflush size    : 64
> cache_alignment : 64
> address sizes   : 36 bits physical, 48 bits virtual
> power management:
> 
> titan old #                                    


does this mean that I should (and can) set different governors/variables
for different cores of my CPU ?
