From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH]gx-suspmod.c use boot_cpu_data instead of
 current_cpu_data
Date: Tue, 24 Jul 2007 23:40:45 -0700
Message-ID: <20070724234045.2cec5525.akpm@linux-foundation.org>
References: <20070725141905.GA4567@darkstar.te-china.tietoenator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1763511AbXGYGln@vger.kernel.org>
In-Reply-To: <20070725141905.GA4567@darkstar.te-china.tietoenator.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Young <hidave.darkstar@gmail.com>
Cc: linux-kernel@vger.kernel.org, Dave Jones <davej@codemonkey.org.uk>, cpufreq@www.linux.org.uk

On Wed, 25 Jul 2007 14:19:05 +0000 Dave Young <hidave.darkstar@gmail.com> wrote:

> Hi,
> in preemptible kernel will report BUG: using smp_processor_id() in preemptible, so use boot_cpu_data instead of current_cpu_data.
> 
> Signed-off-by: Dave Young <hidave.darkstar@gmail.com> 
> 
> ---
> arch/i386/kernel/cpu/cpufreq/gx-suspmod.c |    4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff -pur linux/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c linux.new/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c
> --- linux/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c	2007-07-25 14:11:06.000000000 +0000
> +++ linux.new/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c	2007-07-25 13:57:29.000000000 +0000
> @@ -181,8 +181,8 @@ static __init struct pci_dev *gx_detect_
>  	struct pci_dev *gx_pci = NULL;
>  
>  	/* check if CPU is a MediaGX or a Geode. */
> -	if ((current_cpu_data.x86_vendor != X86_VENDOR_NSC) &&
> -	    (current_cpu_data.x86_vendor != X86_VENDOR_CYRIX)) {
> +	if ((boot_cpu_data.x86_vendor != X86_VENDOR_NSC) &&
> +	    (boot_cpu_data.x86_vendor != X86_VENDOR_CYRIX)) {
>  		dprintk("error: no MediaGX/Geode processor found!\n");
>  		return NULL;
>  	}

um, I suspect it really wants to get at the current CPU.  But putting a
preempt_disable() around just that code is meaningless: the current CPU
could change immediately before or after the code block. It needs deeper
fixing, methinks.
