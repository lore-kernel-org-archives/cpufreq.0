From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v5 1/3] ARM: shmobile: sh73a0: add support for adjusting
 CPU frequency
Date: Thu, 18 Apr 2013 22:52:21 +0900
Message-ID: <20130418135221.GM20929@verge.net.au>
References: <1365156038-12467-1-git-send-email-g.liakhovetski@gmx.de>
 <1365156038-12467-2-git-send-email-g.liakhovetski@gmx.de>
Mime-Version: 1.0
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1365156038-12467-2-git-send-email-g.liakhovetski@gmx.de>
Sender: linux-sh-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>

On Fri, Apr 05, 2013 at 12:00:36PM +0200, Guennadi Liakhovetski wrote:
> On SH73A0 the output of PLL0 is supplied to two dividers, feeding clock to
> the CPU core and SGX. Lower CPU frequencies allow the use of lower supply
> voltages and thus reduce power consumption.
> 
> Signed-off-by: Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>
> ---
> 
> v5: not based on MSTP-waiting rework, it needs more work
> 
>  arch/arm/mach-shmobile/clock-sh73a0.c |   95 ++++++++++++++++++++++++++++++++-
>  1 files changed, 93 insertions(+), 2 deletions(-)

Thanks, queued-up for v3.11 in the soc-sh73a0 branch. 
