From: Andy Lutomirski <luto@MIT.EDU>
Subject: Re: [PATCH v4 3/7] acpi-cpufreq: Add support for disabling dynamic
 overclocking
Date: Sat, 23 Jul 2011 23:06:29 -0400
Message-ID: <4E2B8C35.7030304@mit.edu>
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

How is this different from setting 3400000 vs 3401000 as the max freq? 
(I'm probably missing something about the way that Intel's turbo mode 
works.)

> +static ssize_t store_cpb(struct cpufreq_policy *policy, const char *buf,
> +			 size_t count)
> +{
> +	int ret = -EINVAL;
> +	unsigned long val = 0;
> +
> +	ret = strict_strtoul(buf, 10,&val);
> +	if (!ret&&  (val == 0 || val == 1)&&  cpb_supported)
> +		cpb_toggle(val);

Shouldn't this set the flag only on policy->cpu (as opposed to all 
online cpus?)

Also, you're missing a space before &&.

--Andy
