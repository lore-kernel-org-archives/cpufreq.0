From: Andre Przywara <andre.przywara@amd.com>
Subject: [PATCH 0/8 v2] acpi-cpufreq: Move modern AMD cpufreq support to acpi-cpufreq
Date: Tue, 4 Sep 2012 10:28:01 +0200
Message-ID: <1346747289-8421-1-git-send-email-andre.przywara@amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>, Thomas Renninger <trenn@suse.de>
Cc: Matthew Garret <mjg@redhat.com>, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Herrmann <andreas.herrmann3@amd.com>

Hi,

now the second, revised version of the patch set. I now tested loading
both drivers after each other in several combinations, after two bug
fixes this now works as expected.
I added a patch to move messages from powernow-k8 after the initialization
phase, so it remains silent if driver loading fails.

I also rearranged the patches so that the powernow-k8 feature removal patch is
now the last one and is somewhat optional. I still prefer to have it in,
but it can be dropped if needed. Then powernow-k8 will still support modern
AMD CPUs, but will emit a warning message.

Regards,
Andre

Changes from v1:
* added hints to Kconfig about CPU support
* merge documentation from separate patch into the feature patch
* add deprecation warning
* prefix acpi-cpufreq warning messages with module name
* bugfix: avoid boost init it driver registration failed
* bugfix: fix module redirect request call (was not reached before)



