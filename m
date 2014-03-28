From: Jean Delvare <jdelvare@suse.de>
Subject: Move of powerpc/cell cpufreq drivers
Date: Fri, 28 Mar 2014 10:26:16 +0100
Message-ID: <20140328102616.20b45a0a@endymion.delvare>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, cpufreq@vger.kernel.org

Hi all,

In this commit:

commit 6eb1c377423572374518f5be93214d139d113090
Author: Viresh Kumar
Date:   Mon Mar 25 11:20:23 2013 +0530

    cpufreq: powerpc/platforms/cell: move cpufreq driver to drivers/cpufreq

the cbe_cpufreq_pmi and cbe-cpufreq drivers were moved and renamed,
together with their respective Kconfig symbols. In the move,
tristate CBE_CPUFREQ_PMI became bool CPU_FREQ_CBE_PMI. This makes it
impossible to build the ppc_cbe_cpufreq_pmi driver as a module, while
that was possible before the move.

I see nothing in the commit message that would suggest that this change
was intentional. Instead I suspect this is a mistake and
CPU_FREQ_CBE_PMI was actually supposed to be a tristate. As a matter of
fact, ppc_cbe_cpufreq.h includes this check:
  #if defined(CONFIG_CPU_FREQ_CBE_PMI) || defined(CONFIG_CPU_FREQ_CBE_PMI_MODULE)
so it is seems expected that CPU_FREQ_CBE_PMI can be set to m.

The current situation is kind of odd, because CPU_FREQ_CBE_PMI (bool)
depends on CPU_FREQ_CBE (tristate) so it is possible to have
CPU_FREQ_CBE=m and CPU_FREQ_CBE_PMI=y. If ppc_cbe_cpufreq_pmi really
depends on ppc_cbe_cpufreq, then that will fail, as ppc_cbe_cpufreq as
a module may not be loaded when ppc_cbe_cpufreq_pmi is initialized. The
compiler would complain about missing symbols. So I suspect this
dependency doesn't actually exist, otherwise after one year someone
would have noticed the build breakage, right?

As a conclusion I believe the following changes should be applied:
* CPU_FREQ_CBE_PMI should be changed to a tristate.
* CPU_FREQ_CBE_PMI should not depend on CPU_FREQ_CBE.

I can write and submit the patches once it is confirmed that this
changes are the right way to fix the problem.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
