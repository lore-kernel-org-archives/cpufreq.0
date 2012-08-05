From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 0/8] acpi-cpufreq: Move modern AMD cpufreq support to
 acpi-cpufreq
Date: Sun, 05 Aug 2012 16:39:14 -0700
Message-ID: <501F0422.2030308@zytor.com>
References: <1343305724-2809-1-git-send-email-andre.przywara@amd.com> <201208052320.14712.rjw@sisk.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201208052320.14712.rjw@sisk.pl>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Andre Przywara <andre.przywara@amd.com>, cpufreq@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Andreas Herrmann <andreas.herrmann3@amd.com>, Thomas Renninger <trenn@suse.de>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@amd64.org>

On 08/05/2012 02:20 PM, Rafael J. Wysocki wrote:
> On Thursday, July 26, 2012, Andre Przywara wrote:
>> The programming model for cpufreq on current AMD CPUs is almost identical
>> to the one used on Intel and VIA hardware. This patchset merges support
>> into acpi-cpufreq and removes it from powernow-k8.
>>
>> This patchset is heavily based on Matthew Garrett's V4 from last July.
>> The boosting part has been mostly reworked and documentation for it
>> has been added. Also there was a need for (yet another) BIOS quirk
>> on AMD desktop boards.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@amd.com>
>
> Peter, any objection to this series?
>

No.  It might be good for Borislav & Co to look it over, though, if they 
haven't already.

	-hpa


-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

