From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH 7/8] cpufreq: Remove support for hardware P-state chips from powernow-k8
Date: Wed, 22 Aug 2012 03:00:02 +0200
Message-ID: <201208220300.03512.trenn@suse.de>
References: <1343305724-2809-1-git-send-email-andre.przywara@amd.com> <503234FA.908@amd.com> <201208202249.16445.rjw@sisk.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201208202249.16445.rjw@sisk.pl>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Andre Przywara <andre.przywara@amd.com>, cpufreq@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Andreas Herrmann <andreas.herrmann3@amd.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Monday 20 August 2012 22:49:16 Rafael J. Wysocki wrote:
> On Monday, August 20, 2012, Andre Przywara wrote:
> > On 08/05/2012 11:33 PM, Rafael J. Wysocki wrote:
> > > On Thursday, July 26, 2012, Andre Przywara wrote:
...
> > 
> > If you insist, I can keep the code in powernow-k8, but it probably 
> > wouldn't receive any support anymore and would increase confusion on the 
> > user side.
> 
> I'm not afraid of that.  And as I said, you can just add info messages to
> powernow-k8 saying that the feature is deprecated and will be removed in the
> future and _then_ you actually _can_ remove it in the future (say, 2-3 major
> kernel releasew from now).

Full code duplication in powernow-k8 and acpi-cpufreq does not make sense
to me.
You would need extra logic that only the first is successfully loaded etc.
IMO this has more risk of introducing new bugs than any good.

A message like that might be useful though:
if (boot_cpu_has(X86_FEATURE_HW_PSTATE))
{
     printk("powernowk8 does not serve MSR based frequency switching anymore, use acpi-cpufreq instead\n");
     return -1;
}

This would show people with init scripts that try to load cpufreq drivers
manually that they are not needed anymore. acpi-cpufreq should have been
loaded automatically already and cpufreq should be active.

    Thomas
