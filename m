From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] CPU frequency display in /proc/cpuinfo
Date: Sun, 4 Dec 2005 17:43:35 +0100
Message-ID: <20051204164335.GB32492@isilmar.linta.de>
References: <20051202181927.GD9766@wotan.suse.de> <20051202104320.A5234@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932271AbVLDQni@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20051202104320.A5234@unix-os.sc.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Cc: Andi Kleen <ak@suse.de>, Andrew Morton <akpm@osdl.org>, Dave Jones <davej@redhat.com>, cpufreq <cpufreq@www.linux.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>

On Fri, Dec 02, 2005 at 10:43:20AM -0800, Venkatesh Pallipadi wrote:
> The patch below changes this to:
> Show the last known frequency of the particular CPU, when cpufreq is present. If
> cpu doesnot support changing of frequency through cpufreq, then boot frequency 
> will be shown. The patch affects i386, x86_64 and ia64 architectures.

Looks good to me -- however, might this affect userspace cpufreq tools? I'd
vote for quite some time in -mm for this patch (i.e. only merge for 2.6.17)

	Dominik
