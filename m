From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH 2/8 v2] acpi-cpufreq: Add quirk to disable _PSD usage on all AMD CPUs
Date: Mon, 17 Sep 2012 13:40:23 +0200
Message-ID: <201209171340.23801.trenn@suse.de>
References: <1346747289-8421-1-git-send-email-andre.przywara@amd.com> <CACJDEmrOoZ_azqTrtfoGC-O=H0V=AHy8VExoFYYPhbUUx+7UAg@mail.gmail.com> <5056D420.80808@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <5056D420.80808@amd.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Andre Przywara <andre.przywara@amd.com>
Cc: Konrad Rzeszutek Wilk <konrad@kernel.org>, Andreas Herrmann <andreas.herrmann3@amd.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garret <mjg@redhat.com>

On Monday, September 17, 2012 09:41:20 AM Andre Przywara wrote:
> On 09/15/2012 01:20 PM, Konrad Rzeszutek Wilk wrote:
> >
...
> This was to overcome some nasty interaction between the Windows 
> scheduler and their version of the ondemand governor.
Whoever is/was responsible for this, can you explain him/her that
this was a bad idea and why.

Is this part of a BKDG?
Can you point to a public spec and the exact wording of the
"Windows scheduler workaround" BIOS vendors shall do?

> +               pr_info_once(PFX "overriding BIOS provided _PSD data\n");
The message shows up on nearly every platform wether a _PSD
function exists or not. This is wrong.

If it's _PSD info that should get ignored/overwritten, this should
be done where _PSD is obtained:
processor_perflib.c

Are you sure that it will never make sense for AMD to make use of
_PSD tables?
If yes, then always ignoring might be an option.

If not, this might need a more specific check, e.g.:
   - Latest Windows version support called via OSI interface?
        Latest Windowses should/may not need this anymore?
   - Check for Desktop CPUs that are affected by the bad spec?

Hm, as powernow-k8 never made use of _PSD, ignoring it for
now sounds like a good thing to do. Still the ignoring should get
moved to processor_perflib.c, best with a pointer or at least
a comment that _PSD can be dangerous on AMD platforms. At some
day _PSD may make sense for AMD platforms as well?


    Thomas
