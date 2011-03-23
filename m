From: Thomas Renninger <trenn@suse.de>
Subject: Re: [ANNOUNCE] cpupowerutils - cpufrequtils extended with quite some features
Date: Wed, 23 Mar 2011 11:29:09 +0100
Message-ID: <201103231129.10249.trenn@suse.de>
References: <201103111247.00212.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201103111247.00212.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org
Cc: cpufreq@vger.kernel.org, linux@dominikbrodowski.net, Len Brown <lenb@kernel.org>, herrmann.der.user@googlemail.com

Hi Linus, hi Len,

it would be great to get this tool pulled into:
tools/power/cpupower

All that is needed should be to push (old git history should better
be left out):
wget http://gitorious.org/cpupowerutils/cpupowerutils/archive-
tarball/cpupowerutils cpupowerutils.tar.gz
into tools/power/cpupower
and add to MAINTAINERS file:

CPU POWER MONITORING SUBSYSTEM
M:      Dominik Brodowski <linux@dominikbrodowski.net>
M:      Thomas Renninger <trenn@suse.de>
S:      Maintained
F:      tools/power/cpupower

Could this still show up in 2.6.39?

Thanks,

    Thomas



On Friday, March 11, 2011 12:46:59 PM Thomas Renninger wrote:
> Hi,
> 
...
> What is this tool doing?
> ------------------------
> 
> It provides all features cpufrequtils does.
> It got enhanced with cpuidle and turbo/boost mode (on X86) statistics.
> On AMD the exact amount of supported boost states and their frequencies
> are shown. On Intel only turbo/boost support is shown.
> 
> It got enhanced with a generic HW monitor tool (cpupower monitor).
...
> 
> What next?
> ----------
> 
> After some testing phase it would be great to get this tool
> merged into the kernel git repo under:
> tools/power/cpupower
