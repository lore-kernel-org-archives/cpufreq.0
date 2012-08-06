From: Borislav Petkov <bp@amd64.org>
Subject: Re: [PATCH 0/8] acpi-cpufreq: Move modern AMD cpufreq support to
 acpi-cpufreq
Date: Mon, 6 Aug 2012 10:20:09 +0200
Message-ID: <20120806082009.GA24091@aftab.osrc.amd.com>
References: <1343305724-2809-1-git-send-email-andre.przywara@amd.com>
 <201208052320.14712.rjw@sisk.pl>
 <501F0422.2030308@zytor.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <501F0422.2030308@zytor.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Andre Przywara <andre.przywara@amd.com>, cpufreq@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Andreas Herrmann <andreas.herrmann3@amd.com>, Thomas Renninger <trenn@suse.de>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Aug 05, 2012 at 04:39:14PM -0700, H. Peter Anvin wrote:
> On 08/05/2012 02:20 PM, Rafael J. Wysocki wrote:
> >On Thursday, July 26, 2012, Andre Przywara wrote:
> >>The programming model for cpufreq on current AMD CPUs is almost identical
> >>to the one used on Intel and VIA hardware. This patchset merges support
> >>into acpi-cpufreq and removes it from powernow-k8.
> >>
> >>This patchset is heavily based on Matthew Garrett's V4 from last July.
> >>The boosting part has been mostly reworked and documentation for it
> >>has been added. Also there was a need for (yet another) BIOS quirk
> >>on AMD desktop boards.
> >>
> >>Signed-off-by: Andre Przywara <andre.przywara@amd.com>
> >
> >Peter, any objection to this series?
> >
> No.  It might be good for Borislav & Co to look it over, though, if
> they haven't already.

Yep, already done so.

Thanks.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
GM: Alberto Bozzo
Reg: Dornach, Landkreis Muenchen
HRB Nr. 43632 WEEE Registernr: 129 19551
