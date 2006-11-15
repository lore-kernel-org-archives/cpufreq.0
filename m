From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: 2.6.19-rc5-mm2
Date: Wed, 15 Nov 2006 06:09:47 -0800
Message-ID: <EB12A50964762B4D8111D55B764A8454E4109A@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030465AbWKOOJw@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ego@in.ibm.com, Reuben Farrelly <reuben-linuxkernel@reub.net>, Andrew Morton <akpm@osdl.org>, davej@redhat.com, linux-kernel@vger.kernel.org, CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, Mattia Dongili <malattia@linux.it>

 

>-----Original Message-----
>From: Gautham R Shenoy [mailto:ego@in.ibm.com] 
>Sent: Wednesday, November 15, 2006 2:34 AM
>To: Gautham R Shenoy; Reuben Farrelly; Andrew Morton; 
>davej@redhat.com; linux-kernel@vger.kernel.org; Pallipadi, 
>Venkatesh; CPUFreq Mailing List
>Subject: Re: 2.6.19-rc5-mm2
>
>Hi,
>
>On Tue, Nov 14, 2006 at 09:58:29PM +0100, Mattia Dongili wrote:
>> 
>> maybe this helps? mostly guessing here, but when cpufreq_userspace is
>> the default governor we may hit this path and leave policy->cur
>> unset.
>
>I doubt if that's causing the problem. My reasons are:
>
>- Reuben's config shows his system to be a x64_64. So if I am not
>  mistaken, the correct file look for would be 
>  arch/ia64/kernel/cpufreq/acpi-cpufreq.c.

ia64 and x86_64 are different!
X86_64 shares acpi-cpufreq.c in arch/i386/kernel/cpu/cpufreq. So, that
is the file that can be causing problems here.

>- The fix provided by you deals with the state of a 
>  driver(hardware) specific variable data->cpu_feature while the
>  governors like userspace/performance/powersave/ondemand are 
>  driver(hardware) independent.
>
>Nevertheless, it could be a valid fix for i386 acpi_cpufreq considering
>that policy->cur is not being initialized if 
>data->cpu_feature == ACPI_ADR_SPACE_FIXED_HARDWARE.

Yes. Patch from Mattia is indeed required for acpi-cpufreq. 
Mattia: Can you please send the patch towards Andrew (With signed off
etc) for inclusion.

Reuben: Can you please enable CPU_FREQ_DEBUG in your config and boot
with "cpufreq.debug=7" boot parameter and send me the log. That will
give some more debug information that should help to root cause this
faster.

Thanks,
Venki
