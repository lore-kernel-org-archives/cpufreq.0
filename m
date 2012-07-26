From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH 0/8] acpi-cpufreq: Move modern AMD cpufreq support to acpi-cpufreq
Date: Thu, 26 Jul 2012 16:01:22 +0200
Message-ID: <201207261601.23973.trenn@suse.de>
References: <1343305724-2809-1-git-send-email-andre.przywara@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1343305724-2809-1-git-send-email-andre.przywara@amd.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Andre Przywara <andre.przywara@amd.com>
Cc: cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Matthew Garrett <mjg@redhat.com>, Andreas Herrmann <andreas.herrmann3@amd.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday, July 26, 2012 02:28:36 PM Andre Przywara wrote:
> The programming model for cpufreq on current AMD CPUs is almost
> identical to the one used on Intel and VIA hardware. This patchset
> merges support into acpi-cpufreq and removes it from powernow-k8.
 
> This patchset is heavily based on Matthew Garrett's V4 from last July.
> The boosting part has been mostly reworked and documentation for it
> has been added. Also there was a need for (yet another) BIOS quirk
> on AMD desktop boards.
> 
> Signed-off-by: Andre Przywara <andre.przywara@amd.com>

I had a look at Matthew's patches and I like the idea.

I didn't review Andre's in detail, but if they are based on
Matthew's and I expect they got some testing, I guess it should
be fine to push them with the next merge window.

  Thomas
