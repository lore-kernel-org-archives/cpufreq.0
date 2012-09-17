From: Andre Przywara <andre.przywara@amd.com>
Subject: Re: [PATCH 2/8 v2] acpi-cpufreq: Add quirk to disable _PSD usage
 on all AMD CPUs
Date: Mon, 17 Sep 2012 09:41:20 +0200
Message-ID: <5056D420.80808@amd.com>
References: <1346747289-8421-1-git-send-email-andre.przywara@amd.com> <1346747289-8421-3-git-send-email-andre.przywara@amd.com> <CACJDEmrOoZ_azqTrtfoGC-O=H0V=AHy8VExoFYYPhbUUx+7UAg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CACJDEmrOoZ_azqTrtfoGC-O=H0V=AHy8VExoFYYPhbUUx+7UAg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Konrad Rzeszutek Wilk <konrad@kernel.org>
Cc: Andreas Herrmann <andreas.herrmann3@amd.com>, Thomas Renninger <trenn@suse.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garret <mjg@redhat.com>

On 09/15/2012 01:20 PM, Konrad Rzeszutek Wilk wrote:
>
> On Sep 4, 2012 4:26 AM, "Andre Przywara" <andre.przywara@amd.com
> <mailto:andre.przywara@amd.com>> wrote:
>  >
>  > To workaround some Windows specific behavior, the ACPI _PSD table
>  > on AMD desktop boards advertises all cores as dependent, meaning
>  > that they all can only use the same P-state. acpi-cpufreq strictly
>  > obeys this description, instantiating one CPU only and symlinking
>  > the others. But the hardware can have distinct frequencies for each
>  > core and powernow-k8 did it that way.
>  > So, in order to use the hardware to its full potential and keep the
>  > original powernow-k8 behavior, lets override the _PSD table setting
>  > on AMD hardware.
>
> Can you tell on which motherboards this different freq on cores can be
> exposed?

Actually I think the motherboard is not the limiting factor here.
Per-core P-states are possible on AMD Family 10h and greater CPUs, so 
Phenoms/Barcelona and beyond. You may need an AM2+/AM3 board, though. 
Fam10h CPUs run in some older AM2-only boards, but the power-management 
capabilities may be limited here. This definitely applies to the voltage 
(single power plane only), but the older BIOS on these boards may limit 
the frequency switching also.

The actual reason for this patch is the (Fam10h) BKDG [1] recommendation 
in chapter 2.4.2.13.4 _PSD (P-State Dependency). There advertising only 
one possible P-state per package is recommended - for desktop CPUs 
(which are supposed to run Windows ;-)
This was to overcome some nasty interaction between the Windows 
scheduler and their version of the ondemand governor.

Regards,
Andre.

[1] http://support.amd.com/us/Processor_TechDocs/31116.pdf

-- 
Andre Przywara
AMD-Operating System Research Center (OSRC), Dresden, Germany

