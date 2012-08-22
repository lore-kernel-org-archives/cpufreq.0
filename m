From: Andre Przywara <andre.przywara@amd.com>
Subject: Re: [PATCH 7/8] cpufreq: Remove support for hardware P-state chips
 from powernow-k8
Date: Wed, 22 Aug 2012 15:39:40 +0200
Message-ID: <5034E11C.1010006@amd.com>
References: <1343305724-2809-1-git-send-email-andre.przywara@amd.com> <503234FA.908@amd.com> <201208202249.16445.rjw@sisk.pl> <201208220300.03512.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201208220300.03512.trenn@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Renninger <trenn@suse.de>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Andreas Herrmann <andreas.herrmann3@amd.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/22/2012 03:00 AM, Thomas Renninger wrote:
> On Monday 20 August 2012 22:49:16 Rafael J. Wysocki wrote:
>> On Monday, August 20, 2012, Andre Przywara wrote:
>>> On 08/05/2012 11:33 PM, Rafael J. Wysocki wrote:
>>>> On Thursday, July 26, 2012, Andre Przywara wrote:
> ...
>>>
>>> If you insist, I can keep the code in powernow-k8, but it probably
>>> wouldn't receive any support anymore and would increase confusion on the
>>> user side.
>>
>> I'm not afraid of that.  And as I said, you can just add info messages to
>> powernow-k8 saying that the feature is deprecated and will be removed in the
>> future and _then_ you actually _can_ remove it in the future (say, 2-3 major
>> kernel releasew from now).
>
> Full code duplication in powernow-k8 and acpi-cpufreq does not make sense
> to me.
> You would need extra logic that only the first is successfully loaded etc.
> IMO this has more risk of introducing new bugs than any good.
> A message like that might be useful though:
> if (boot_cpu_has(X86_FEATURE_HW_PSTATE))
> {
>       printk("powernowk8 does not serve MSR based frequency switching anymore, use acpi-cpufreq instead\n");
>       return -1;
> }

Matthew had something even better, that is patch 3/8:
+               if (static_cpu_has(X86_FEATURE_HW_PSTATE))
+			request_module("acpi_cpufreq");

So if someone tries to load powernow-k8 on a recent CPU, it will 
automatically load acpi-cpufreq instead.
I just realized that this doesn't work as expected, because powernow-k8 
bails out early due to only family 0xf being in the matching CPUID 
family list. Will fix this.

I will do some tests now to check our options:
1. A combination of Matthew's and Thomas' ideas: if powernow-k8 is 
loaded on newer CPUs, request acpi-cpufreq to load _plus_ write a 
warning that powernow-k8 is obsolete for this hardware. Don't load 
powernow-k8 (which has support removed anyway). My favorite.

2. Add code (probably to the generic cpufreq framework) to avoid loading 
two drivers. Print a warning if tried anyways. Leave h/w P-state support 
in powernow-k8. It seems like that acpi-cpufreq takes precedence over 
powernow-k8 in distribution's module load list, so this should work as 
expected even with keeping the support in powernow-k8 (as a fallback in 
case of trouble).

Regards,
Andre.

> This would show people with init scripts that try to load cpufreq drivers
> manually that they are not needed anymore. acpi-cpufreq should have been
> loaded automatically already and cpufreq should be active.
>
>      Thomas
>



-- 
Andre Przywara
AMD-Operating System Research Center (OSRC), Dresden, Germany
