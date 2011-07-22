From: Borislav Petkov <bp@amd64.org>
Subject: Re: [PATCH v4 6/7] cpufreq: Remove support for hardware P-state
 chips from powernow-k8
Date: Fri, 22 Jul 2011 16:43:09 +0200
Message-ID: <20110722144309.GB26010@aftab>
References: <1311007062-2050-1-git-send-email-mjg@redhat.com>
 <1311007062-2050-7-git-send-email-mjg@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1311007062-2050-7-git-send-email-mjg@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Garrett <mjg@redhat.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "davej@redhat.com" <davej@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Langsdorf, Mark" <mark.langsdorf@amd.com>, "Herrmann3, Andreas" <Andreas.Herrmann3@amd.com>

On Mon, Jul 18, 2011 at 12:37:41PM -0400, Matthew Garrett wrote:

...

>         /* min/max the cpu is capable of */
> @@ -1334,18 +1165,10 @@ static int __cpuinit powernowk8_cpu_init(struct cpufreq_policy *pol)
>                 return -EINVAL;
>         }
> 
> -       /* Check for APERF/MPERF support in hardware */
> -       if (cpu_has(c, X86_FEATURE_APERFMPERF))
> -               cpufreq_amd64_driver.getavg = cpufreq_get_measured_perf;
> -

Btw, this makes cpufreq_get_measured_perf used only in acpi-cpufreq now
and <drivers/cpufreq/mperf.c> can be merged into acpi-cpufreq, thus
removing linking it into both drivers in <drivers/cpufreq/Makefile>.

Also, can you put the next set of patches in a git repo somewhere so
that I could pull them for testing instead of applying them one by one?

Thanks.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
GM: Alberto Bozzo
Reg: Dornach, Landkreis Muenchen
HRB Nr. 43632 WEEE Registernr: 129 19551
