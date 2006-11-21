From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: Bug: Pentium M not always detected by CPUFREQ
Date: Tue, 21 Nov 2006 18:00:12 +0100
Message-ID: <1164128412.31358.680.camel@laptopd505.fenrus.org>
References: <200611211646.29488.hs4233@mail.mn-solutions.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1031076AbWKURAS@vger.kernel.org>
In-Reply-To: <200611211646.29488.hs4233@mail.mn-solutions.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Holger Schurig <hs4233@mail.mn-solutions.de>
Cc: linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

On Tue, 2006-11-21 at 16:46 +0100, Holger Schurig wrote:
> Hi !
> 
> One module thinks that I have a Pentium M, the other doesn't. 
> Which module is right?

> model name      : Intel(R) Celeron(R) processor            600MHz
> stepping        : 5
> cpu MHz         : 598.093
> cache size      : 64 KB
> fdiv_bug        : no
> hlt_bug         : no
> f00f_bug        : no
> coma_bug        : no
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 2
> wp              : yes
> flags           : fpu vme de pse tsc msr mce cx8 apic sep mtrr 
> pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 tm pbe
> bogomips        : 1196.88
> 
> 
> So far I can only say that speedstep-centrino doesn't have an 
> entry for a CPU with a mere 600 MHz. May this be the problem?
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
-- 
if you want to mail me at work (you don't), use arjan (at) linux.intel.com
Test the interaction between Linux and your BIOS via http://www.linuxfirmwarekit.org
