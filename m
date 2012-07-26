From: Andre Przywara <andre.przywara@amd.com>
Subject: [PATCH 0/8] acpi-cpufreq: Move modern AMD cpufreq support to acpi-cpufreq
Date: Thu, 26 Jul 2012 14:28:36 +0200
Message-ID: <1343305724-2809-1-git-send-email-andre.przywara@amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Matthew Garrett <mjg@redhat.com>, Andreas Herrmann <andreas.herrmann3@amd.com>, Thomas Renninger <trenn@suse.de>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@amd.com>

The programming model for cpufreq on current AMD CPUs is almost identical
to the one used on Intel and VIA hardware. This patchset merges support
into acpi-cpufreq and removes it from powernow-k8.

This patchset is heavily based on Matthew Garrett's V4 from last July.
The boosting part has been mostly reworked and documentation for it
has been added. Also there was a need for (yet another) BIOS quirk
on AMD desktop boards.

Signed-off-by: Andre Przywara <andre.przywara@amd.com>


