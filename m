From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/6] cpufreq: cpufreq-cpu0: allow optional safe voltage
 during frequency transitions
Date: Sun, 12 Jan 2014 14:39:48 +0100
Message-ID: <52D29B24.3070601@gmail.com>
References: <1389283165-17708-1-git-send-email-thomas.ab@samsung.com> <1389283165-17708-2-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=Rmj0z1ZWcXFQYaWrpDBtiVQX7lBXpCVyyuF9BJHzolI=;
        b=chQ4mePMfvZnHqsW/Z4fjA1HxA6eqglRR9BTlM2iggA6XicasHufAKVxnu7Aa+n9gS
         ekwHEgjjfnIIpFGMTCcrnIDHTrtXjrUaTJRHewudBc35CD0/ddI0sgCE/ksJsBYqSbOi
         mftEnZ1qIy1PChFUOYrglebNICqlyWpN8SNfvJ56wxHJUtShlg4IBASJq9/dS1FtnYbL
         xoxP7KDnAvymEKsCgg+z2/teMGEPizQmZOED3UzFF+R0pWsWGfJKi0svSFBtvAIBPUqi
         DQgxS+KNiDr/4XyjB569l21JfnWbaqhA4hie62ilx5vPkCtM3IhJ/nwz9QQ8xyxt+E+S
         AI6A==
In-Reply-To: <1389283165-17708-2-git-send-email-thomas.ab@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Abraham <ta.omasab@gmail.com>, cpufreq@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, kgene.kim@samsung.com, shawn.guo@linaro.org, viresh.kumar@linaro.org

Hi Thomas,

Please see my comments inline.

On 09.01.2014 16:59, Thomas Abraham wrote:
[snip]
> @@ -69,12 +71,26 @@ static int cpu0_set_target(struct cpufreq_policy *policy, unsigned int index)
>   		 new_freq / 1000, volt ? volt / 1000 : -1);
>
>   	/* scaling up?  scale voltage before frequency */
> -	if (!IS_ERR(cpu_reg) && new_freq > old_freq) {
> +	if (!IS_ERR(cpu_reg) && new_freq > old_freq &&
> +				new_freq >= safe_frequency) {
>   		ret = regulator_set_voltage_tol(cpu_reg, volt, tol);
>   		if (ret) {
>   			pr_err("failed to scale voltage up: %d\n", ret);
>   			return ret;
>   		}
> +	} else if (!IS_ERR(cpu_reg) && old_freq < safe_frequency) {
> +		/*
> +		 * the scaled up voltage level for the new_freq is lower
> +		 * than the safe voltage level. so set safe_voltage
> +		 * as the intermediate voltage level and revert it
> +		 * back after the frequency has been changed.
> +		 */
> +		ret = regulator_set_voltage(cpu_reg, safe_voltage,
> +						safe_voltage);

Shouldn't the tolerance be used here as well?

> +		if (ret) {
> +			pr_err("failed to set safe voltage: %d\n", ret);
> +			return ret;
> +		}
>   	}
>
>   	ret = clk_set_rate(cpu_clk, freq_exact);
> @@ -94,6 +110,19 @@ static int cpu0_set_target(struct cpufreq_policy *policy, unsigned int index)
>   		}
>   	}
>
> +	/*
> +	 * if safe voltage was applied during voltage scale up, then set
> +	 * the correct target voltage now.
> +	 */
> +	if (!IS_ERR(cpu_reg) && new_freq > old_freq &&
> +					new_freq < safe_frequency) {
> +		ret = regulator_set_voltage_tol(cpu_reg, volt, tol);
> +		if (ret) {
> +			pr_err("failed to scale voltage up: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +

I believe that it would be enough to reuse the if block of scaling down 
instead of repeating the same code, just the condition must be slightly 
modified:

-	/* scaling down?  scale voltage after frequency */
-	if (!IS_ERR(cpu_reg) && new_freq < old_freq) {
+	/*
+	 * scaling down or below safe frequency?
+	 * scale voltage after frequency
+	 */
+	if (!IS_ERR(cpu_reg)
+	    && (new_freq < old_freq || new_freq < safe_frequency)) {

Best regards,
Tomasz
