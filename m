From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 01/10] cpufreq: OMAP: cleanup for multi-SoC support,
 move into drivers/cpufreq
Date: Thu, 22 Sep 2011 14:53:54 -0700
Message-ID: <20110922215354.GV2937@atomide.com>
References: <1316725648-26710-1-git-send-email-khilman@ti.com>
 <1316725648-26710-2-git-send-email-khilman@ti.com>
Mime-Version: 1.0
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1316725648-26710-2-git-send-email-khilman@ti.com>
Sender: linux-omap-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Hilman <khilman@ti.com>
Cc: cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>, Nishanth Menon <nm@ti.com>, linux-omap@vger.kernel.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, linux-arm-kernel@lists.infradead.org, Rajendra Nayak <rnayak@ti.com>

* Kevin Hilman <khilman@ti.com> [110922 13:35]:
> From: Santosh Shilimkar <santosh.shilimkar@ti.com>
> 
> Move OMAP cpufreq driver from arch/arm/mach-omap2 into
> drivers/cpufreq, along with a few cleanups:
> 
> - generalize support for better handling of different SoCs in the OMAP
> - use OPP layer instead of OMAP clock internals for frequency table init
> 
> Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
> [khilman@ti.com: move to drivers]
> Signed-off-by: Kevin Hilman <khilman@ti.com>

Nice to see this happening:

Acked-by: Tony Lindgren <tony@atomide.com>
