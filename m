From: Thomas Renninger <trenn@suse.de>
Subject: Re: FW: [PATCH 1/4] pass the cross to bench folder
Date: Fri, 27 May 2011 11:53:46 +0200
Message-ID: <201105271153.46959.trenn@suse.de>
References: <A809BCB44791BE4D97606D7DA1807F411127EF@039-SN1MPN1-002.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <A809BCB44791BE4D97606D7DA1807F411127EF@039-SN1MPN1-002.039d.mgd.msft.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Huang Hake-B20222 <B20222@freescale.com>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>, cpufreq@vger.kernel.org

Hi Huang,

On Wednesday, May 25, 2011 09:01:19 AM Huang Hake-B20222 wrote:
> Hi,
> 
> I see your cpupower project and want to port it to ARM, can I send patch
> to you, see below mail
Great.
Did you google my (private) email address?

Dominik has set up a git repo which is already synced against
linux-next and the stuff will (hopefully) show up in the mainline
kernel soon.
Best is you base patches against this kernel repo:
http://git.kernel.org/?p=linux/kernel/git/brodo/cpupowerutils.git;a=summary
The code is located in tools/power/cpupower
and send it to the cpufreq@vger.kernel.org list with Dominik in CC.

For architecture (ARM/ACPI/...) specific problems you may also
want add other Linux kernel lists
(http://vger.kernel.org/vger-lists.html) for broader review.
Should not be needed for these, just for info.

Please also add:
cpupower:
(upper case?) as prefix to the subject on cpupower related patches.

If you add me to CC (I won't be able to comment/review on these patches, 
though), please use trenn@suse.de.

Thanks,

    Thomas

