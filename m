From: Andre Przywara <andre.przywara@amd.com>
Subject: Re: [PATCH 7/8] cpufreq: Remove support for hardware P-state chips
 from powernow-k8
Date: Mon, 20 Aug 2012 15:00:42 +0200
Message-ID: <503234FA.908@amd.com>
References: <1343305724-2809-1-git-send-email-andre.przywara@amd.com> <1343305724-2809-8-git-send-email-andre.przywara@amd.com> <201208052333.15608.rjw@sisk.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201208052333.15608.rjw@sisk.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Andreas Herrmann <andreas.herrmann3@amd.com>, Thomas Renninger <trenn@suse.de>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/05/2012 11:33 PM, Rafael J. Wysocki wrote:
> On Thursday, July 26, 2012, Andre Przywara wrote:
>> From: Matthew Garrett <mjg@redhat.com>
>>
>> These chips are now supported by acpi-cpufreq, so we can delete all the
>> code handling them.
>>
>> Signed-off-by: Matthew Garrett <mjg@redhat.com>
>> Signed-off-by: Andre Przywara <andre.przywara@amd.com>
>
> Would it be very wrong/confusing to keep that support in the powernow-k8
> driver for the time being, perhaps making it print a message that the ACPI
> driver is recommended for those chips?

Why would you like to do this? Are you concerned about regressions? Or 
do you just want to avoid the introduction of the doomed "cpb" feature 
in acpi-cpufreq?

I am not sure if keeping support in powernow-k8 would just make people 
use it still in the future. At least if it would just load easily as before.
One idea could be to keep the code around, but only load on family 10h 
if a force_fam10h or so command line option is provided. But again this 
could just push distributions to provide this option to avoid the 
transition.

One of my motivations was to keep only _one_ driver around, the code 
removal of the fam10h support from powernow-k8 supports this.

If you insist, I can keep the code in powernow-k8, but it probably 
wouldn't receive any support anymore and would increase confusion on the 
user side.

Thanks for the review,
Andre.

-- 
Andre Przywara
AMD-Operating System Research Center (OSRC), Dresden, Germany
