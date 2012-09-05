From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH 0/8 v2] acpi-cpufreq: Move modern AMD cpufreq support to acpi-cpufreq
Date: Wed, 5 Sep 2012 16:25:41 +0200
Message-ID: <201209051625.41769.trenn@suse.de>
References: <1346747289-8421-1-git-send-email-andre.przywara@amd.com> <201209051546.22590.rjw@sisk.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201209051546.22590.rjw@sisk.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Andre Przywara <andre.przywara@amd.com>, Matthew Garret <mjg@redhat.com>, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Herrmann <andreas.herrmann3@amd.com>

On Wednesday, September 05, 2012 03:46:22 PM Rafael J. Wysocki wrote:
> On Tuesday, September 04, 2012, Andre Przywara wrote:
> > Hi,
> > 
> > now the second, revised version of the patch set. I now tested loading
> > both drivers after each other in several combinations, after two bug
> > fixes this now works as expected.
> > I added a patch to move messages from powernow-k8 after the initialization
> > phase, so it remains silent if driver loading fails.
> > 
> > I also rearranged the patches so that the powernow-k8 feature removal patch is
> > now the last one and is somewhat optional. I still prefer to have it in,
> > but it can be dropped if needed. Then powernow-k8 will still support modern
> > AMD CPUs, but will emit a warning message.
> > 
> > Regards,
> > Andre
> > 
> > Changes from v1:
> > * added hints to Kconfig about CPU support
> > * merge documentation from separate patch into the feature patch
> > * add deprecation warning
> > * prefix acpi-cpufreq warning messages with module name
> > * bugfix: avoid boost init it driver registration failed
> > * bugfix: fix module redirect request call (was not reached before)
> 
> I have applied the whole series to the linux-next branch of the linux-pm.git
> tree, but I'm quite unsure about [7/8].  Is it really necessary?  I mean, since
> we want users to switch to a different driver anyway, which already has a knob
> providing the functionality in question, what's the point really?

Afaik this was mostly for compiler people or other developers doing
benchmarks to be able to avoid fluctating numbers caused by turbo/boost
mode.

I don't know whether it's used by any userspace tool. If, it would certainly
be an AMD specific tool for developers. If you (AMD) know a userspace tool
out there it may make sense to keep it the one or other kernel round,
otherwise I guess it can simply be deleted.

I will add the functionality (to enable/disable turbo/boost mode)
to cpupower userspace tool as soon as this is in.
Shouldn't be much more than a -t option and a
one liner to read out or set another cpufreq sysfs file.

   Thomas
