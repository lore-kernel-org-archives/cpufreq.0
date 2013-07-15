From: Rob Herring <robherring2@gmail.com>
Subject: Re: [RFC PATCH 02/11] ARM: DT/kernel: define ARM specific arch_of_get_cpu_node
Date: Mon, 15 Jul 2013 14:10:59 -0500
Message-ID: <51E44943.7000600@gmail.com>
References: <1373883732-26303-1-git-send-email-Sudeep.KarkadaNagesha@arm.com> <1373883732-26303-3-git-send-email-Sudeep.KarkadaNagesha@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=5o0RltoBVy3FW0hEYFJP15qPY+vwPQ1bb2q1Xz52zmg=;
        b=CdjRPRlVhTX4ymX5amPxokIxUFsdc34w0b3SbN3g7yv3Zhtu4gA33qFhP15iKRXbKy
         DzWCusO8f++S0d4RnDr+/ybX7wxtqr8ebeip6UXxPJ3RvrJmKhlsHUsFGhUgiEaw8NNs
         3jzzxKRlpGqfbQZvCXOogi4gaXGXGZKEby8w6QsTfqIaFXxUEQbfc70LK4byI2WyRkdt
         UciErSr0SHjs1+lS5yccG6eeD6qN7wB+WIoewdNV4MJK7jBFsNb73LDD8lJj2pKu2fRv
         d0XgG/FyYK8Eoq2iDmQf9y1nCZAc70U99xNeW9yNOa7Zi7Qd9a/haCMIBlfchbJ6GbMp
         JB7w==
In-Reply-To: <1373883732-26303-3-git-send-email-Sudeep.KarkadaNagesha@arm.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sudeep.KarkadaNagesha@arm.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lorenzo.pieralisi@arm.com, linux@arm.linux.org.uk, arnd@arndb.de, viresh.kumar@linaro.org, rob.herring@calxeda.com, rjw@sisk.pl, grant.likely@linaro.org, cpufreq@vger.kernel.org, kernel@pengutronix.de, gregkh@linuxfoundation.org, olof@lixom.net, gregory.clement@free-electrons.com, shawn.guo@linaro.org

On 07/15/2013 05:22 AM, Sudeep.KarkadaNagesha@arm.com wrote:
> From: Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>
> 
> CPU subsystem now provides architecture specific hook to retrieve the
> of_node. Most of the cpu DT node parsing and initialisation is contained
> in devtree.c. It's better to contain all CPU device node parsing there.
> 
> arch_of_get_cpu_node is mainly used to assign cpu->of_node when CPUs get
> registered. This patch overrides the defination of the same. It can also
> act as the helper function in pre-SMP/early initialisation stages to
> retrieve CPU device node pointers in logical ordering.
> 
> This mainly helps to avoid replication of the code doing CPU node parsing
> and physical(MPIDR) to logical mapping.
> 
> Signed-off-by: Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>

[snip]

> +struct device_node * __init arch_of_get_cpu_node(int cpu)
> +{
> +	struct device_node *cpun, *cpus;
> +	const u32 *cell;
> +	u64 hwid;
> +	int ac;
> +
> +	cpus = of_find_node_by_path("/cpus");
> +	if (WARN(!cpus, "Missing cpus node, bailing out\n"))
> +		return NULL;
> +
> +	if (WARN_ON(of_property_read_u32(cpus, "#address-cells", &ac)))
> +		ac = of_n_addr_cells(cpus);
> +
> +	for_each_child_of_node(cpus, cpun) {
> +		if (of_node_cmp(cpun->type, "cpu"))
> +			continue;
> +		cell = of_get_property(cpun, "reg", NULL);
> +		if (WARN(!cell, "%s: missing reg property\n", cpun->full_name))
> +			continue;
> +
> +		hwid = of_read_number(cell, ac);
> +		if ((hwid & MPIDR_HWID_BITMASK) == cpu_logical_map(cpu))

Most of this function is not ARM specific, so it would be nice if we
could shrink the arch specific part down to just this match. A default
match of reg == logical cpu number might be useful.

The powermac cpufreq driver could probably also be converted
(arch/powerpc/platforms/powermac/cpufreq_64.c).

Other than that, this series looks good to me.

Rob

