From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Move of powerpc/cell cpufreq drivers
Date: Fri, 28 Mar 2014 19:02:32 +0100
Message-ID: <201403281902.33169.arnd@arndb.de>
References: <20140328102616.20b45a0a@endymion.delvare>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20140328102616.20b45a0a@endymion.delvare>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Jean Delvare <jdelvare@suse.de>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, cpufreq@vger.kernel.org

On Friday 28 March 2014, Jean Delvare wrote:

> The current situation is kind of odd, because CPU_FREQ_CBE_PMI (bool)
> depends on CPU_FREQ_CBE (tristate) so it is possible to have
> CPU_FREQ_CBE=m and CPU_FREQ_CBE_PMI=y. If ppc_cbe_cpufreq_pmi really
> depends on ppc_cbe_cpufreq, then that will fail, as ppc_cbe_cpufreq as
> a module may not be loaded when ppc_cbe_cpufreq_pmi is initialized. The
> compiler would complain about missing symbols. So I suspect this
> dependency doesn't actually exist, otherwise after one year someone
> would have noticed the build breakage, right?

I believe CPU_FREQ_CBE can be built with support for CPU_FREQ_CBE_PMI
or without, but if the PMI code is a module, then CPU_FREQ_CBE
cannot be 'y'.	

> As a conclusion I believe the following changes should be applied:
> * CPU_FREQ_CBE_PMI should be changed to a tristate.
> * CPU_FREQ_CBE_PMI should not depend on CPU_FREQ_CBE.
> 
> I can write and submit the patches once it is confirmed that this
> changes are the right way to fix the problem.

If you do this, you should also add

	depends on CPU_FREQ_CBE_PMI || !CPU_FREQ_CBE_PMI

to the CPU_FREQ_CBE option, to correctly handle the dependency.

I don't actually see a problem with the current code, other than
that CPU_FREQ_CBE_PMI could in theory be a module. This code is
used only for an IBM machine that has been end-of-service for
a couple of years. If anyone still wants to build kernels for
it, they probably want it built-in anyway, and not have
the same kernel run on other machines.

	Arnd
