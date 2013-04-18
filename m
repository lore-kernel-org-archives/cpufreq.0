From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v5 3/3] ARM: shmobile: sh73a0: add CPUFreq support
Date: Thu, 18 Apr 2013 22:52:12 +0900
Message-ID: <20130418135212.GL20929@verge.net.au>
References: <1365156038-12467-1-git-send-email-g.liakhovetski@gmx.de>
 <1365156038-12467-4-git-send-email-g.liakhovetski@gmx.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1365156038-12467-4-git-send-email-g.liakhovetski@gmx.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>

On Fri, Apr 05, 2013 at 12:00:38PM +0200, Guennadi Liakhovetski wrote:
> This patch enables the use of the generic cpufreq-cpu0 driver on sh73a0.
> Providing a regulator, a list of OPPs in DT, combined with a virtual
> cpufreq-cpu0 platform device and a clock, attached to it is everything,
> the cpufreq-cpu0 driver needs. The first sh73a0 platform, implementing
> such CPUFreq support is kzm9g-reference.
> 
> Signed-off-by: Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>
> ---
> 
> v5: remove sh73a0-kzm9g-reference.dts hunk, it's now merged into patch 2/3
> 
>  arch/arm/mach-shmobile/Kconfig        |    2 ++
>  arch/arm/mach-shmobile/setup-sh73a0.c |    5 +++++
>  2 files changed, 7 insertions(+), 0 deletions(-)

Thanks, queued-up for v3.11 in the soc-sh73a0 branch.
