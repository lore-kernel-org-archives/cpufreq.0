From: David C Niemi <dniemi@verisign.com>
Subject: Re: [PATCH] cpufreq: Add documentation for sampling_down_factor
Date: Tue, 25 Jan 2011 09:03:40 -0500
Message-ID: <4D3ED83C.4030707@verisign.com>
References: <1295951583-19997-1-git-send-email-vishwanath.bs@ti.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1295951583-19997-1-git-send-email-vishwanath.bs@ti.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vishwanath BS <vishwanath.bs@ti.com>
Cc: cpufreq@vger.kernel.org, patches@linaro.org

Thanks for taking this on.

I wrote this when talking about the patch as a proposed change, now that
it is the status quo, I think the second sentence needs to be adjusted a
bit as follows:

"Set it to 1 it makes no changes from existing behavior," ->
"When set to 1 (the default) decisions to reevaluate load are made at
the same interval regardless of current clock speed;"

DCN

Vishwanath BS wrote:
> Update cpufreq governor documentation for sampling_down_factor tunable
> parameter.
>
> Signed-off-by: Vishwanath BS <vishwanath.bs@ti.com>
> ---
>  Documentation/cpu-freq/governors.txt |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
>
> diff --git a/Documentation/cpu-freq/governors.txt b/Documentation/cpu-freq/governors.txt
> index 737988f..ef570ff
> --- a/Documentation/cpu-freq/governors.txt
> +++ b/Documentation/cpu-freq/governors.txt
> @@ -158,6 +158,16 @@ intensive calculation on your laptop that you do not care how long it
>  takes to complete as you can 'nice' it and prevent it from taking part
>  in the deciding process of whether to increase your CPU frequency.
>  
> +sampling_down_factor: this parameter controls the rate at which the
> +kernel makes a decision on when to decrease the frequency while running
> +at top speed. Set to 1 it makes no changes from existing behavior,
> +but set to greater than 1 (e.g. 100) it acts as a multiplier for the
> +scheduling interval for reevaluating load when the CPU is at its top
> +speed due to high load. This improves performance by reducing the overhead
> +of load evaluation and helping the CPU stay at its top speed when truly
> +busy, rather than shifting back and forth in speed. This tunable has no
> +effect on behavior at lower speeds/lower CPU loads.
> +
>  
>  2.5 Conservative
>  ----------------
>   

