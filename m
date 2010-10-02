From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 3/3] cpupowerutils: cpufreq-bench must link against
 libcpupower
Date: Sat, 2 Oct 2010 12:36:36 +0200
Message-ID: <20101002103636.GC2002@comet.dominikbrodowski.net>
References: <201009281306.28835.trenn@suse.de>
 <1285672408-26839-4-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1285672408-26839-4-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@vger.kernel.org

Applied, thanks.

On Tue, Sep 28, 2010 at 01:13:28PM +0200, Thomas Renninger wrote:
> Signed-off-by: Thomas Renninger <trenn@suse.de>
> CC: linux@dominikbrodowski.net
> CC: cpufreq@vger.kernel.org
> ---
>  bench/Makefile |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/bench/Makefile b/bench/Makefile
> index 3d8fa21..9f3b195 100644
> --- a/bench/Makefile
> +++ b/bench/Makefile
> @@ -1,4 +1,4 @@
> -LIBS = -L../ -lm -lcpufreq
> +LIBS = -L../ -lm -lcpupower
>  
>  OBJS = main.o parse.o system.o benchmark.o
>  CFLAGS += -D_GNU_SOURCE -I../lib -DDEFAULT_CONFIG_FILE=\"$(confdir)/cpufreq-bench.conf\"
> -- 
> 1.6.4.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
