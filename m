From: Andre Przywara <andre.przywara@amd.com>
Subject: Re: [PATCH 0/8 v2] acpi-cpufreq: Move modern AMD cpufreq support
 to acpi-cpufreq
Date: Wed, 5 Sep 2012 17:05:37 +0200
Message-ID: <50476A41.30908@amd.com>
References: <1346747289-8421-1-git-send-email-andre.przywara@amd.com> <201209051546.22590.rjw@sisk.pl> <201209051625.41769.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201209051625.41769.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Renninger <trenn@suse.de>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Matthew Garret <mjg@redhat.com>, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Herrmann <andreas.herrmann3@amd.com>

On 09/05/2012 04:25 PM, Thomas Renninger wrote:
> On Wednesday, September 05, 2012 03:46:22 PM Rafael J. Wysocki wrote:
>> On Tuesday, September 04, 2012, Andre Przywara wrote:
>>> Hi,
>>>
>>
>> I have applied the whole series to the linux-next branch of the linux-pm.git

Thanks!

>> tree, but I'm quite unsure about [7/8].  Is it really necessary?  I mean, since
>> we want users to switch to a different driver anyway, which already has a knob
>> providing the functionality in question, what's the point really?
>
> Afaik this was mostly for compiler people or other developers doing
> benchmarks to be able to avoid fluctating numbers caused by turbo/boost
> mode.
>
> I don't know whether it's used by any userspace tool.

Well, at least we use it here in quite some scripts, both for testing 
and for benchmarking.
As this has been in for 2.5 year by now, I'd like to keep it for one or 
two more major releases and then remove it.

> If, it would certainly
> be an AMD specific tool for developers. If you (AMD) know a userspace tool
> out there it may make sense to keep it the one or other kernel round,
> otherwise I guess it can simply be deleted.
>
> I will add the functionality (to enable/disable turbo/boost mode)
> to cpupower userspace tool as soon as this is in.
> Shouldn't be much more than a -t option and a
> one liner to read out or set another cpufreq sysfs file.

Thanks, that would be nice.

Regards,
Andre.

-- 
Andre Przywara
AMD-Operating System Research Center (OSRC), Dresden, Germany

