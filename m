From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] Add cpufreq driver for Momentum Maple boards
Date: Fri, 17 Jun 2011 11:17:14 +0200
Message-ID: <201106171117.14794.arnd@arndb.de>
References: <1308284088.32158.0.camel@pasglop> <1308300556-4463-1-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1308300556-4463-1-git-send-email-dbaryshkov@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linuxppc-dev@lists.ozlabs.org
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, davej@redhat.com, paulus@samba.org, cpufreq@vger.kernel.org

On Friday 17 June 2011 10:49:16 Dmitry Eremin-Solenikov wrote:
> Add simple cpufreq driver for Maple-based boards (ppc970fx evaluation
> kit and others). Driver is based on a cpufreq driver for 64-bit powermac
> boxes with all pmac-dependant features removed and simple cleanup
> applied.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  arch/powerpc/kernel/misc_64.S          |    4 +-
>  arch/powerpc/platforms/Kconfig         |    8 +
>  arch/powerpc/platforms/maple/Makefile  |    1 +
>  arch/powerpc/platforms/maple/cpufreq.c |  317 ++++++++++++++++++++++++++++++++
>  4 files changed, 328 insertions(+), 2 deletions(-)
>  create mode 100644 arch/powerpc/platforms/maple/cpufreq.c
> 


I think new cpufreq drivers should live in drivers/cpufreq, not in arch/. We've
started moving other drivers away from arch/x86 and arch/arm already.

The code itself looks good.

	Arnd
