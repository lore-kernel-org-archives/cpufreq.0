From: bert hubert <bert.hubert@netherlabs.nl>
Subject: Re: 2.6.17 -> 2.6.18 regression: cpufreq broken since 2.6.18-rc1 on	pentium4
Date: Mon, 31 Jul 2006 20:57:13 +0200
Message-ID: <20060731185713.GA16797@outpost.ds9a.nl>
References: <20060730120844.GA18293@outpost.ds9a.nl> <20060730160738.GB13377@irc.pl> <20060730165137.GA26511@outpost.ds9a.nl> <44CCF556.2060505@linux.intel.com> <20060730184443.GA30067@outpost.ds9a.nl> <20060730190133.GD18757@redhat.com> <20060731070800.GA22205@outpost.ds9a.nl> <20060731162046.GA4631@redhat.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030323AbWGaS5d@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060731162046.GA4631@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>, linux-kernel@vger.kernel.org, zwane@arm.linux.org.uk, venkatesh.pallipadi@intel.com, tony@atomide.com, akpm@osdl.org, cpufreq@lists.linux.org.uk, len.brown@intel.com

On Mon, Jul 31, 2006 at 12:20:46PM -0400, Dave Jones wrote:

> Your change in your previous mail makes sense to me though,
> so I'll commit it to cpufreq.git later today.

Do you think this will make 2.6.18? Otherwise any kernel with acpi_list
compiled in will have no frequency scaling, unless it supports scaling over
ACPI.

Thanks!

-- 
http://www.PowerDNS.com      Open source, database driven DNS Software 
http://netherlabs.nl              Open and Closed source services
