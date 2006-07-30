From: Dave Jones <davej@redhat.com>
Subject: Re: 2.6.17 -> 2.6.18 regression: cpufreq broken since 2.6.18-rc1 on	pentium4
Date: Sun, 30 Jul 2006 15:01:33 -0400
Message-ID: <20060730190133.GD18757@redhat.com>
References: <20060730120844.GA18293@outpost.ds9a.nl> <20060730160738.GB13377@irc.pl> <20060730165137.GA26511@outpost.ds9a.nl> <44CCF556.2060505@linux.intel.com> <20060730184443.GA30067@outpost.ds9a.nl>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932430AbWG3TDM@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060730184443.GA30067@outpost.ds9a.nl>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bert hubert <bert.hubert@netherlabs.nl>, Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>, linux-kernel@vger.kernel.org, zwane@arm.linux.org.uk, venkatesh.pallipadi@intel.com, tony@atomide.com, akpm@osdl.org, cpufreq@lists.linux.org.uk, len.brown@intel.com

On Sun, Jul 30, 2006 at 08:44:43PM +0200, bert hubert wrote:
 
 > > Do you have any info in /sys/devices/system/cpu/cpu0/cpufreq ?
 > 
 > No, not with just acpi-cpufreq loaded. With the help of Zwane, I've
 > discovered that if I unload acpi-cpufreq, I *can* load p4-clockmod, and then
 > the directory you mention appears, and I can configure governors, and life
 > is good. This all on 2.6.18-rc3.

Right, cpufreq drivers aren't 'stackable'.

 > Do I understand correctly that acpi-cpufreq is supposed to offer comparable
 > features?

If the BIOS supports the relevant ACPI tables.

 > Perhaps acpi-cpufreq *has* loaded, but did not find the proper hooks, but
 > has now registered itself, thus blocking p4-clockmod? When everything is
 > in-kernel, acpi-cpufreq might register itself first, which would lead to the
 > same thing.

Normally, if the necessary BIOS bits aren't there, then acpi-cpufreq will
fail to register.  For some reason it sounds like it believes that everything
went ok.  I wonder if something changed in acpi recently that caused this
change in behaviour ? Len ?

		Dave

-- 
http://www.codemonkey.org.uk
