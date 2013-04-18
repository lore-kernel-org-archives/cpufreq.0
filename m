From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v5 2/3] ARM: shmobile: kzm9g-reference: add AS3711 and
 CPUFreq DT bindings
Date: Thu, 18 Apr 2013 22:51:31 +0900
Message-ID: <20130418135131.GK20929@verge.net.au>
References: <1365156038-12467-1-git-send-email-g.liakhovetski@gmx.de>
 <1365156038-12467-3-git-send-email-g.liakhovetski@gmx.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1365156038-12467-3-git-send-email-g.liakhovetski@gmx.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>

On Fri, Apr 05, 2013 at 12:00:37PM +0200, Guennadi Liakhovetski wrote:
> This adds DT bindings for an AS3711 PMIC, used for supplying power to the
> CPU, some peripherals and the backlight, as well as extends the cpu0 DT
> node with OPPs and a reference to the PMIC to support the CPUFreq and
> CPU DVFS functions.
> 
> Signed-off-by: Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>
> ---
> 
> v5: make the sd1 regulator immediately suitable for CPUFreq instead of
> postponing it to an incremental patch.
> 
>  arch/arm/boot/dts/sh73a0-kzm9g-reference.dts |   86 ++++++++++++++++++++++++++
>  1 files changed, 86 insertions(+), 0 deletions(-)

Thanks, queued-up for v3.11 in the boards-kzm9g branch.
