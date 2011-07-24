From: Andy Lutomirski <luto@MIT.EDU>
Subject: Re: [PATCH v4 3/7] acpi-cpufreq: Add support for disabling dynamic
 overclocking
Date: Sat, 23 Jul 2011 23:15:02 -0400
Message-ID: <4E2B8E36.6030308@mit.edu>
References: <1311007062-2050-1-git-send-email-mjg@redhat.com> <1311007062-2050-4-git-send-email-mjg@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1311007062-2050-4-git-send-email-mjg@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthew Garrett <mjg@redhat.com>
Cc: cpufreq@vger.kernel.org, davej@redhat.com, linux-kernel@vger.kernel.org, borislav.petkov@amd.com, mark.langsdorf@amd.com, andreas.herrmann3@amd.com

On 07/18/2011 12:37 PM, Matthew Garrett wrote:
> One feature present in powernow-k8 that isn't present in acpi-cpufreq is
> support for enabling or disabling AMD's core performance boost technology.
> This patch adds that support to acpi-cpufreq, but also extends it to allow
> Intel's dynamic acceleration to be disabled via the same interface. The
> sysfs entry retains the cpb name for compatibility purposes.
>
> Signed-off-by: Matthew Garrett<mjg@redhat.com>
> ---
>   drivers/cpufreq/acpi-cpufreq.c |  191 ++++++++++++++++++++++++++++++++++++++++
>   1 files changed, 191 insertions(+), 0 deletions(-)
>

> +			if (enable)
> +				reg->q&= ~MSR_IA32_MISC_ENABLE_TURBO_DISABLE;
> +			else
> +				reg->q |= MSR_IA32_MISC_ENABLE_TURBO_DISABLE;
> +		}

I was curious and looked it up.  Intel SDM volume 3, 14.3.2.1 says:

Opportunistic processor performance operation can be disabled by setting 
bit 38 of
IA32_MISC_ENABLE. This mechanism is intended for BIOS only. If
IA32_MISC_ENABLE[38] is set, CPUID.06H:EAX[1] will return 0.

and the next section says:

System software can temporarily disengage opportunistic processor 
performance
operation by setting bit 32 of the IA32_PERF_CTL MSR (0199H), using a read-
modify-write sequence on the MSR.

Would that be a better way to control boost mode on Intel chips?

--Andy
