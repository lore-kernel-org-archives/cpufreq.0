From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: Re: 2.6.17 -> 2.6.18 regression: cpufreq broken since 2.6.18-rc1
 on	pentium4
Date: Sun, 30 Jul 2006 22:07:18 +0400
Message-ID: <44CCF556.2060505@linux.intel.com>
References: <20060730120844.GA18293@outpost.ds9a.nl>	<20060730160738.GB13377@irc.pl> <20060730165137.GA26511@outpost.ds9a.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932400AbWG3SH1@vger.kernel.org>
In-Reply-To: <20060730165137.GA26511@outpost.ds9a.nl>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: bert hubert <bert.hubert@netherlabs.nl>, linux-kernel@vger.kernel.org, zwane@arm.linux.org.uk, davej@redhat.com, venkatesh.pallipadi@intel.com, tony@atomide.com, akpm@osdl.org, cpufreq@lists.linux.org.uk

Do I understand your logs right and acpi-cpufreq is already loaded and works on your processor?
Do you have any info in /sys/devices/system/cpu/cpu0/cpufreq ?
Why do you want to load p4-clockmod over it? It does not save you any power, just limits performance.

Regards,
	Alex.

bert hubert wrote:
>>   I have similar problem with cpufreq-nforce2 -- http://lkml.org/lkml/2006/7/7/234
>>   I haven't do a git-bisect yet.
> 
> To recap, cpufreq died for at least two people (Tomasz Torcz and me) between
> 2.6.17 and 2.6.18-rc1. I've cc'd everybody who touched cpufreq according to
> the shortlog.
> 
> Abundant details are in:
> 
> http://lkml.org/lkml/2006/7/30/87
> 
> New information is that I've narrowed it down from between 2.6.16.9 and
> 2.6.18-rc1 to between 2.6.17.7 (which works) and 2.6.18-rc1 (which doesn't).
> 
> The problem exists both with cpufreq as modules and staticly, and both with
> P4 and nforce2.
> 
> Please let me know how I can help you solve this problem. I'll try a git
> bisect but a lot of the cpufreq changes appear to be interrelated, so I'm
> unsure if it will work.
> 
> Thanks!
> 
