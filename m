From: bert hubert <bert.hubert@netherlabs.nl>
Subject: Re: 2.6.17 -> 2.6.18 regression: cpufreq broken since 2.6.18-rc1 on	pentium4
Date: Mon, 31 Jul 2006 09:08:01 +0200
Message-ID: <20060731070800.GA22205@outpost.ds9a.nl>
References: <20060730120844.GA18293@outpost.ds9a.nl> <20060730160738.GB13377@irc.pl> <20060730165137.GA26511@outpost.ds9a.nl> <44CCF556.2060505@linux.intel.com> <20060730184443.GA30067@outpost.ds9a.nl> <20060730190133.GD18757@redhat.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932507AbWGaHIX@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060730190133.GD18757@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>, linux-kernel@vger.kernel.org, zwane@arm.linux.org.uk, venkatesh.pallipadi@intel.com, tony@atomide.com, akpm@osdl.org, cpufreq@lists.linux.org.uk, len.brown@intel.com

> went ok.  I wonder if something changed in acpi recently that caused this
> change in behaviour ? Len ?

Dave,

I'm no expert but I think it was you that made this change in
http://kernel.org/git/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blobdiff;h=567b39bea07e4fbbe091b265b010905e3d30ff5a;hp=1a7bdcef19261deff5a7ea8ee13d5a8ddb434a19;hb=911cb74bb9e77e40749abc2fca6fe74d87d940f3;f=arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c

+ /* Do initialization in ACPI core */
+ acpi_processor_preregister_performance(acpi_perf_data);
+ return 0;
+}

:-)

-- 
http://www.PowerDNS.com      Open source, database driven DNS Software 
http://netherlabs.nl              Open and Closed source services
