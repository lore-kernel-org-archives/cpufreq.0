From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 0/8 v2] acpi-cpufreq: Move modern AMD cpufreq support to acpi-cpufreq
Date: Wed, 5 Sep 2012 15:46:22 +0200
Message-ID: <201209051546.22590.rjw@sisk.pl>
References: <1346747289-8421-1-git-send-email-andre.przywara@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1346747289-8421-1-git-send-email-andre.przywara@amd.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Andre Przywara <andre.przywara@amd.com>
Cc: Thomas Renninger <trenn@suse.de>, Matthew Garret <mjg@redhat.com>, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Herrmann <andreas.herrmann3@amd.com>

On Tuesday, September 04, 2012, Andre Przywara wrote:
> Hi,
> 
> now the second, revised version of the patch set. I now tested loading
> both drivers after each other in several combinations, after two bug
> fixes this now works as expected.
> I added a patch to move messages from powernow-k8 after the initialization
> phase, so it remains silent if driver loading fails.
> 
> I also rearranged the patches so that the powernow-k8 feature removal patch is
> now the last one and is somewhat optional. I still prefer to have it in,
> but it can be dropped if needed. Then powernow-k8 will still support modern
> AMD CPUs, but will emit a warning message.
> 
> Regards,
> Andre
> 
> Changes from v1:
> * added hints to Kconfig about CPU support
> * merge documentation from separate patch into the feature patch
> * add deprecation warning
> * prefix acpi-cpufreq warning messages with module name
> * bugfix: avoid boost init it driver registration failed
> * bugfix: fix module redirect request call (was not reached before)

I have applied the whole series to the linux-next branch of the linux-pm.git
tree, but I'm quite unsure about [7/8].  Is it really necessary?  I mean, since
we want users to switch to a different driver anyway, which already has a knob
providing the functionality in question, what's the point really?

Rafael
