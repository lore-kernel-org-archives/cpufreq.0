From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 0/8] acpi-cpufreq: Move modern AMD cpufreq support to acpi-cpufreq
Date: Sun, 5 Aug 2012 23:20:14 +0200
Message-ID: <201208052320.14712.rjw@sisk.pl>
References: <1343305724-2809-1-git-send-email-andre.przywara@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1343305724-2809-1-git-send-email-andre.przywara@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andre Przywara <andre.przywara@amd.com>, cpufreq@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Andreas Herrmann <andreas.herrmann3@amd.com>, Thomas Renninger <trenn@suse.de>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday, July 26, 2012, Andre Przywara wrote:
> The programming model for cpufreq on current AMD CPUs is almost identical
> to the one used on Intel and VIA hardware. This patchset merges support
> into acpi-cpufreq and removes it from powernow-k8.
> 
> This patchset is heavily based on Matthew Garrett's V4 from last July.
> The boosting part has been mostly reworked and documentation for it
> has been added. Also there was a need for (yet another) BIOS quirk
> on AMD desktop boards.
> 
> Signed-off-by: Andre Przywara <andre.przywara@amd.com>

Peter, any objection to this series?

Rafael
